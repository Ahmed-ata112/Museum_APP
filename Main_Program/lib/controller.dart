import 'api.dart';

class Controller {
  Controller() {}

  static Future<int> getUserType(Map<String, dynamic> formData) async {
    String username = formData["username"];
    String password = formData["password"];
    String query =
        "select type_ from museum.user_ where username_ = '$username' and password_ = '$password';";
    dynamic user_type = await DBManager.executeScaler(query);

    if (user_type == null) {
      //don't exist
      return -1;
    }
    return user_type;
  }

  //

}
