import 'package:flutter/material.dart';
import 'package:zoom_clone/core/utils/utils.dart';
import 'package:zoom_clone/features/auth/services/auth_services.dart';

class GoogleLoginScreen extends StatefulWidget {
  const GoogleLoginScreen({super.key});

  @override
  State<GoogleLoginScreen> createState() => _GoogleLoginScreenState();
}

class _GoogleLoginScreenState extends State<GoogleLoginScreen> {
  bool _isLoading = false;
  Future<void> _singInWithGoogle() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final userCredential = await AuthServices.signInWithGoogle();
      if (!mounted) return;
      if (userCredential != null) {
        if (!mounted) return;

        showAppSnackbar(
          context: context,
          type: SnackBarType.success,
          description: "Login Sucessfull",
        );
        debugPrint(" userName : ${userCredential.user?.displayName}");
      }
    } catch (e) {
      if (!mounted) return;
      showAppSnackbar(
        context: context,
        type: SnackBarType.error,
        description: "Google Login Failed",
      );
      debugPrint(e.toString());
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton.icon(
                    onPressed: () {
                      _singInWithGoogle();
                    },
                    label: Text("SignIn with Google"),
                    icon: Image.asset(
                      "assets/google.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
