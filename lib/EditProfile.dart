import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Uint8List? _image;

  Future<void> selectImage() async {
    if (kIsWeb) {
      final pickedImage = await ImagePickerWeb.getImageInfo;
      if (pickedImage != null) {
        setState(() {
          _image = pickedImage.data;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        backgroundColor: Color(0xffae32ff),
        title: Text(
          "Edit Profile",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color(0xffffffff),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: selectImage,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: _image != null
                          ? Image.memory(
                        _image!,
                        fit: BoxFit.cover,
                      )
                          : Container(
                        color: Colors.grey, // Placeholder color
                        child: Icon(
                          Icons.add_a_photo_outlined,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.all(0),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xff3a57e8),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        color: Color(0xffffffff),
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.fromLTRB(0, 30, 0, 0),
                child:ListTile(
                  tileColor:Color(0x00ffffff),
                  title:Text("Name",
                    style:TextStyle(
                      fontWeight:FontWeight.w400,
                      fontStyle:FontStyle.normal,
                      fontSize:14,
                      color:Color(0xff424141),
                    ),
                    textAlign:TextAlign.start,
                  ),
                  dense:true,
                  contentPadding:EdgeInsets.all(0),
                  selected:false,
                  selectedTileColor:Color(0x42000000),
                  shape:RoundedRectangleBorder(
                    borderRadius:BorderRadius.zero,
                  ),
                  leading:Icon(Icons.person,color:Color(0xff3a57e8),size:24),
                  trailing:Icon(Icons.edit,color:Color(0xff79797c),size:22),
                ),
              ),
              TextField(
                controller:TextEditingController(),
                obscureText:false,
                textAlign:TextAlign.start,
                maxLines:1,
                style:TextStyle(
                  fontWeight:FontWeight.w400,
                  fontStyle:FontStyle.normal,
                  fontSize:14,
                  color:Color(0xff000000),
                ),
                decoration:InputDecoration(
                  disabledBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(4.0),
                    borderSide:BorderSide(
                        color:Color(0xff000000),
                        width:1
                    ),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(4.0),
                    borderSide:BorderSide(
                        color:Color(0xff000000),
                        width:1
                    ),
                  ),
                  enabledBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(4.0),
                    borderSide:BorderSide(
                        color:Color(0xff000000),
                        width:1
                    ),
                  ),
                  hintText:"Enter name...",
                  hintStyle:TextStyle(
                    fontWeight:FontWeight.w400,
                    fontStyle:FontStyle.normal,
                    fontSize:14,
                    color:Color(0xff7a7979),
                  ),
                  filled:true,
                  fillColor:Color(0xfff2f2f3),
                  isDense:false,
                  contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
                ),
              ),
              Padding(
                padding:EdgeInsets.fromLTRB(50, 0, 0, 0),
                child:Text(
                  "This is not your username or ID. This name will be visible to other users.",
                  textAlign: TextAlign.left,
                  overflow:TextOverflow.clip,
                  style:TextStyle(
                    fontWeight:FontWeight.w400,
                    fontStyle:FontStyle.normal,
                    fontSize:12,
                    color:Color(0xff000000),
                  ),
                ),
              ),
              Divider(
                color:Color(0xffdddddd),
                height:30,
                thickness:0,
                indent:50,
                endIndent:0,
              ),
              ListTile(
                tileColor:Color(0x00ffffff),
                title:Text("Bio",
                  style:TextStyle(
                    fontWeight:FontWeight.w400,
                    fontStyle:FontStyle.normal,
                    fontSize:14,
                    color:Color(0xff000000),
                  ),
                  textAlign:TextAlign.start,
                ),
                dense:true,
                contentPadding:EdgeInsets.all(0),
                selected:false,
                selectedTileColor:Color(0x42000000),
                shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.zero,
                ),
                leading:Icon(Icons.info_outline,color:Color(0xff3a57e8),size:24),
                trailing:Icon(Icons.edit,color:Color(0xff79797c),size:22),
              ),
              TextField(
                controller:TextEditingController(),
                obscureText:false,
                textAlign:TextAlign.start,
                maxLines:1,
                style:TextStyle(
                  fontWeight:FontWeight.w400,
                  fontStyle:FontStyle.normal,
                  fontSize:14,
                  color:Color(0xff000000),
                ),
                decoration:InputDecoration(
                  disabledBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(4.0),
                    borderSide:BorderSide(
                        color:Color(0xff000000),
                        width:1
                    ),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(4.0),
                    borderSide:BorderSide(
                        color:Color(0xff000000),
                        width:1
                    ),
                  ),
                  enabledBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(4.0),
                    borderSide:BorderSide(
                        color:Color(0xff000000),
                        width:1
                    ),
                  ),
                  hintText:"Tell us about yourself...",
                  hintStyle:TextStyle(
                    fontWeight:FontWeight.w400,
                    fontStyle:FontStyle.normal,
                    fontSize:14,
                    color:Color(0xff7c7979),
                  ),
                  filled:true,
                  fillColor:Color(0xfff2f2f3),
                  isDense:false,
                  contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffae32ff),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(color: Color(0xffedebeb), width: 1),
                    ),
                    padding: EdgeInsets.all(12),
                    minimumSize: Size(MediaQuery.of(context).size.width, 50),
                  ),
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: Color(0xfff4f0f0),
                    ),
                  ),
                ),
              ),

              Divider(
                color:Color(0xffdddddd),
                height:20,
                thickness:0,
                indent:50,
                endIndent:0,
              ),
            ],),),),
    )
    ;}
}
