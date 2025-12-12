import 'package:flutter/material.dart';

import '../../../core/theme/app_text_styles.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/spacing.dart';

class LoginForm extends StatefulWidget {
  final Future<void> Function(String email, String password) onSubmit;
  final bool loading;

  const LoginForm({
    super.key,
    required this.onSubmit,
    this.loading = false,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }

    await widget.onSubmit(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Delivery Boy Login',
          style: AppTextStyles.title, // adjust to your style
        ),
        const VerticalSpacing(24),
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
        ),
        const VerticalSpacing(16),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
        ),
        const VerticalSpacing(24),
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            title: widget.loading ? "Loading..." : "Login", // corrected
            onPressed: widget.loading ? null : () => _handleSubmit(), // corrected
          ),
        ),
      ],
    );
  }
}
