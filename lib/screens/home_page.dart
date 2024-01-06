import 'package:animalsearchapp/widgets/animal_images.dart';
import 'package:flutter/material.dart';

import 'package:animalsearchapp/data/animal_images_by_names.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textField = TextEditingController();
  String animalName = "animal";
  bool isPressed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Animal Search App")),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.01,
          ),

          // Search Bar.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.8,
                // height: height * 0.07,
                child: TextField(
                  controller: _textField,
                  decoration: InputDecoration(
                    hintText: "Enter Animal Name...",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    suffixIcon: Container(
                      width: width * 0.115,
                      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(90),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          AnimalImages.imageURLs.clear();
                          AnimalImages.page = 1;
                          setState(() {
                            animalName = _textField.text;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(
            height: height * 0.015,
          ),

          // Grid View.
          AnimalImagesWidget(animalName: animalName),
        ],
      ),
    );
  }
}
