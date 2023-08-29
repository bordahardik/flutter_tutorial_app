import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseDatabaseScreen extends StatefulWidget {
  const FirebaseDatabaseScreen({Key? key}) : super(key: key);

  @override
  State<FirebaseDatabaseScreen> createState() => _FirebaseDatabaseScreenState();
}

class _FirebaseDatabaseScreenState extends State<FirebaseDatabaseScreen> {
  final userController = TextEditingController();
  final cityController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final ImagePicker picker = ImagePicker();

  File? image;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('User');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Firebase Database Screen'),
      ),
      body: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  _getFromGallery();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                        color: Colors.grey, shape: BoxShape.circle),
                    child: image != null
                        ? Image.file(
                            image!,
                            fit: BoxFit.cover,
                          )
                        : const SizedBox(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: userController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: "User",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '*';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: "Email"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '*';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: cityController,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(hintText: "City"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '*';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  if (formKey.currentState!.validate()) {
                    String imgURL = await uploadPic(image!);

                    if (imgURL != null) {
                      Map<String, dynamic> reqBody = {
                        "user": userController.text,
                        "email": emailController.text,
                        "city": cityController.text,
                        "imrURL": imgURL,
                      };

                      log('===REQ BODY===$reqBody');

                      userCollection
                          .add(reqBody)
                          .then((value) => log('===ADD===$value'))
                          .catchError((e) {
                        log('===ADD ERROR CODE===${e.code}');
                        log('===ADD ERROR MESSAGE===${e.message}');
                      });
                    }
                  }
                },
                child: const Text('Submit'),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: StreamBuilder(
                    stream: userCollection.snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            List<DocumentSnapshot> data = snapshot.data!.docs;

                            return ListTile(
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Map<String, dynamic> reqBody = {
                                          "user": userController.text,
                                        };

                                        userCollection
                                            .doc(data[index].id)
                                            .update(reqBody)
                                            .then(
                                                (value) => log('===UPDATE==='))
                                            .catchError((e) {
                                          log('===UPDATE ERROR CODE===${e.code}');
                                          log('===UPDATE ERROR MESSAGE===${e.message}');
                                        });
                                      },
                                      icon: const Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {
                                        userCollection
                                            .doc(data[index].id)
                                            .delete()
                                            .then(
                                                (value) => log('===DELETE==='))
                                            .catchError((e) {
                                          log('===DELETE ERROR CODE===${e.code}');
                                          log('===DELETE ERROR MESSAGE===${e.message}');
                                        });
                                      },
                                      icon: const Icon(Icons.delete))
                                ],
                              ),
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(data[index].get('imrURL')),
                              ),
                              title: Text(data[index].get('user')),
                              subtitle: Text(data[index].get('email')),
                            );
                          },
                        );
                      }
                    }),
              )
            ],
          )),
    );
  }

  _getFromGallery() async {
    final pickedFile = await picker.pickMedia(
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        log('===PATH===${pickedFile.path}');
        image = File(pickedFile.path);
      });
    }
  }

  Future<String> uploadPic(File img) async {
    Reference reference = FirebaseStorage.instance.ref().child('Images/');
    UploadTask uploadTask = reference.putFile(img);
    TaskSnapshot snapshot = await uploadTask;
    var imageUrl = await snapshot.ref.getDownloadURL();
    log('===IMG URL===$imageUrl');
    return imageUrl;
  }
}
