import 'package:flutter/material.dart';
import 'package:codeathon/screens/mood_preset.dart';

class MoodInputScreen extends StatefulWidget {
  const MoodInputScreen({Key? key}) : super(key: key);

  @override
  State<MoodInputScreen> createState() => _MoodInputScreenState();
}

class _MoodInputScreenState extends State<MoodInputScreen> {
  double _moodValue = 0.5; // Default to middle/calm
  String _currentMood = 'Calm';

  void _updateMood(double value) {
    setState(() {
      _moodValue = value;
      // Update mood text based on slider value
      if (value < 0.2) {
        _currentMood = 'Sad';
      } else if (value < 0.4) {
        _currentMood = 'Tired';
      } else if (value < 0.6) {
        _currentMood = 'Calm';
      } else if (value < 0.8) {
        _currentMood = 'Happy';
      } else {
        _currentMood = 'Excited';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   color: Colors.black,
        //   onPressed: () => Navigator.pop(context),
        // ),
        title: const Text('Mood Input', style: TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Let's capture your\n",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.2,
                      ),
                    ),
                    TextSpan(
                      text: 'mood ',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[500],
                        height: 1.2,
                      ),
                    ),
                    const TextSpan(
                      text: 'for today.',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.amber[300],
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text('😌', style: TextStyle(fontSize: 60)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "I'm Feeling $_currentMood",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue[200]!,
                      Colors.green[200]!,
                      Colors.yellow[200]!,
                      Colors.orange[200]!,
                      Colors.red[200]!,
                    ],
                  ),
                ),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.transparent,
                    inactiveTrackColor: Colors.transparent,
                    thumbColor: Colors.white,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 20,
                    ),
                    overlayColor: Colors.white.withOpacity(0.2),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 28,
                    ),
                  ),
                  child: Slider(
                    value: _moodValue,
                    onChanged: _updateMood,
                    min: 0,
                    max: 1,
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MoodPresetsScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF97316),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'Save My Feeling',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
