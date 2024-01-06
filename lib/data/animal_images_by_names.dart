import 'package:dio/dio.dart';
import 'package:animalsearchapp/models/image_data.dart';

class AnimalImages {
  // Unsplash Access Key
  final clientId = "Iqbs3-B1TXP9cGjFKuNaxXwdreHm5Xb8zL2xnqL3k3w";
  static int page = 1;
  static List<ImageData> imageURLs = [];

  Future<dynamic> getAnimalImages(String name) async {
    final path =
        "https://api.unsplash.com/search/photos?client_id=$clientId&query=$name&page=$page&per_page=15";

    try {
      final response = await Dio().get(path);
      if (response.statusCode == 200) {
        final List<dynamic> items = (response.data)["results"];
        for (int i = 0; i < items.length; i++) {
          ImageData imageURL = ImageData.fromString(items[i]["urls"]["small"]);
          imageURLs.add(imageURL);
        }
        page++;
        return imageURLs;
      }
      throw 'Check the url';
    } catch (e) {
      throw e.toString();
    }
  }
}
