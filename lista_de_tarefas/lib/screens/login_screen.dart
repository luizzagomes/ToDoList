import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lista_de_tarefas/screens/custom_icon_buttom.dart';
import 'package:lista_de_tarefas/screens/list_screens.dart';
import 'package:lista_de_tarefas/controllers/login_controller.dart';
import 'package:lista_de_tarefas/widgets/custom_text_field.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  LoginController loginController = LoginController();
  
  late final ReactionDisposer disposer;
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    loginController = Provider.of<LoginController>(context);

    disposer = reaction(
      (_) => loginController.loggedIn,
      (loggedIn){
      if(loggedIn) {
        Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_)=>const LoginScreen())

      );
      }

    });
    
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(32),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 16,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Observer(builder: (_){
                  return CustomTextField(
                  hint: 'E-mail',
                  prefix: const Icon(Icons.account_circle),
                  textInputType: TextInputType.emailAddress,
                  onChanged: loginController.setEmail,
                  enabled: !loginController.loading,
                );
                },
                ),
                const SizedBox(height: 16,),
                Observer(builder: (_){
                  return CustomTextField(
                    hint: "Senha",
                    prefix: const Icon(Icons.lock),
                    obscure: !loginController.passwordVisible,
                    onChanged: loginController.setPasswoed,
                    enabled: !loginController.loading,
                    sufix: CustomIconButton(
                    radius: 32,
                    iconData: loginController.passwordVisible ? Icons.visibility_off : Icons.visibility,
                    onTap: loginController.togglePasswordVisibility,
                  ),
                  );
                }
                  ),
                  const SizedBox(height: 16,),
                Observer(builder: (_){
                  return SizedBox(
                    height: 44,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)
                            ),
                            backgroundColor: Theme.of(context).primaryColor,
                            textStyle: const TextStyle(color: Colors.white),
                            padding: const EdgeInsets.all(12)
                          ),
                            child: const Text('Login'),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (_) => const ListScreen())
                                );
                            },
                          )
                  );
                  }
                  )
                  ]
                  )
                ),
        ),
          ),
      ),
    );
                }
                @override
  void dispose(){
    disposer();
    super.dispose();
  }
                    }
                    
          


