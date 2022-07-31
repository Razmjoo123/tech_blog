import 'package:flutter/material.dart';
import 'package:tech_blog/component/my_strings.dart';
import '../component/my_text_style.dart';
import '../gen/assets.gen.dart';
import 'package:validators/validators.dart';
import 'package:tech_blog/view/my_cats.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 110),
              Assets.images.techbot.svg(height: 110),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 90),
                child: RichText(
                  text: TextSpan(
                    text: MyStrings.welcom,
                    style: welcomBotTextStyle,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _showEmailBottomSheet(context, size, textTheme);
                  },
                  child: const Text('بزن بریم'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//! Show Email Bottom Sheet
  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height * 0.37,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MyStrings.insertYourEmail,
                      style: textTheme.headline4,
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: size.width * 0.65,
                      height: 40,
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: welcomBotTextStyle,
                        // textAlignVertical: TextAlignVertical,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10.0),
                          hintText: 'techblog@gmail.com',
                          hintStyle: hinTextStyle,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      height: 47,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _showActivateCodeBottomSheet(
                              context, size, textTheme);
                        },
                        child: const Text('ادامه'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }

//! Show ActivateCode Bottom Sheet
  Future<dynamic> _showActivateCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height * 0.37,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MyStrings.activateCode,
                      style: textTheme.headline4,
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: size.width * 0.65,
                      height: 40,
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: welcomBotTextStyle,

                        // textAlignVertical: TextAlignVertical,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10.0),
                          hintText: '******',
                          hintStyle: hinTextStyle,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      height: 47,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyCats()));
                        },
                        child: Text('ادامه'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
