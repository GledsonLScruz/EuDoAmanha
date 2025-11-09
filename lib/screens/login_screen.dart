import 'package:flutter/material.dart';
import 'signup_flow/signup_flow_screen.dart';
import 'home_screen.dart';

// TODO: Uncomment these imports when ready to connect to API
// import 'dart:convert';
// import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;
  String? _emailError;
  String? _passwordError;
  String? _generalError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateEmail() {
    setState(() {
      if (_emailController.text.isEmpty) {
        _emailError = 'Email is required';
      } else if (!RegExp(
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      ).hasMatch(_emailController.text)) {
        _emailError = 'Please enter a valid email address';
      } else {
        _emailError = null;
      }
    });
  }

  void _validatePassword() {
    setState(() {
      if (_passwordController.text.isEmpty) {
        _passwordError = 'Password is required';
      } else {
        _passwordError = null;
      }
    });
  }

  Future<void> _handleLogin() async {
    // Clear previous errors
    setState(() {
      _generalError = null;
    });

    // Validate fields
    _validateEmail();
    _validatePassword();

    if (_emailError != null || _passwordError != null) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate loading for better UX
    await Future.delayed(const Duration(seconds: 1));

    // TODO: Uncomment this section when ready to connect to API
    /*
    try {
      final response = await http.post(
        Uri.parse('https://your-api-endpoint.com/api/users/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': _emailController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        // Success - parse response and navigate to home
        final data = jsonDecode(response.body);
        
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      } else if (response.statusCode == 401) {
        // Invalid credentials
        setState(() {
          _isLoading = false;
          _generalError = 'Invalid email or password';
        });
      } else {
        // Other error
        setState(() {
          _isLoading = false;
          _generalError = 'Login failed. Please try again.';
        });
      }
    } catch (e) {
      // Network or other error
      setState(() {
        _isLoading = false;
        _generalError = 'Connection error. Please check your internet.';
      });
    }
    */

    // FOR TESTING: Always succeed
    setState(() {
      _isLoading = false;
    });

    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  void _navigateToSignUp() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SignUpFlowScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo/Icon with modern design
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEC8206).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.school_rounded,
                    size: 64,
                    color: Color(0xFFEC8206),
                  ),
                ),
                const SizedBox(height: 32),

                // Title
                Text(
                  'Bem-vindo de volta!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Entre para continuar sua jornada',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFF6B7280),
                      ),
                ),
                const SizedBox(height: 48),

                // Email Field
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'name@example.com',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.email_outlined),
                    errorText: _emailError,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  enabled: !_isLoading,
                  onChanged: (value) {
                    if (_emailError != null) {
                      _validateEmail();
                    }
                  },
                  onTap: () {
                    setState(() {
                      _emailError = null;
                      _generalError = null;
                    });
                  },
                  onEditingComplete: _validateEmail,
                ),
                const SizedBox(height: 16),

                // Password Field
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    errorText: _passwordError,
                  ),
                  obscureText: _obscurePassword,
                  enabled: !_isLoading,
                  onChanged: (value) {
                    if (_passwordError != null) {
                      _validatePassword();
                    }
                  },
                  onTap: () {
                    setState(() {
                      _passwordError = null;
                      _generalError = null;
                    });
                  },
                  onEditingComplete: _validatePassword,
                  onSubmitted: (_) => _handleLogin(),
                ),
                const SizedBox(height: 8),

                // Forgot Password Link
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _isLoading ? null : () {
                      // TODO: Implement forgot password
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Forgot password feature coming soon'),
                        ),
                      );
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ),
                const SizedBox(height: 8),

                // General Error Message
                if (_generalError != null)
                  Container(
                    padding: const EdgeInsets.all(14),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEE2E2),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFEF4444)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.error_outline, color: Color(0xFFEF4444), size: 20),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            _generalError!,
                            style: const TextStyle(
                              color: Color(0xFFEF4444),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                // Login Button
                ElevatedButton(
                  onPressed: _isLoading ? null : _handleLogin,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
                const SizedBox(height: 24),

                // Divider
                Row(
                  children: [
                    const Expanded(child: Divider(color: Color(0xFFE5E7EB))),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'OU',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    const Expanded(child: Divider(color: Color(0xFFE5E7EB))),
                  ],
                ),
                const SizedBox(height: 24),

                // Create Account Button
                OutlinedButton(
                  onPressed: _isLoading ? null : _navigateToSignUp,
                  child: const Text('Criar Conta'),
                ),
                const SizedBox(height: 24),

                // Terms and Privacy
                Text(
                  'Ao continuar, você concorda com nossos Termos de Serviço e Política de Privacidade',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 12,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

