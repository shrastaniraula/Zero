class Endpoints {
  /// Current Api Version
  static const apiVersion = "http://192.168.18.122:3000";
//  static const apiVersion = "http://172.20.10.13:3000";

  /// Auth

  static const register = "$apiVersion/signup";
  static const login = "$apiVersion/login";

  static const getPost = "$apiVersion/getpost";
  static const getPostbyUser = "$apiVersion/getpost";
  static const createPost = "$apiVersion/addpost";
  static const addCmt = "$apiVersion/addcomment";
  static const getCmt = "$apiVersion/getcomment";
}
