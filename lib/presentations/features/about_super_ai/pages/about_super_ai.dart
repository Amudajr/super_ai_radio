import 'package:ai_radio/utils/ai_utils.dart';
import 'package:flutter/material.dart';

class AboutSuperAI extends StatelessWidget {
  const AboutSuperAI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AIColors.primaryColor1,
        title: const Text(
          'About Super AI',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: const [
              Text(
                '         The Super AI (Artificial Intelligent) was trained to respond to basic arithmetics, weather conditions, bitcoin talks, ask directions, chats, translator and news accross the globe. Some other tasks that can be assigned to the Tomiwa(AI) are to play the present radio channel by saying play, stop the current radio channel by saying stop, and going back to the previous page by sayin go back and some other more I could not mention. Sit back as we improve more and serve you better. \n\n\nThanks. \nBest Regards',
                textAlign: TextAlign.justify,
                textWidthBasis: TextWidthBasis.longestLine,
                textScaleFactor: 1,
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
