import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:zero/Bloc/Auth/auth_bloc.dart';
import 'package:zero/Bloc/Auth/auth_event.dart';
import 'package:zero/Cubit/Page_state/page_state_cubit.dart';
import 'package:zero/Screen/Layout/test.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();
  bool obscurePassword = true;
  bool obscurePassword1 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 40,
                      ),
                      Gap(10),
                      Text(
                        "Zero",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const Text(
                    'Set up your Zero account',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Gap(24),
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  const Gap(10),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                        child: Icon(
                          obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    obscureText: obscurePassword,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: cPasswordController,
                    decoration: InputDecoration(
                      labelText: 'Conform Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscurePassword1 = !obscurePassword1;
                          });
                        },
                        child: Icon(
                          obscurePassword1
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    obscureText: obscurePassword1,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    margin: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(
                          SignUpEvent(
                            email: emailController.text,
                            password: passwordController.text,
                            name: usernameController.text,
                          ),
                        );
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return layout();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        // Background color
                      ),
                      child: const Text('Register',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Expanded(child: Divider()),
                      Text(" Zero "),
                      Expanded(child: Divider())
                    ],
                  ),
                  const Gap(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      const Gap(5),
                      TextButton(
                        onPressed: () {
                          BlocProvider.of<PageStateCubit>(context)
                              .emit(PageStateLogin());

                          // Update the ;state to PageStateRegister
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text("By creating an account, you agree to our"),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Terms and Conditions",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Gap(5),
                      Text("and read our"),
                      Gap(5),
                      Text("Privacy Policy",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
