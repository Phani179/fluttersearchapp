class ImageData {
  String? _imageURL;

  String? get getImageURL => _imageURL;

  void setImageURL(String val) {
    _imageURL = val;
  }

  // No Args Constructor
  ImageData();

  // Named Constructor
  ImageData.setProperties(this._imageURL);

  // Factory Constructor
  factory ImageData.fromString(String url) {
    return ImageData.setProperties(url);
  }
}
