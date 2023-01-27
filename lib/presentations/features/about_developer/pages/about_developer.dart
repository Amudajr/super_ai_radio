import 'package:ai_radio/utils/ai_utils.dart';
import 'package:flutter/material.dart';

class AboutDeveloper extends StatelessWidget {
  const AboutDeveloper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AIColors.primaryColor1,
        title: const Text(
          'About Developer',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/amuda.jpeg'),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Kewulere Amuda',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'classicallow@gmail.com',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "I love to solve problems using technology that improves user’s life on a major scale. Over the last several years, I have been developing and leading various mobile apps in different areas. More than just programming, I’m known for being a detail-oriented, well-organized team player. I never miss deadlines, I’m a good communicator and I can juggle multiple tasks at once. I'm open to job anyways.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
