import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

// ignore: library_private_types_in_public_api
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {

  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";
  
  @action
  void setPasswoed(String value) => password = value;

  @observable
  bool passwordVisible = false;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @computed
  bool get isEmailValid => 
  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  
  @computed
  bool get isPasswordValid => password.length >= 6;

  

  @computed
  
  bool get isFormValid => isEmailValid && isPasswordValid && !loading;

  @action
  Future<void> login() async {
    loading = true;

   await Future.delayed(const Duration(seconds: 2));

  loading = false;
  loggedIn = true;

  email = "";
  password = "";

  }

  @action
  void logout(){
    loggedIn = false;
  }

}