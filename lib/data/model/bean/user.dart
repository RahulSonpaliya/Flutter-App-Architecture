class UserBean {
  int _id;
  String _name, _email, _mobileNumber, _imageURL, _accessToken;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get name => _name;

  get accessToken => _accessToken;

  set accessToken(value) {
    _accessToken = value;
  }

  get imageURL => _imageURL;

  set imageURL(value) {
    _imageURL = value;
  }

  get mobileNumber => _mobileNumber;

  set mobileNumber(value) {
    _mobileNumber = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  set name(String value) {
    _name = value;
  }

  Map<String, dynamic> toJson() => _toJson(this);

  Map<String, dynamic> _toJson(UserBean obj) {
    return <String, dynamic>{
      'id': obj.id,
      'name': obj.name,
      'email': obj.email,
      'mobileNumber': obj.mobileNumber,
      'imageURL': obj.imageURL,
    };
  }
}