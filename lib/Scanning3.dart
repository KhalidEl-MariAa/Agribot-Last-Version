// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class CameraGalleryPage extends StatefulWidget {
  const CameraGalleryPage({super.key});

  @override
  _CameraGalleryPageState createState() => _CameraGalleryPageState();
}
  File? _image;
  final picker = ImagePicker();
 
  var output ;
  var model;
 

  Future<void> _analyzemage()async {
    // قد ترغب في تحليل الصورة هنا واتخاذ الإجراءات اللازمة
    
  }
class _CameraGalleryPageState extends State<CameraGalleryPage> {
 Future<void> _getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loadModel();
  }
  @override
  Widget build(BuildContext context) {
    return  
    Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: _image == null
                  ? const Text(
                      'No image selected.',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  : SizedBox(
                    width: 250,
                    height: 200,
                    child: Image.file(_image!)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: ()async{
                try{
                   if(_image!=null){
                output = await Tflite.runModelOnImage(// use model on image
                  path: _image!.path, // path of image to enter the model
                    imageMean: 127.5,
                  imageStd: 127.5,
                 numResults: 4,
                threshold: 0.1,
);
// show result of the model 
     AwesomeDialog(
      context: context,title: 'Your result: ',desc: '${output![0]['label']}',
      dialogType: DialogType.noHeader
      ,btnOk: ElevatedButton(
        onPressed: () { Navigator.pop(context); },
        child: const Text('Ok'),)).show();
    // print(output![0]);

}
  else{
    AwesomeDialog(
      context: context,title: 'Error',desc: 'Add image first',
      dialogType: DialogType.error
      ,btnOk: ElevatedButton(
        onPressed: () { Navigator.pop(context); },
        child: const Text('Ok'),)).show();
  }
          
            
               }
               catch(e){
                 AwesomeDialog(
      context: context,title: 'Error',desc: e.toString(),
      dialogType: DialogType.error
      ,btnOk: ElevatedButton(
        onPressed: () { Navigator.pop(context); },
        child: const Text('Ok'),)).show();
               } },
              child: const Text('Analyze Image'),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [FloatingActionButton(
            onPressed: () => _getImage(ImageSource.camera),
            tooltip: 'Open Camera',
            child: const Icon(Icons.camera),
          ),const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () => _getImage(ImageSource.gallery),
            tooltip: 'Open Gallery',
            child: const Icon(Icons.photo),
          ),
          ],
            ),
           

          
          ],
        ));
      
  }
}
