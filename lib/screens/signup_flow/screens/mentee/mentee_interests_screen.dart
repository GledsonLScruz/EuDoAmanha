import 'package:flutter/material.dart';
import '../../../../models/signup_data_new.dart';

class MenteeInterestsScreen extends StatefulWidget {
  final SignUpDataNew signUpData;

  const MenteeInterestsScreen({super.key, required this.signUpData});

  @override
  State<MenteeInterestsScreen> createState() => _MenteeInterestsScreenState();
}

class _MenteeInterestsScreenState extends State<MenteeInterestsScreen> {
  final _strengthsController = TextEditingController();
  String? _strengthsError;

  @override
  void initState() {
    super.initState();
    _strengthsController.text = widget.signUpData.menteeStrengths ?? '';
  }

  @override
  void dispose() {
    _strengthsController.dispose();
    super.dispose();
  }

  void _validateStrengths() {
    setState(() {
      if (_strengthsController.text.isEmpty) {
        _strengthsError = 'Strengths are required';
      } else {
        _strengthsError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Strengths',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Share what you\'re good at',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 32),

        // Strengths
        TextField(
          controller: _strengthsController,
          decoration: InputDecoration(
            labelText: 'Strengths',
            hintText: 'Problem solving, creativity, teamwork...',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.star),
            errorText: _strengthsError,
            helperText: 'What are you naturally good at?',
          ),
          maxLines: 5,
          onChanged: (value) {
            widget.signUpData.menteeStrengths = value;
            if (_strengthsError != null) {
              _validateStrengths();
            }
          },
          onTap: () {
            setState(() {
              _strengthsError = null;
            });
          },
          onEditingComplete: _validateStrengths,
        ),
      ],
    );
  }
}
