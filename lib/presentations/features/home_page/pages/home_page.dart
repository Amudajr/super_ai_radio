import 'package:ai_radio/core/routes/routes.gr.dart';
import 'package:ai_radio/presentations/domain/model/radio_response.dart';
import 'package:ai_radio/utils/ai_utils.dart';
import 'package:alan_voice/alan_voice.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MyRadio>? radio;
  MyRadio? selectedRadio;
  Color? selectedColor;
  bool isPlaying = false;
  late AssetsAudioPlayer assetsAudioPlayer;

  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    fetchRadioSations();
    setupAlan();
    assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    // audioPlayer.onPlayerStateChanged.listen((event) {
    //   if (event == PlayerState.playing) {
    //     isPlaying = true;
    //   } else {
    //     isPlaying = false;
    //   }
    //   setState(() {});
    // });
  }

  handleCommad(Map<String, dynamic> response) {
    switch (response['command']) {
      case "play":
        context.router.push(
          RadioWebviewRouter(
              radioUrl: selectedRadio?.url, tagline: selectedRadio?.tagline),
        );
        break;
      case "stop":
        context.navigateBack();
        break;
      case "go back":
        context.navigateBack();
        break;
      default:
        // print("Command was ${response["command"]}");
        break;
    }
  }

  setupAlan() {
    AlanVoice.addButton(
      "74751ba8d14c57c28eef72fbd399846b2e956eca572e1d8b807a3e2338fdd0dc/stage",
      buttonAlign: AlanVoice.BUTTON_ALIGN_RIGHT,
    );
    AlanVoice.callbacks.add((command) => handleCommad(command.data));
  }

  void fetchRadioSations() async {
    final radioJson = await rootBundle.loadString("assets/radio.json");
    radio = MyRadioList.fromJson(radioJson).radio;
    selectedRadio = radio?[0];
    setState(() {});
  }

  void playLink() async {
    await assetsAudioPlayer.open(
      Audio.network('http://tun.in/seSg1'),
    );
  }

  void playRadio(String url) async {
    // await audioPlayer.play(UrlSource(url));
    await assetsAudioPlayer.open(
      Audio.network(url),
    );
    selectedRadio = radio?.firstWhere((element) => element.url == url);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AIColors.primaryColor1,
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'SUPER AI RADIO',
                  style: GoogleFonts.dmSans(
                    color: AIColors.primaryColor2,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: Icon(
                  Icons.radio_outlined,
                  color: AIColors.primaryColor2,
                ),
              ),
              const Divider(
                thickness: 1,
                color: Colors.black,
                height: 15,
              ),
              ListTile(
                title: Text(
                  'About Super AI',
                  style: GoogleFonts.dmSans(
                    color: AIColors.primaryColor1,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: Icon(
                  Icons.info_outline,
                  color: AIColors.primaryColor1,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 15,
                  color: AIColors.primaryColor1,
                ),
                onTap: () => context.router.push(const AboutSuperAIRouter()),
              ),
              ListTile(
                title: Text(
                  'How To Use',
                  style: GoogleFonts.dmSans(
                    color: AIColors.primaryColor1,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: Icon(
                  Icons.read_more_outlined,
                  color: AIColors.primaryColor1,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 15,
                  color: AIColors.primaryColor1,
                ),
                onTap: () => context.router.push(const HowToUseRouter()),
              ),
              ListTile(
                title: Text(
                  'About Developer',
                  style: GoogleFonts.dmSans(
                    color: AIColors.primaryColor1,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: Icon(
                  Icons.account_circle_outlined,
                  color: AIColors.primaryColor1,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 15,
                  color: AIColors.primaryColor1,
                ),
                onTap: () => context.router.push(const AboutDeveloperRouter()),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          VxAnimatedBox()
              .size(context.screenWidth, context.screenHeight)
              .withGradient(
                LinearGradient(
                  colors: [
                    AIColors.primaryColor1,
                    AIColors.primaryColor2,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              )
              .make(),
          AppBar(
            title: 'Super AI Radio'.text.xl4.bold.white.make().shimmer(
                  primaryColor: AIColors.primaryColor1,
                ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ).h(100).p16(),
          radio == null
              ? Center(
                  child: LoadingAnimationWidget.horizontalRotatingDots(
                    color: Colors.white,
                    size: 50,
                  ),
                )
              : VxSwiper.builder(
                  itemCount: radio!.length,
                  aspectRatio: 1.0,
                  enlargeCenterPage: true,
                  onPageChanged: (index) {
                    selectedRadio = radio?[index];
                    setState(() {});
                  },
                  itemBuilder: (context, index) {
                    final rad = radio?[index];
                    return VxBox(
                      child: ZStack(
                        [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: VStack(
                              [
                                rad!.name!.text.xl3.white.bold.make(),
                                5.heightBox,
                                rad.tagline!.text.sm.white.semiBold.make(),
                                5.heightBox,
                              ],
                              crossAlignment: CrossAxisAlignment.center,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: [
                              IconButton(
                                onPressed: () {
                                  context.router.push(
                                    RadioWebviewRouter(
                                      radioUrl: rad.url,
                                      tagline: rad.tagline,
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  CupertinoIcons.play_circle_fill,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                              "Tap To Play".text.extraBold.white.make(),
                            ].vStack(),
                          )
                        ],
                      ),
                    )
                        .bgImage(
                          DecorationImage(
                            image: NetworkImage(
                              rad.image.toString(),
                            ),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.3),
                              BlendMode.darken,
                            ),
                          ),
                        )
                        .withRounded(value: 50)
                        .make()
                        .onTap(() {
                      context.router.push(RadioWebviewRouter(
                          radioUrl: rad.url, tagline: rad.tagline));
                    }).p16();
                  },
                ).centered(),
          Align(
              alignment: Alignment.bottomCenter,
              child: [
                // if (isPlaying)
                //   "Listening to - ${selectedRadio?.name} FM"
                //       .text
                //       .white
                //       .makeCentered(),
                // Icon(
                //   isPlaying
                //       ? CupertinoIcons.stop_circle
                //       : CupertinoIcons.play_circle,
                //   color: Colors.white,
                //   size: 50,
                // ).pOnly(bottom: context.percentHeight * 12).onTap(() {
                //   if (isPlaying) {
                //     audioPlayer.stop();
                //   } else {
                //     playRadio(selectedRadio!.url!);
                //   }
                // }),
                radio == null
                    ? const Text(
                        '...loading',
                        style: TextStyle(color: Colors.transparent),
                      )
                    : Text(
                        selectedRadio!.desc.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ).pOnly(bottom: context.percentHeight * 15),
              ].vStack()),
        ],
      ),
    );
  }
}
