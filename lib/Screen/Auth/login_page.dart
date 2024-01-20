import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:zero/Bloc/Auth/auth_bloc.dart';
import 'package:zero/Bloc/Auth/auth_event.dart';
import 'package:zero/Cubit/Page_state/page_state_cubit.dart';
import 'package:zero/Screen/Layout/test.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                const SizedBox(height: 100),
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
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
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text("Forgot Password?"),
                    Gap(5),
                    Text("Reset it",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(
                        SignInEvent(
                            email: usernameController.text,
                            password: passwordController.text),
                      );
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return layout();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      // Background color
                    ),
                    child: const Text('Login',
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
                const Gap(50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    const Gap(5),
                    TextButton(
                      onPressed: () {
                        BlocProvider.of<PageStateCubit>(context)
                            .emit(PageStateRegister());

                        // Update the state to PageStateRegister
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
