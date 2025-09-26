import 'dart:io';
import 'dart:math';

import 'package:climblog_mobile/Riverpod/connectivity_riverpod.dart';
import 'package:climblog_mobile/Services/Api_connections/file_api.dart';
import 'package:climblog_mobile/Services/Api_connections/route_api_service.dart';
import 'package:climblog_mobile/Services/Auth/auth_service.dart';
import 'package:climblog_mobile/Services/local_db/route_service.dart';
import 'package:climblog_mobile/Widgets/Routes/route_grade_dropdown.dart';
import 'package:climblog_mobile/Widgets/Routes/route_height_dropdown.dart';
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
  final List<String> climbingGrades = [
  // 4
  "4a", "4a+", "4b", "4b+", "4c", "4c+",
  // 5
  "5a", "5a+", "5b", "5b+", "5c", "5c+",
  // 6
  "6a", "6a+", "6b", "6b+", "6c", "6c+",
  // 7
  "7a", "7a+", "7b", "7b+", "7c", "7c+",
  // 8
  "8a", "8a+", "8b", "8b+", "8c", "8c+",
  // 9
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
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.center ,
              children: [
                Text("Add Route", style: Theme.of(context).textTheme.titleLarge),
                IconButton(onPressed: () {
                  setState(() {
                    if(_isFavorite){_isFavorite = false;}
                    else{
                      _isFavorite = true;
                    }
                  });
                }, icon: Icon(Icons.star,color: _isFavorite ? Colors.amber : Colors.grey, size: MediaQuery.of(context).size.width * 0.09,))
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () async {
                  final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
                  setState(() {
                    _isImagePicked = true;
                    _image = pickedFile;
                  });
                },
                  icon: Icon(Icons.camera_alt),
                ),
                IconButton(onPressed: () async {
                  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                  setState(() {
                    _isImagePicked = true;
                    _image = pickedFile;
                  });
                },
                  icon: Icon(Icons.photo_library),
                ),
              ],
            ),
            
            if(_isImagePicked && _image!= null)
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
              controller: _colorController,
              decoration: const InputDecoration(labelText: "Color"),
            ),
            HeightPickerField(
              controller: _heightController,
            ),
            GradePickerField(
              controller: _gradeController,
              grades: climbingGrades,
            ),
            TextFormField(
              controller: _numberOfTriedController,
              decoration: const InputDecoration(labelText: "Number of tries"),
              keyboardType: TextInputType.number,
            ),

            const Divider(),

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
            

            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text("Save"),
              onPressed: () async {

                final isConnected = await ref.read(connectivityProvider.future);
                if(_formKey.currentState!.validate()){
                  final service = RouteService(AppDatabase());
                  var newRouteId = 0;
                  String filename ="";

                  if(isConnected){
                    if(_isImagePicked)
                    {

                      final fileUploadService = FileService();
                      
                      try{
                        filename = await fileUploadService.uploadFileApi(File(_image!.path));
                        debugPrint("filename returned from backend : $filename");
                        await saveImage(_image!, filename);

                      }catch(e){
                        debugPrint("File upload failed due to : $e}");
                        debugPrint("Trying to uplad image localy}");
                        filename = DateTime.now().millisecondsSinceEpoch.toString();
                        await saveImage(_image!, filename);
                      }                   
                    }

                  }else{
                      if(_isImagePicked){
                        filename = DateTime.now().millisecondsSinceEpoch.toString();
                        await saveImage(_image!, filename);
                      }
                  }

                  //Adding route localy 
                  try{
                    newRouteId =  await service.addRoute(
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
                  );
                  if(newRouteId == 0){
                    throw Exception("addind to local db went wrong dute to backend id being 0");
                  }

                  if(isConnected){
                    final auth = AuthService();
                    final remoteService = RouteServiceApi(AppDatabase(), auth, service);
                    try{
                      await remoteService.AddRoute(newRouteId);
                    }catch (e){
                      throw Exception("addind to remote serwis route : $newRouteId went wrong due to $e");
                    }
                    
                  }
                  }
                  catch (e){
                    throw Exception("addind to local db went wrong due to : $e");
                  }


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