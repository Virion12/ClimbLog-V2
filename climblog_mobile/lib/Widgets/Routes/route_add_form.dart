import 'dart:io';

import 'package:climblog_mobile/Riverpod/connectivity_riverpod.dart';
import 'package:climblog_mobile/Services/Api_connections/file_api.dart';
import 'package:climblog_mobile/Services/Api_connections/route_api_service.dart';
import 'package:climblog_mobile/Services/Auth/auth_service.dart';
import 'package:climblog_mobile/Services/local_db/route_service.dart';
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

class _RouteAddFormState extends   ConsumerState<RouteAddForm>{
  final _formKey = GlobalKey<FormState>();
  XFile? _image;
  bool _isImagePicked = false;

  final _idController = TextEditingController();
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
  bool _isToUpdate = false;
  bool _isToDelete = false;
  bool _isAddedToBackend = false;

  final _numberOfTriedController = TextEditingController(text: "0");

  @override
  void dispose() {
    _idController.dispose();
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
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Add Route", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            IconButton(onPressed: () async {
              final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
              setState(() {
                _isImagePicked = true;
                _image = pickedFile;
              });
            },
            icon: Icon(Icons.camera_alt),
            ),
            if(_isImagePicked)
              Container(
                height: 300,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(File(_image!.path)), 
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Name"),
              validator: (v) => v == null || v.isEmpty ? "Enter name" : null,
            ),
            TextFormField(
              controller: _colorController,
              decoration: const InputDecoration(labelText: "Color"),
            ),
            TextFormField(
              controller: _heightController,
              decoration: const InputDecoration(labelText: "Height (m)"),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _gradeController,
              decoration: const InputDecoration(labelText: "Grade"),
            ),
            TextFormField(
              controller: _imagePathController,
              decoration: const InputDecoration(labelText: "Image path"),
            ),
            TextFormField(
              controller: _thumbnailPathController,
              decoration: const InputDecoration(labelText: "Thumbnail path"),
            ),
            TextFormField(
              controller: _numberOfTriedController,
              decoration: const InputDecoration(labelText: "Number of tried"),
              keyboardType: TextInputType.number,
            ),

            const Divider(),

            // ---- CheckBoxy dla flag ----
            CheckboxListTile(
              title: const Text("Powery"),
              value: _isPowery,
              onChanged: (val) => setState(() => _isPowery = val ?? false),
            ),
            CheckboxListTile(
              title: const Text("Sloppy"),
              value: _isSloppy,
              onChanged: (val) => setState(() => _isSloppy = val ?? false),
            ),
            CheckboxListTile(
              title: const Text("Dynamic"),
              value: _isDynamic,
              onChanged: (val) => setState(() => _isDynamic = val ?? false),
            ),
            CheckboxListTile(
              title: const Text("Crimpy"),
              value: _isCrimpy,
              onChanged: (val) => setState(() => _isCrimpy = val ?? false),
            ),
            CheckboxListTile(
              title: const Text("Reachy"),
              value: _isReachy,
              onChanged: (val) => setState(() => _isReachy = val ?? false),
            ),
            CheckboxListTile(
              title: const Text("Onsighted"),
              value: _isOnsighted,
              onChanged: (val) => setState(() => _isOnsighted = val ?? false),
            ),
            CheckboxListTile(
              title: const Text("Red Pointed"),
              value: _isRedPointed,
              onChanged: (val) => setState(() => _isRedPointed = val ?? false),
            ),
            CheckboxListTile(
              title: const Text("Flashed"),
              value: _isFlashed,
              onChanged: (val) => setState(() => _isFlashed = val ?? false),
            ),
            CheckboxListTile(
              title: const Text("Favorite"),
              value: _isFavorite,
              onChanged: (val) => setState(() => _isFavorite = val ?? false),
            ),
            CheckboxListTile(
              title: const Text("Done"),
              value: _isDone,
              onChanged: (val) => setState(() => _isDone = val ?? false),
            ),
            CheckboxListTile(
              title: const Text("To Update"),
              value: _isToUpdate,
              onChanged: (val) => setState(() => _isToUpdate = val ?? false),
            ),
            CheckboxListTile(
              title: const Text("To Delete"),
              value: _isToDelete,
              onChanged: (val) => setState(() => _isToDelete = val ?? false),
            ),
            CheckboxListTile(
              title: const Text("Added To Backend"),
              value: _isAddedToBackend,
              onChanged: (val) => setState(() => _isAddedToBackend = val ?? false),
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text("Save"),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final service = RouteService(AppDatabase());
                  var newRouteId = 0;
                  try{
                    newRouteId =  await service.addRoute(
                    name: _nameController.text,
                    color: _colorController.text,
                    height: double.tryParse(_heightController.text) ?? 0.0,
                    grade: _gradeController.text,
                    imagePath: _imagePathController.text,
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
                    isToUpdate: _isToUpdate,
                    isToDelete: _isToDelete,
                    isAddedToBackend: _isAddedToBackend,
                  );
                  if(newRouteId == 0){
                    throw Exception("addind to local db went wrong");
                  }
                  }
                  catch (e){
                    throw Exception(e);
                  }

                  final auth = AuthService();
                  final isConnected = await ref.read(connectivityProvider.future);
                  String remoteImageLocation;
                  if(isConnected){
                    final remoteService = RouteServiceApi(AppDatabase(), auth, service);
                    final fileUploadService = FileService();
                    try{
                        remoteImageLocation = await fileUploadService.uploadFileApi(File(_image!.path));
                        debugPrint(remoteImageLocation);
                        await saveImage(_image!, remoteImageLocation);
                        service.addImagePath(newRouteId, remoteImageLocation);
                        
                    }catch(e){
                        debugPrint(" Failed to uplaod photo: $e");
                    }
                    try {

                        await remoteService.AddRoute(newRouteId);
                      } catch (e) {
                        debugPrint(" Failed to sync with backend: $e");
                      }
                  }
                  await saveImage(_image!);
                  await service.printAllRoutes();

                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
  Future<void> saveImage(XFile file, [String? filename])async {
    String path = (await getApplicationDocumentsDirectory()).path;

    filename ??= '${DateTime.now().millisecondsSinceEpoch}.jpg';
    try{
    await File(file.path).copy('$path/$filename');
    }
    catch(e){
      throw Exception(e);
    }
  }
}