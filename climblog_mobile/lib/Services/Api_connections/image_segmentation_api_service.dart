import 'dart:convert';
import 'dart:io';
import 'package:climblog_mobile/models/cords.dart';
import 'package:climblog_mobile/models/holds_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class ImageSegmentationAPi{
  final baseUrl = "http://10.0.2.2:8000";

  IOClient _createIoClient() {
    final client = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    return IOClient(client);
  }

  Future<List<HoldsModel>> predict (File file) async{

    final url = Uri.parse("$baseUrl/predict");
    final ioClient = _createIoClient();
    try{
          final request = http.MultipartRequest("POST", url);
          request.files.add((
            await http.MultipartFile.fromPath('file', file.path,)
          ));
          final streamedResponse = await ioClient.send(request);
          final response = await http.Response.fromStream(streamedResponse);   
              debugPrint("Response status: ${response.statusCode}");
              debugPrint("Response body: ${response.body}");
          if(response.statusCode != 200){
              throw Exception("Status code ${response.statusCode}");
          }
          
          final data = jsonDecode(response.body);
          final predictions = data["predictions"];

          var predictionsList = <HoldsModel>[];;
          
          for(var prediction in predictions){
            debugPrint("------------------------------");
            debugPrint("Mask cords new prediction");
            final classId = prediction["class_id"];
            
            debugPrint("Class id $classId");

            final masks = prediction["mask_xy"];

            var masksList = <Cords>[];
            for(var mask in masks){
              
              
              var x = mask[0];
              var y = mask[1];
              debugPrint("------------------------------");
              debugPrint("Mask cords $x $y");
              debugPrint("------------------------------");
              Cords cords = Cords(x: x,y: y);
              masksList.add(cords);
            }
            HoldsModel holdmodel = HoldsModel(array: masksList,classId: classId);       
            predictionsList.add(holdmodel);
            debugPrint("------------------------------");
          }
          return predictionsList;


    }catch (e){
      debugPrint("error $e");
      rethrow;
    }finally{
      ioClient.close();
    }
  }

}