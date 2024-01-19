class Endpoints {
  /// Current Api Version
  static const apiVersion = "http://192.168.18.204:3000";

  /// Auth

  static const register = "$apiVersion/signup";
  static const login = "$apiVersion/login";

  static const getPost = "$apiVersion/getpost";
  static const getPostbyUser = "$apiVersion/getpost";
}
