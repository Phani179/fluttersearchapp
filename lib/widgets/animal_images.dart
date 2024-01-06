import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:animalsearchapp/data/animal_images_by_names.dart';

class AnimalImagesWidget extends StatefulWidget {
  const AnimalImagesWidget({super.key, required this.animalName});

  final String animalName;

  @override
  State<AnimalImagesWidget> createState() => _AnimalImagesWidgetState();
}

class _AnimalImagesWidgetState extends State<AnimalImagesWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final AnimalImages _animalImages = AnimalImages();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: _animalImages.getAnimalImages(widget.animalName),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0),
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: CachedNetworkImage(
                        imageUrl: '${snapshot.data?[index].getImageURL}',
                        fit: BoxFit.cover),
                  );
                },
              );
            } else {
              return const AlertDialog(
                title: Text("Once, please check your connection!!!"),
              );
            }
          }),
    );
  }
}
