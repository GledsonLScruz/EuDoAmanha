import 'package:flutter/material.dart';
import '../../../../models/signup_data_new.dart';

class MenteeAreasScreen extends StatefulWidget {
  final SignUpDataNew signUpData;

  const MenteeAreasScreen({super.key, required this.signUpData});

  @override
  State<MenteeAreasScreen> createState() => _MenteeAreasScreenState();
}

class _MenteeAreasScreenState extends State<MenteeAreasScreen> {
  final List<String> _selectedAreas = [];

  final Map<String, Color> _academicAreas = {
    'Computer Science': const Color(0xFF6366F1),
    'Information Technology (IT)': const Color(0xFF8B5CF6),
    'Mathematics': const Color(0xFF3B82F6),
    'Physics': const Color(0xFF0EA5E9),
    'Chemistry': const Color(0xFF06B6D4),
    'Biology': const Color(0xFF10B981),
    'Engineering': const Color(0xFF14B8A6),
    'Science & Research': const Color(0xFF22C55E),
    'Entrepreneurship': const Color(0xFFF59E0B),
    'Business & Management': const Color(0xFFF97316),
    'English Language': const Color(0xFFEF4444),
    'Literature & Writing': const Color(0xFFEC4899),
    'Linguistics': const Color(0xFFD946EF),
    'Philosophy': const Color(0xFFA855F7),
    'Religion & Theology': const Color(0xFF9333EA),
    'History': const Color(0xFF7C3AED),
    'Geography': const Color(0xFF2563EB),
    'Arts & Design': const Color(0xFFDB2777),
    'Education & Teaching': const Color(0xFF059669),
    'Environmental Studies': const Color(0xFF16A34A),
  };

  @override
  void initState() {
    super.initState();
    // Load previously selected areas
    if (widget.signUpData.menteeAreasOfInterest != null &&
        widget.signUpData.menteeAreasOfInterest!.isNotEmpty) {
      _selectedAreas.addAll(
        widget.signUpData.menteeAreasOfInterest!
            .split(',')
            .map((e) => e.trim()),
      );
    }
  }

  void _toggleArea(String area) {
    setState(() {
      if (_selectedAreas.contains(area)) {
        _selectedAreas.remove(area);
      } else {
        _selectedAreas.add(area);
      }
      // Update the data model
      widget.signUpData.menteeAreasOfInterest = _selectedAreas.join(', ');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Quais são suas áreas de interesse?',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Selecione todas que se aplicam',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 32),

        // Academic Areas Grid
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: _academicAreas.entries.map((entry) {
            final isSelected = _selectedAreas.contains(entry.key);
            return _buildAreaChip(
              label: entry.key,
              color: entry.value,
              isSelected: isSelected,
              onTap: () => _toggleArea(entry.key),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildAreaChip({
    required String label,
    required Color color,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? color : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
