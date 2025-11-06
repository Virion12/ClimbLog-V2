import 'dart:io';
import 'package:climblog_mobile/Riverpod/auth_riverpod.dart';
import 'package:climblog_mobile/Riverpod/connectivity_riverpod.dart';
import 'package:climblog_mobile/Riverpod/helpers_riverpod.dart';
import 'package:climblog_mobile/Riverpod/image_riverpod.dart';
import 'package:climblog_mobile/Riverpod/local_routes_riverpod.dart';
import 'package:climblog_mobile/Services/Api_connections/route_api_service.dart';
import 'package:climblog_mobile/Widgets/Routes/route_grade_dropdown.dart';
import 'package:climblog_mobile/Widgets/Routes/route_height_dropdown.dart';
import 'package:climblog_mobile/Widgets/Routes/route_image_dialog.dart';
import 'package:climblog_mobile/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class RouteUpdateForm extends ConsumerStatefulWidget {
  const RouteUpdateForm({super.key});

  @override
  ConsumerState<RouteUpdateForm> createState() => _RouteUpdateFormState();
}

class _RouteUpdateFormState extends ConsumerState<RouteUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> climbingGrades = [
    "4a", "4a+", "4b", "4b+", "4c", "4c+",
    "5a", "5a+", "5b", "5b+", "5c", "5c+",
    "6a", "6a+", "6b", "6b+", "6c", "6c+",
    "7a", "7a+", "7b", "7b+", "7c", "7c+",
    "8a", "8a+", "8b", "8b+", "8c", "8c+",
    "9a", "9a+", "9b", "9b+", "9c"
  ];

  final _nameController = TextEditingController();
  final _colorController = TextEditingController();
  final _heightController = TextEditingController();
  final _gradeController = TextEditingController(text: "4a");
  final _imagePathController = TextEditingController();
  final _thumbnailPathController = TextEditingController();

  bool _isPowery = false;
  bool _isSloppy = false;
  bool _isDynamic = false;
  bool _isCrimpy = false;
  bool _isReachy = false;
  bool _isOnsighted = false;
  bool _isRedPointed = false;
  bool _isFlashed = false;
  bool _isFavorite = false;
  bool _isDone = false;

  final _numberOfTriedController = TextEditingController(text: "0");

  @override
  void dispose() {
    _nameController.dispose();
    _colorController.dispose();
    _heightController.dispose();
    _gradeController.dispose();
    _imagePathController.dispose();
    _thumbnailPathController.dispose();
    _numberOfTriedController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loadRouteData();
  }

  Future<void> _loadRouteData() async {
    final route = ref.read(selectedRouteProvider);

    if (route != null) {
      if (route.imagePathLocal.isNotEmpty) {
        final dir = await getApplicationDocumentsDirectory();
        final filePath = '${dir.path}/${route.imagePathLocal}';

        if (await File(filePath).exists()) {
          ref.read(imageFileProvider.notifier).state = File(filePath);
        }
      }

      setState(() {
        _nameController.text = route.name;
        _colorController.text = route.color;
        _heightController.text = route.height.toString();
        _gradeController.text = route.grade;
        _numberOfTriedController.text = (route.numberOfTried).toString();
        _imagePathController.text = route.imagePathLocal;
        _isPowery = route.isPowery;
        _isSloppy = route.isSloppy;
        _isDynamic = route.isDynamic;
        _isCrimpy = route.isCrimpy;
        _isReachy = route.isReachy;
        _isOnsighted = route.isOnsighted;
        _isRedPointed = route.isRedPointed;
        _isFlashed = route.isFlashed;
        _isFavorite = route.isFavorite;
        _isDone = route.isDone;
      });
    }
  }

  void _showImagePickerModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF00a896).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.camera_alt, color: Color(0xFF00a896)),
              ),
              title: const Text("Take Photo"),
              onTap: () async {
                Navigator.pop(context);
                final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
                if (pickedFile != null) {
                  ref.read(imageFileProvider.notifier).state = File(pickedFile.path);
                }
              },
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF00a896).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.photo_library, color: Color(0xFF00a896)),
              ),
              title: const Text("Choose from Gallery"),
              onTap: () async {
                Navigator.pop(context);
                final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  ref.read(imageFileProvider.notifier).state = File(pickedFile.path);
                }
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final isImageSelected = ref.watch(imageFileProvider) != null;
                
                if (!isImageSelected) return const SizedBox.shrink();
                
                return ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00a896).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.edit, color: Color(0xFF00a896)),
                  ),
                  title: const Text("Select Holds"),
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.white,
                          insetPadding: const EdgeInsets.all(10),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: RouteImageDialog(),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedImage = ref.watch(imageFileProvider);
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Edit Route",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                    },
                    icon: Icon(
                      _isFavorite ? Icons.star : Icons.star_border,
                      color: _isFavorite ? Colors.amber : Colors.grey[400],
                      size: 28,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Image Picker
              GestureDetector(
                onTap: () => _showImagePickerModal(context),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey[300]!,
                      width: 2,
                    ),
                  ),
                  child: selectedImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.file(
                            selectedImage,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 48,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Tap to change photo",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                ),
              ),

              const SizedBox(height: 24),

              // Form Fields
              TextFormField(
                controller: _nameController,
                decoration: _inputDecoration("Name"),
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _colorController,
                decoration: _inputDecoration("Color"),
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: HeightPickerField(
                      controller: _heightController,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: GradePickerField(
                      controller: _gradeController,
                      grades: climbingGrades,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: _numberOfTriedController,
                decoration: _inputDecoration("Number of tries"),
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 24),

              // Characteristics
              Text(
                "Characteristics",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C3E50),
                ),
              ),
              const SizedBox(height: 8),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildFilterChip("Powery", _isPowery, (val) => setState(() => _isPowery = val)),
                  _buildFilterChip("Sloppy", _isSloppy, (val) => setState(() => _isSloppy = val)),
                  _buildFilterChip("Dynamic", _isDynamic, (val) => setState(() => _isDynamic = val)),
                  _buildFilterChip("Crimpy", _isCrimpy, (val) => setState(() => _isCrimpy = val)),
                  _buildFilterChip("Reachy", _isReachy, (val) => setState(() => _isReachy = val)),
                ],
              ),

              const SizedBox(height: 24),

              // Status
              Text(
                "Status",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C3E50),
                ),
              ),
              const SizedBox(height: 8),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildFilterChip("Onsighted", _isOnsighted, (val) => setState(() => _isOnsighted = val)),
                  _buildFilterChip("Red Pointed", _isRedPointed, (val) => setState(() => _isRedPointed = val)),
                  _buildFilterChip("Flashed", _isFlashed, (val) => setState(() => _isFlashed = val)),
                  _buildFilterChip("Done", _isDone, (val) => setState(() => _isDone = val)),
                ],
              ),

              const SizedBox(height: 32),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        ref.read(imageFileProvider.notifier).state = null;
                        Navigator.of(context).pop();},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: Colors.grey[300]!),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Cancel",
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
                      onPressed: () async {
                        final route = ref.read(selectedRouteProvider);
                        final routeId = route?.id;
                        if (routeId != null) {
                          final serviceLocal = ref.read(routeServiceProvider);
                          final isConnected = await ref.read(connectivityProvider.future);
                          final auth = ref.read(authServiceProvider);
                          final remoteRouteService = RouteServiceApi(
                            ref.read(dbProvider),
                            auth,
                            serviceLocal,
                          );

                          if (route == null) {
                            debugPrint("no route provided");
                            return;
                          }
                          
                          File? file = selectedImage;

                          ClimbingRoute routeToUpdate = ClimbingRoute(
                            id: route.id,
                            backendId: route.backendId,
                            userId: route.userId,
                            isPublic: route.isPublic,
                            name: _nameController.text,
                            color: _colorController.text,
                            height: double.parse(_heightController.text),
                            isPowery: _isPowery,
                            isSloppy: _isSloppy,
                            isDynamic: _isDynamic,
                            isCrimpy: _isCrimpy,
                            isReachy: _isReachy,
                            isOnsighted: _isOnsighted,
                            isRedPointed: _isRedPointed,
                            isFlashed: _isFlashed,
                            isFavorite: _isFavorite,
                            numberOfTried: int.parse(_numberOfTriedController.text),
                            isDone: _isDone,
                            grade: _gradeController.text,
                            imagePathLocal: route.imagePathLocal,
                            imagePathBackend: route.imagePathBackend,
                            thumbnailPath: route.thumbnailPath,
                            createdAt: route.createdAt,
                            lastUpdatedAt: route.lastUpdatedAt,
                            isToUpdate: route.isToUpdate,
                            isToDelete: route.isToDelete,
                            isAddedToBackend: route.isAddedToBackend,
                            isImagePendingUpdate: route.isImagePendingUpdate,
                          );
                          remoteRouteService.updateRoute(routeToUpdate, isConnected, file);
                          if (context.mounted) {
                            Navigator.of(context).pop();
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00a896),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Save Changes",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool value, Function(bool) onChanged) {
    return FilterChip(
      label: Text(label),
      selected: value,
      onSelected: onChanged,
      selectedColor: const Color(0xFF00a896).withValues(alpha: 0.2),
      checkmarkColor: const Color(0xFF00a896),
      backgroundColor: const Color(0xFFF8F9FA),
      side: BorderSide(
        color: value ? const Color(0xFF00a896) : Colors.grey[300]!,
        width: 1,
      ),
      labelStyle: TextStyle(
        color: value ? const Color(0xFF00a896) : Colors.grey[700],
        fontWeight: value ? FontWeight.w600 : FontWeight.w500,
        fontSize: 13,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.grey[600]),
      filled: true,
      fillColor: const Color(0xFFF8F9FA),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF00a896), width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  Future<void> saveImage(XFile file, [String? filename]) async {
    String path = (await getApplicationDocumentsDirectory()).path;

    filename ??= '${DateTime.now().millisecondsSinceEpoch}';
    try {
      await File(file.path).copy('$path/$filename');
    } catch (e) {
      throw Exception(e);
    }
  }
}