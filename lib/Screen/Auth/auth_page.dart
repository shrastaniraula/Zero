import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zero/Bloc/Auth/auth_bloc.dart';
import 'package:zero/Bloc/Auth/auth_event.dart';
import 'package:zero/Cubit/Page_state/page_state_cubit.dart';
import 'package:zero/Repository/Auth/auth_repository.dart';
import 'package:zero/Screen/Auth/login_page.dart';
import 'package:zero/Screen/Auth/profile_page.dart';
import 'package:zero/Screen/Auth/signUp_page.dart';
import 'package:zero/Screen/Feed/feed_page.dart';
import 'package:zero/Screen/Layout/test.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late AuthBloc _authBloc;
  late PageStateCubit _pageStateCubit; // Add this line

  @override
  void initState() {
    _authBloc = AuthBloc(AuthRepository());
    _authBloc.add(CheckAuthStatus());
    _pageStateCubit = PageStateCubit(); // Initialize PageStateCubit

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>.value(value: _authBloc),
          BlocProvider<PageStateCubit>.value(
              value: _pageStateCubit), // Add this line
        ],
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is UnAuthenticated || state is AuthError) {
              _showLoginPage();
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is AlreadyAuthenticated) {
                return layout();
              } else if (state is Authenticated) {
                return layout();
              } else if (state is UnAuthenticated || state is AuthError) {
                return BlocBuilder<PageStateCubit, PageStateState>(
                  builder: (context, pageState) {
                    if (pageState is PageStateLogin) {
                      return const LoginScreen();
                    } else if (pageState is PageStateRegister) {
                      // Handle the register screen UI here
                      return SignupScreen();
                    } else {
                      return const LoginScreen();
                    }
                  },
                );
              } else {
                return const SizedBox(
                  child: Text("gga"),
                );
              }
            },
          ),
        ));
  }

  void _showLoginPage() {
    // Instantiate the LoginPage class directly
    final loginPage = const LoginScreen();

    // Use loginPage as needed, for example, you can include it in the widget tree
    // instead of navigating to it
  }
}
