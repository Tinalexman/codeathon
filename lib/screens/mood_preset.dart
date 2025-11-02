import 'package:flutter/material.dart';
import 'gemini_screen.dart';

class MoodPresetsScreen extends StatefulWidget {
  const MoodPresetsScreen({Key? key}) : super(key: key);

  @override
  State<MoodPresetsScreen> createState() => _MoodPresetsScreenState();
}

class _MoodPresetsScreenState extends State<MoodPresetsScreen> {
  final List<String> _selectedPresets = [];

  final List<PresetItem> _presets = [
    PresetItem(
      id: 'music',
      icon: Icons.music_note,
      label: 'Music',
      color: const Color(0xFF9333EA),
    ),
    PresetItem(
      id: 'recipes',
      icon: Icons.restaurant,
      label: 'Food Recipes',
      color: const Color(0xFFF97316),
    ),
    PresetItem(
      id: 'songs',
      icon: Icons.mic,
      label: 'Song References',
      color: const Color(0xFFEC4899),
    ),
    PresetItem(
      id: 'books',
      icon: Icons.menu_book,
      label: 'Books',
      color: const Color(0xFF3B82F6),
    ),
    PresetItem(
      id: 'movies',
      icon: Icons.movie,
      label: 'Movies',
      color: const Color(0xFFEF4444),
    ),
    PresetItem(
      id: 'activities',
      icon: Icons.auto_awesome,
      label: 'Activities',
      color: const Color(0xFFEAB308),
    ),
    PresetItem(
      id: 'cafes',
      icon: Icons.coffee,
      label: 'Café Spots',
      color: const Color(0xFFD97706),
    ),
    PresetItem(
      id: 'wellness',
      icon: Icons.favorite,
      label: 'Wellness Tips',
      color: const Color(0xFF22C55E),
    ),
  ];

  void _togglePreset(String presetId) {
    setState(() {
      if (_selectedPresets.contains(presetId)) {
        _selectedPresets.remove(presetId);
      } else {
        _selectedPresets.add(presetId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey[100],
                  shape: const CircleBorder(),
                ),
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Mood indicator
                    Text(
                      'Feeling Calm',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),

                    // Title
                    const Text(
                      'Get personalized',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    const Row(
                      children: [
                        Text(
                          'recommendations',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF97316),
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Subtitle
                    Text(
                      'Select what you\'d like to explore based on your mood',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 32),

                    // Presets Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 1.0,
                          ),
                      itemCount: _presets.length,
                      itemBuilder: (context, index) {
                        final preset = _presets[index];
                        final isSelected = _selectedPresets.contains(preset.id);

                        return GestureDetector(
                          onTap: () => _togglePreset(preset.id),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFF97316)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFFF97316)
                                    : Colors.grey[300]!,
                                width: 2,
                              ),
                              boxShadow: isSelected
                                  ? [
                                      BoxShadow(
                                        color: const Color(
                                          0xFFF97316,
                                        ).withOpacity(0.3),
                                        blurRadius: 12,
                                        offset: const Offset(0, 4),
                                      ),
                                    ]
                                  : [],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Colors.white.withOpacity(0.2)
                                            : preset.color,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        preset.icon,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    ),
                                    if (isSelected)
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.check,
                                          color: Color(0xFFF97316),
                                          size: 14,
                                        ),
                                      ),
                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  preset.label,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),

                    // Continue Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _selectedPresets.isEmpty
                            ? null
                            : () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GeminiScreen(
                                      selectedPresets: _selectedPresets,
                                    ),
                                  ),
                                );
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF97316),
                          disabledBackgroundColor: Colors.grey[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          elevation: _selectedPresets.isEmpty ? 0 : 4,
                        ),
                        child: Text(
                          _selectedPresets.isEmpty
                              ? 'Select at least one'
                              : 'Continue (${_selectedPresets.length} selected)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: _selectedPresets.isEmpty
                                ? Colors.grey[500]
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Skip Button
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Handle skip action
                        },
                        child: Text(
                          'Skip for now',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PresetItem {
  final String id;
  final IconData icon;
  final String label;
  final Color color;

  PresetItem({
    required this.id,
    required this.icon,
    required this.label,
    required this.color,
  });
}
