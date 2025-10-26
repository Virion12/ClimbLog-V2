import 'dart:io';

import 'package:climblog_mobile/Riverpod/connectivity_riverpod.dart';
import 'package:climblog_mobile/Riverpod/image_riverpod.dart';
import 'package:climblog_mobile/Services/Api_connections/file_api.dart';
import 'package:climblog_mobile/Services/Api_connections/image_segmentation_api_service.dart';
import 'package:climblog_mobile/Services/Api_connections/route_api_service.dart';
import 'package:climblog_mobile/Services/Auth/auth_service.dart';
import 'package:climblog_mobile/Services/local_db/route_service.dart';
import 'package:climblog_mobile/Widgets/Routes/route_grade_dropdown.dart';
import 'package:climblog_mobile/Widgets/Routes/route_height_dropdown.dart';
import 'package:climblog_mobile/Widgets/Routes/route_image_dialog.dart';
import 'package:climblog_mobile/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class RouteAddForm extends ConsumerStatefulWidget {
  const RouteAddForm({super.key});

  @override
  ConsumerState<RouteAddForm> createState() => _RouteAddFormState();
}

class _RouteAddFormState extends ConsumerState<RouteAddForm> {
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
  Widget build(BuildContext context) {
    // Pobieramy obraz z providera
    final selectedImage = ref.watch(imageFileProvider);
    final bool isImagePicked = selectedImage != null;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Add Route",
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

                // Image Picker Section
                GestureDetector(
                  onTap: () => _showImagePickerModal(context),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.grey[300]!,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: isImagePicked
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.file(
                              selectedImage,
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_photo_alternate_outlined,
                                size: 64,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                "Tap to add photo",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),

                const SizedBox(height: 24),

                // Basic Info Section
                _SectionLabel(label: "Basic Info"),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _nameController,
                  decoration: _inputDecoration("Route name"),
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

                // Characteristics Section
                _SectionLabel(label: "Characteristics"),
                const SizedBox(height: 8),

                _buildCharacteristicChips(),

                const SizedBox(height: 24),

                // Status Section
                _SectionLabel(label: "Status"),
                const SizedBox(height: 8),

                _buildStatusChips(),

                const SizedBox(height: 32),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          // Czyścimy provider przy anulowaniu
                          ref.read(imageFileProvider.notifier).state = null;
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
                          bool isimageToUpdate = false;
                          final imageFile = ref.read(imageFileProvider);

                          final isConnected = await ref.read(connectivityProvider.future);
                          if (_formKey.currentState!.validate()) {
                            final service = RouteService(AppDatabase());
                            var newRouteId = 0;
                            String filename = "";

                            if (isConnected) {
                              if (isImagePicked && imageFile != null) {
                                debugPrint("---------------------------------------Segmentation-------------------------------");
                                final predictionService = ImageSegmentationAPi();
                                
                                predictionService.predict(imageFile);
                                debugPrint("---------------------------------------End - Segmentation-------------------------------");

                                final fileUploadService = FileService();

                                try {
                                  filename = await fileUploadService.uploadFileApi(imageFile);
                                  debugPrint("filename returned from backend : $filename");
                                  await saveImage(imageFile, filename);
                                } catch (e) {
                                  debugPrint("File upload failed due to : $e}");
                                  debugPrint("Trying to upload image locally}");
                                  filename = DateTime.now().millisecondsSinceEpoch.toString();
                                  await saveImage(imageFile, filename);
                                  isimageToUpdate = true;
                                }
                              }
                            } else {
                              if (isImagePicked && imageFile != null) {
                                filename = DateTime.now().millisecondsSinceEpoch.toString();
                                await saveImage(imageFile, filename);
                                isimageToUpdate = true;
                              }
                            }

                            try {
                              newRouteId = await service.addRoute(
                                name: _nameController.text,
                                color: _colorController.text,
                                height: double.tryParse(_heightController.text) ?? 0.0,
                                grade: _gradeController.text,
                                imagePath: filename,
                                thumbnailPath: _thumbnailPathController.text,
                                numberOfTried: int.tryParse(_numberOfTriedController.text) ?? 0,
                                isPowery: _isPowery,
                                isSloppy: _isSloppy,
                                isDynamic: _isDynamic,
                                isCrimpy: _isCrimpy,
                                isReachy: _isReachy,
                                isOnsighted: _isOnsighted,
                                isRedPointed: _isRedPointed,
                                isFlashed: _isFlashed,
                                isFavorite: _isFavorite,
                                isDone: _isDone,
                                isToUpdate: false,
                                isToDelete: false,
                                isAddedToBackend: false,
                                isImagePendingUpdate: isimageToUpdate,
                              );
                              if (newRouteId == 0) {
                                throw Exception("adding to local db went wrong due to backend id being 0");
                              }

                              if (isConnected) {
                                final auth = AuthService();
                                final remoteService = RouteServiceApi(AppDatabase(), auth, service);
                                try {
                                  await remoteService.AddRoute(newRouteId);
                                } catch (e) {
                                  throw Exception("adding to remote service route : $newRouteId went wrong due to $e");
                                }
                              }
                            } catch (e) {
                              throw Exception("adding to local db went wrong due to : $e");
                            }

                            if (context.mounted) {
                              ref.read(imageFileProvider.notifier).state = null;
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
                          "Save Route",
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
      ),
    );
  }

  Widget _buildCharacteristicChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildFilterChip("Powery", _isPowery, (val) => setState(() => _isPowery = val)),
        _buildFilterChip("Sloppy", _isSloppy, (val) => setState(() => _isSloppy = val)),
        _buildFilterChip("Dynamic", _isDynamic, (val) => setState(() => _isDynamic = val)),
        _buildFilterChip("Crimpy", _isCrimpy, (val) => setState(() => _isCrimpy = val)),
        _buildFilterChip("Reachy", _isReachy, (val) => setState(() => _isReachy = val)),
      ],
    );
  }

  Widget _buildStatusChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildFilterChip("Onsighted", _isOnsighted, (val) => setState(() => _isOnsighted = val)),
        _buildFilterChip("Red Pointed", _isRedPointed, (val) => setState(() => _isRedPointed = val)),
        _buildFilterChip("Flashed", _isFlashed, (val) => setState(() => _isFlashed = val)),
        _buildFilterChip("Done", _isDone, (val) => setState(() => _isDone = val)),
      ],
    );
  }

  Widget _buildFilterChip(String label, bool value, Function(bool) onChanged) {
    return FilterChip(
      label: Text(label),
      selected: value,
      onSelected: onChanged,
      selectedColor: const Color(0xFF00a896).withOpacity(0.2),
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

  void _showImagePickerModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
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
                  color: const Color(0xFF00a896).withOpacity(0.1),
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
                  color: const Color(0xFF00a896).withOpacity(0.1),
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
                      color: const Color(0xFF00a896).withOpacity(0.1),
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

  Future<void> saveImage(File file, [String? filename]) async {
    String path = (await getApplicationDocumentsDirectory()).path;

    filename ??= '${DateTime.now().millisecondsSinceEpoch}';
    try {
      await file.copy('$path/$filename');
    } catch (e) {
      throw Exception(e);
    }
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;

  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Color(0xFF2C3E50),
      ),
    );
  }
}