import 'dart:io';
import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:climblog_mobile/Riverpod/connectivity_riverpod.dart';
import 'package:climblog_mobile/Riverpod/image_riverpod.dart';
import 'package:climblog_mobile/Services/Api_connections/image_segmentation_api_service.dart';
import 'package:climblog_mobile/Widgets/Shared/basic_container.dart';
import 'package:climblog_mobile/models/cords.dart';
import 'package:climblog_mobile/models/holds_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

class Circle {
  final Offset center; 
  final double radius; 
  Circle({required this.center, required this.radius});
}

class RouteImageDialog extends ConsumerStatefulWidget {
  const RouteImageDialog({super.key});

  @override
  ConsumerState<RouteImageDialog> createState() => _RouteImageDialogState();
}

class _RouteImageDialogState extends ConsumerState<RouteImageDialog> {
  bool _isInDrawingMode = false;
  bool _isInCircleMode = false;
  bool _isInPredictMode = false;
  bool _isLoading = false;
  bool _isGrayScaleMode = false;
  
  List<HoldsModel> _allHoldsFromApi = [];
  Set<int> _selectedHoldIndices = {};
  ui.Image? _decodedImage;
  final GlobalKey _imageKey = GlobalKey();
  
  final List<List<Offset>> _freehandStrokes = [];
  List<Offset> _currentStroke = [];
  bool _isDrawing = false;
  
  final List<Circle> _circles = [];
  Circle? _currentCircle;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final image = ref.read(imageFileProvider);
    if (image == null) return;

    final bytes = await image.readAsBytes();
    final codec = await ui.instantiateImageCodec(bytes);
    final frame = await codec.getNextFrame();
    
    if (mounted) {
      setState(() {
        _decodedImage = frame.image;
      });
    }
  }

  Offset _displayToOriginalCoordinates(Offset displayPosition, Size displaySize) {
    if (_decodedImage == null) return Offset.zero;

    final scaleX = displaySize.width / _decodedImage!.width;
    final scaleY = displaySize.height / _decodedImage!.height;
    final scale = scaleX < scaleY ? scaleX : scaleY;

    final scaledImageWidth = _decodedImage!.width * scale;
    final scaledImageHeight = _decodedImage!.height * scale;
    final offsetX = (displaySize.width - scaledImageWidth) / 2;
    final offsetY = (displaySize.height - scaledImageHeight) / 2;

    final originalX = (displayPosition.dx - offsetX) / scale;
    final originalY = (displayPosition.dy - offsetY) / scale;

    return Offset(originalX, originalY);
  }

  void _handlePointerDown(PointerDownEvent event, Size displaySize) {
    if (_decodedImage == null || _isGrayScaleMode) return;

    final originalPos = _displayToOriginalCoordinates(event.localPosition, displaySize);

    if (_isInDrawingMode) {
      setState(() {
        _isDrawing = true;
        _currentStroke = [originalPos];
      });
    } else if (_isInCircleMode) {
      setState(() {
        _currentCircle = Circle(center: originalPos, radius: 0);
      });
    } else {
      _onTapImage(event.localPosition, displaySize);
    }
  }

  void _handlePointerMove(PointerMoveEvent event, Size displaySize) {
    if (_decodedImage == null || _isGrayScaleMode) return;

    final originalPos = _displayToOriginalCoordinates(event.localPosition, displaySize);

    if (_isInDrawingMode && _isDrawing) {
      setState(() => _currentStroke.add(originalPos));
    } else if (_isInCircleMode && _currentCircle != null) {
      final dx = originalPos.dx - _currentCircle!.center.dx;
      final dy = originalPos.dy - _currentCircle!.center.dy;
      final radius = math.sqrt(dx * dx + dy * dy);
      setState(() {
        _currentCircle = Circle(center: _currentCircle!.center, radius: radius);
      });
    }
  }

  void _handlePointerUp(PointerUpEvent event) {
    if (_decodedImage == null || _isGrayScaleMode) return;

    if (_isInDrawingMode && _isDrawing) {
      setState(() {
        _isDrawing = false;
        if (_currentStroke.length >= 3) {
          _freehandStrokes.add(List.from(_currentStroke));
        }
        _currentStroke.clear();
      });
    } else if (_isInCircleMode && _currentCircle != null) {
      if (_currentCircle!.radius > 3) { 
        setState(() {
          _circles.add(_currentCircle!);
        });
      }
      setState(() => _currentCircle = null);
    }
  }

  void _onTapImage(Offset localPosition, Size displaySize) {
    if (_allHoldsFromApi.isEmpty || _decodedImage == null || _isGrayScaleMode) return;
    if (_isInDrawingMode || _isInCircleMode) return;

    final scaleX = displaySize.width / _decodedImage!.width;
    final scaleY = displaySize.height / _decodedImage!.height;
    final scale = scaleX < scaleY ? scaleX : scaleY;

    final scaledImageWidth = _decodedImage!.width * scale;
    final scaledImageHeight = _decodedImage!.height * scale;
    final offsetX = (displaySize.width - scaledImageWidth) / 2;
    final offsetY = (displaySize.height - scaledImageHeight) / 2;

    final originalX = (localPosition.dx - offsetX) / scale;
    final originalY = (localPosition.dy - offsetY) / scale;

    int? clickedIndex;
    for (int i = _allHoldsFromApi.length - 1; i >= 0; i--) {
      if (_isPointInPolygon(originalX, originalY, _allHoldsFromApi[i].array)) {
        clickedIndex = i;
        break;
      }
    }

    if (clickedIndex != null) {
      setState(() {
        if (_selectedHoldIndices.contains(clickedIndex)) {
          _selectedHoldIndices.remove(clickedIndex);
        } else {
          _selectedHoldIndices.add(clickedIndex!);
        }
      });
    }
  }

  bool _isPointInPolygon(double x, double y, List<Cords> polygon) {
    if (polygon.length < 3) return false;
  // Ray casting algorithm
    bool inside = false;
    int j = polygon.length - 1;

    for (int i = 0; i < polygon.length; i++) {
      final xi = polygon[i].x;
      final yi = polygon[i].y;
      final xj = polygon[j].x;
      final yj = polygon[j].y;

      if ((yi > y) != (yj > y) &&
          x < (xj - xi) * (y - yi) / (yj - yi) + xi) {
        inside = !inside;
      }
      j = i;
    }

    return inside;
  }

  void _toggleGrayScaleMode() {
    setState(() {
      _isGrayScaleMode = !_isGrayScaleMode;
      if (_isGrayScaleMode) {
        _isInDrawingMode = false;
        _isInCircleMode = false;
        _currentStroke.clear();
        _currentCircle = null;
      }
    });
  }

  bool _hasSelections() {
    return _selectedHoldIndices.isNotEmpty || 
           _freehandStrokes.isNotEmpty || 
           _circles.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final image = ref.watch(imageFileProvider);
    
    if (image == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          Navigator.of(context).pop();
        }
      });
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          "Select Holds",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color(0xFF2C3E50),
          ),
        ),
       
        BasicContainer(
          color: const ui.Color.fromARGB(255, 227, 228, 230),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: _isLoading ? null : () async {
                  final isConnected = await ref.read(connectivityProvider.future); 
                  if(isConnected){
                    setState(() {
                    _isInCircleMode = false;
                    _isInDrawingMode = false;
                    _isInPredictMode = true;
                    _isGrayScaleMode = false;
                    _isLoading = true;
                  });
                  
                  try {
                    if(_allHoldsFromApi.isEmpty){
                    final apiSegmentation = ImageSegmentationAPi();
                    final result = await apiSegmentation.predict(image);
                     setState(() {
                      _allHoldsFromApi = result;
                      _isLoading = false;
                    });
                    }else{
                      _isLoading = false;
                    }
                  } catch (e) {
                    debugPrint("Prediction failed: $e");
                    setState(() {
                      _isLoading = false;
                      _isInPredictMode = false;
                    });
                  }
                  }else{
                     
                  }
                },
                icon: _isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Color(0xFF00a896),
                        ),
                      )
                    : Icon(
                        Icons.auto_awesome,
                        color: _isInPredictMode ? const Color(0xFF00a896) : Colors.grey,
                      ),
              ),
              
              IconButton(
                onPressed: _isGrayScaleMode ? null : () {
                  setState(() {
                    if (_isInDrawingMode) {
                      _isInDrawingMode = false;
                    } else {
                      _isInCircleMode = false;
                      _isInDrawingMode = true;
                      _isInPredictMode = false;
                    }
                  });
                },
                icon: Icon(
                  Icons.draw,
                  color: _isInDrawingMode ? const Color(0xFF00a896) : Colors.grey,
                ),
                tooltip: "Freehand Drawing",
              ),
              
              IconButton(
                onPressed: _isGrayScaleMode ? null : () {
                  setState(() {
                    if (_isInCircleMode) {
                      _isInCircleMode = false;
                    } else {
                      _isInCircleMode = true;
                      _isInDrawingMode = false;
                      _isInPredictMode = false;
                    }
                  });
                },
                icon: Icon(
                  Icons.circle_outlined,
                  color: _isInCircleMode ? const Color(0xFF00a896) : Colors.grey,
                ),
                tooltip: "Circle Selection",
              ),
              
              IconButton(
                onPressed: _hasSelections() ? () {
                  setState(() {
                    _selectedHoldIndices.clear();
                    _freehandStrokes.clear();
                    _circles.clear();
                    _currentStroke.clear();
                    _currentCircle = null;
                    _isGrayScaleMode = false;
                  });
                } : null,
                icon: const Icon(Icons.clear_rounded),
                tooltip: "Clear all selections",
                color: Colors.grey[700],
              ),
            ],
          ),
        ),
        
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Listener(
                onPointerDown: (event) => _handlePointerDown(event, constraints.biggest),
                onPointerMove: (event) => _handlePointerMove(event, constraints.biggest),
                onPointerUp: _handlePointerUp,
                child: RepaintBoundary(
                  key: _imageKey,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.file(
                        image,
                        fit: BoxFit.contain,
                      ),
                      
                      if (_isGrayScaleMode && _decodedImage != null)
                        ClipPath(
                          clipper: SelectionClipper(
                            holds: _allHoldsFromApi,
                            selectedIndices: _selectedHoldIndices,
                            freehandStrokes: _freehandStrokes,
                            circles: _circles,
                            originalImageSize: Size(
                              _decodedImage!.width.toDouble(),
                              _decodedImage!.height.toDouble(),
                            ),
                            displaySize: constraints.biggest,
                          ),
                          child: ColorFiltered(
                            colorFilter: const ColorFilter.matrix([
                              0.2326, 0.7152, 0.0722, 0, 0,
                              0.2326, 0.7152, 0.0722, 0, 0,
                              0.226, 0.7152, 0.0722, 0, 0,
                              0, 0, 0, 1, 0,
                            ]),
                            child: Image.file(
                              image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      
                      if (!_isGrayScaleMode && _allHoldsFromApi.isNotEmpty && _decodedImage != null)
                        CustomPaint(
                          painter: SelectablePolygonPainter(
                            holds: _allHoldsFromApi,
                            selectedIndices: _selectedHoldIndices,
                            originalImageSize: Size(
                              _decodedImage!.width.toDouble(),
                              _decodedImage!.height.toDouble(),
                            ),
                            displaySize: constraints.biggest,
                          ),
                        ),
                      
                      if (!_isGrayScaleMode && _decodedImage != null)
                        CustomPaint(
                          painter: DrawingOverlayPainter(
                            freehandStrokes: _freehandStrokes,
                            currentStroke: _currentStroke,
                            circles: _circles,
                            currentCircle: _currentCircle,
                            originalImageSize: Size(
                              _decodedImage!.width.toDouble(),
                              _decodedImage!.height.toDouble(),
                            ),
                            displaySize: constraints.biggest,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 20),
        
        if (_hasSelections() && !_isGrayScaleMode)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: _toggleGrayScaleMode,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9B59B6),
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.visibility, size: 20),
                  SizedBox(width: 8),
                  Text(
                    "Apply Mask",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        
        if (_isGrayScaleMode)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: _toggleGrayScaleMode,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[600],
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.edit, size: 20),
                  SizedBox(width: 8),
                  Text(
                    "Edit Selection",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        
        const SizedBox(height: 12),
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: Colors.grey[300]!),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Discard",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: !_hasSelections() ? null : () async {
                    final selectedHolds = _selectedHoldIndices
                        .map((i) => _allHoldsFromApi[i])
                        .toList();
                    
                    debugPrint("Saving ${selectedHolds.length} polygon holds");
                    debugPrint("Saving ${_freehandStrokes.length} freehand strokes");
                    debugPrint("Saving ${_circles.length} circles");
                    
                    try{
                      final boundary = _imageKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
                      if(boundary == null) return;
                      final ui.Image image = await boundary.toImage(pixelRatio : 3.0);
                      final bytedata = await image.toByteData(
                        format: ui.ImageByteFormat.png
                      );
                      final bytes = bytedata!.buffer.asUint8List();
                      final directory = await getTemporaryDirectory();
                      final filePath = '${directory.path}/widget_capture_${DateTime.now().millisecondsSinceEpoch}.png';
                      final file = File(filePath);
                      await file.writeAsBytes(bytes);

                      // Przekazujemy plik do providera
                      ref.read(imageFileProvider.notifier).state = file;
                      Navigator.of(context).pop();
                    }catch(e){
                     debugPrint("$e");
                     Navigator.of(context).pop();
                    }
                    
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00a896),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey[300],
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class SelectablePolygonPainter extends CustomPainter {
  final List<HoldsModel> holds;
  final Set<int> selectedIndices;
  final Size originalImageSize;
  final Size displaySize;

  SelectablePolygonPainter({
    required this.holds,
    required this.selectedIndices,
    required this.originalImageSize,
    required this.displaySize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scaleX = displaySize.width / originalImageSize.width;
    final scaleY = displaySize.height / originalImageSize.height;
    final scale = scaleX < scaleY ? scaleX : scaleY;

    final scaledImageWidth = originalImageSize.width * scale;
    final scaledImageHeight = originalImageSize.height * scale;
    final offsetX = (displaySize.width - scaledImageWidth) / 2;
    final offsetY = (displaySize.height - scaledImageHeight) / 2;

    for (int index = 0; index < holds.length; index++) {
      final hold = holds[index];
      if (hold.array.isEmpty) continue;

      final isSelected = selectedIndices.contains(index);
      final path = Path();
      
      final firstPoint = _scalePoint(hold.array[0], scale, offsetX, offsetY);
      path.moveTo(firstPoint.dx, firstPoint.dy);
      
      for (int i = 1; i < hold.array.length; i++) {
        final point = _scalePoint(hold.array[i], scale, offsetX, offsetY);
        path.lineTo(point.dx, point.dy);
      }
      path.close();

      final fillPaint = Paint()
        ..color = isSelected 
            ? const Color(0xFF00a896).withOpacity(0.5)
            : Colors.grey.withOpacity(0.2)
        ..style = PaintingStyle.fill;
      canvas.drawPath(path, fillPaint);

      final strokePaint = Paint()
        ..color = isSelected 
            ? const Color(0xFF00a896)
            : Colors.grey[400]!
        ..style = PaintingStyle.stroke
        ..strokeWidth = isSelected ? 3.0 : 1.5;
      canvas.drawPath(path, strokePaint);
    }
  }

  Offset _scalePoint(Cords cord, double scale, double offsetX, double offsetY) {
    return Offset(
      cord.x * scale + offsetX,
      cord.y * scale + offsetY,
    );
  }

  @override
  bool shouldRepaint(covariant SelectablePolygonPainter oldDelegate) => true;
}

class DrawingOverlayPainter extends CustomPainter {
  final List<List<Offset>> freehandStrokes;
  final List<Offset> currentStroke;
  final List<Circle> circles;
  final Circle? currentCircle;
  final Size originalImageSize;
  final Size displaySize;

  DrawingOverlayPainter({
    required this.freehandStrokes,
    required this.currentStroke,
    required this.circles,
    this.currentCircle,
    required this.originalImageSize,
    required this.displaySize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scaleX = displaySize.width / originalImageSize.width;
    final scaleY = displaySize.height / originalImageSize.height;
    final scale = scaleX < scaleY ? scaleX : scaleY;

    final scaledImageWidth = originalImageSize.width * scale;
    final scaledImageHeight = originalImageSize.height * scale;
    final offsetX = (displaySize.width - scaledImageWidth) / 2;
    final offsetY = (displaySize.height - scaledImageHeight) / 2;

    final strokePaint = Paint()
      ..color = Colors.blue.withOpacity(0.7)
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    for (final stroke in freehandStrokes) {
      if (stroke.length < 2) continue;
      final path = Path();
      final first = Offset(
        stroke.first.dx * scale + offsetX,
        stroke.first.dy * scale + offsetY,
      );
      path.moveTo(first.dx, first.dy);
      for (var i = 1; i < stroke.length; i++) {
        final point = Offset(
          stroke[i].dx * scale + offsetX,
          stroke[i].dy * scale + offsetY,
        );
        path.lineTo(point.dx, point.dy);
      }
      canvas.drawPath(path, strokePaint);
    }

    if (currentStroke.length >= 2) {
      final path = Path();
      final first = Offset(
        currentStroke.first.dx * scale + offsetX,
        currentStroke.first.dy * scale + offsetY,
      );
      path.moveTo(first.dx, first.dy);
      for (var i = 1; i < currentStroke.length; i++) {
        final point = Offset(
          currentStroke[i].dx * scale + offsetX,
          currentStroke[i].dy * scale + offsetY,
        );
        path.lineTo(point.dx, point.dy);
      }
      canvas.drawPath(path, strokePaint);
    }

    final circlePaint = Paint()
      ..color = Colors.green.withOpacity(0.7)
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    for (final circle in circles) {
      final center = Offset(
        circle.center.dx * scale + offsetX,
        circle.center.dy * scale + offsetY,
      );
      final radius = circle.radius * scale;
      canvas.drawCircle(center, radius, circlePaint);
    }

    if (currentCircle != null && currentCircle!.radius > 0) {
      final center = Offset(
        currentCircle!.center.dx * scale + offsetX,
        currentCircle!.center.dy * scale + offsetY,
      );
      final radius = currentCircle!.radius * scale;
      canvas.drawCircle(center, radius, circlePaint);
    }
  }

  @override
  bool shouldRepaint(covariant DrawingOverlayPainter oldDelegate) => true;
}

class SelectionClipper extends CustomClipper<Path> {
  final List<HoldsModel> holds;
  final Set<int> selectedIndices;
  final List<List<Offset>> freehandStrokes;
  final List<Circle> circles;
  final Size originalImageSize;
  final Size displaySize;

  SelectionClipper({
    required this.holds,
    required this.selectedIndices,
    required this.freehandStrokes,
    required this.circles,
    required this.originalImageSize,
    required this.displaySize,
  });

  @override
  Path getClip(Size size) {
    final scaleX = displaySize.width / originalImageSize.width;
    final scaleY = displaySize.height / originalImageSize.height;
    final scale = scaleX < scaleY ? scaleX : scaleY;

    final scaledImageWidth = originalImageSize.width * scale;
    final scaledImageHeight = originalImageSize.height * scale;
    final offsetX = (displaySize.width - scaledImageWidth) / 2;
    final offsetY = (displaySize.height - scaledImageHeight) / 2;

    final fullArea = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final selectedPath = Path();

    for (final index in selectedIndices) {
      if (index >= holds.length) continue;
      final hold = holds[index];
      if (hold.array.isEmpty) continue;

      final path = Path();
      final firstPoint = _scalePoint(hold.array[0], scale, offsetX, offsetY);
      path.moveTo(firstPoint.dx, firstPoint.dy);
      
      for (int i = 1; i < hold.array.length; i++) {
        final point = _scalePoint(hold.array[i], scale, offsetX, offsetY);
        path.lineTo(point.dx, point.dy);
      }
      path.close();
      selectedPath.addPath(path, Offset.zero);
    }

    for (final stroke in freehandStrokes) {
      if (stroke.length < 2) continue;
      final path = Path();
      final first = Offset(
        stroke.first.dx * scale + offsetX,
        stroke.first.dy * scale + offsetY,
      );
      path.moveTo(first.dx, first.dy);
      for (var i = 1; i < stroke.length; i++) {
        final point = Offset(
          stroke[i].dx * scale + offsetX,
          stroke[i].dy * scale + offsetY,
        );
        path.lineTo(point.dx, point.dy);
      }
      selectedPath.addPath(path, Offset.zero);
    }

    for (final circle in circles) {
      final center = Offset(
        circle.center.dx * scale + offsetX,
        circle.center.dy * scale + offsetY,
      );
      final radius = circle.radius * scale;
      selectedPath.addOval(Rect.fromCircle(center: center, radius: radius));
    }

    return Path.combine(PathOperation.difference, fullArea, selectedPath);
  }

  Offset _scalePoint(Cords cord, double scale, double offsetX, double offsetY) {
    return Offset(
      cord.x * scale + offsetX,
      cord.y * scale + offsetY,
    );
  }

  @override
  bool shouldReclip(covariant SelectionClipper oldClipper) => true;
}