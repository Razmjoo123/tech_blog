import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tech_blog/models/data_models.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/my_component.dart';
import 'package:tech_blog/my_strings.dart';
import 'package:tech_blog/my_text_style.dart';

import '../gen/assets.gen.dart';
import '../my_colors.dart';

class MyCats extends StatefulWidget {
  const MyCats({Key? key}) : super(key: key);

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 70),
                  Assets.images.techbot.svg(height: 110),
                  const SizedBox(height: 15),
                  Text(
                    MyStrings.successfulRegistration,
                    style: profileNameTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: size.width * 0.65,
                      height: 40,
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: welcomBotTextStyle,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintText: 'نام و نام خانوادگی',
                          hintStyle: hinTextStyle,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    MyStrings.chooseCats,
                    style: profileNameTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  //! لیست دسته بندی های مورد علاقه
                  SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: tagList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // mainAxisExtent: 100,
                        childAspectRatio: 0.3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: ((context, index) {
                        // return Container();
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (!selectedTags.contains(tagList[index])) {
                                //! اگر در لیست نبود اضافه کند
                                selectedTags.add(
                                    HashTagModel(title: tagList[index].title));
                              }
                            });
                          },
                          child: MainTags(textTheme: textTheme, index: index),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Assets.icons.downCatArrow.image(scale: 2.5),
                  const SizedBox(height: 40),
                  //! لیست پایینی
                  SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: selectedTags.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: ((context, index) {
                        return Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: SolidColors.surface,
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedTags.removeAt(index);
                                  });
                                },
                                child:
                                    Icon(Icons.delete, color: Colors.grey[500]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Center(
                                    child: Text(selectedTags[index].title,
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 11))),
                                // ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
