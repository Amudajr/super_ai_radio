import 'package:ai_radio/utils/ai_utils.dart';
import 'package:flutter/material.dart';

class HowToUse extends StatelessWidget {
  const HowToUse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AIColors.primaryColor1,
        title: const Text(
          'How To Use',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Press on the floating button at the bottom right to initiate the AI',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              const SizedBox(height: 15),
              const Text(
                'Note:',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              const SizedBox(height: 10),
              const Text(
                'The blue floating button means the AI have not been initiated untill you tap on it.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'The red floating button means the AI is listening to you speech/question, after your question keep calm for the AI to process your response.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'The green floating button means the AI is processing a good response for you, keep calm for the AI to respond.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'The orange floating button means the AI is responding to your question.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: AIColors.primaryColor1,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'The grey floating button means the AI is out of network, please check your internet connection.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
