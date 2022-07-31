import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/view/home_screen.dart';
import 'package:tech_blog/view/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.scafoldBg,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: ListView(
              children: [
                DrawerHeader(child: Assets.images.logo.image(scale: 2.5)),
                ListTile(
                  title: const Text(
                    'پروفایل کاربری',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {},
                ),
                const Divider(color: SolidColors.dividerColor),
                ListTile(
                  title: const Text(
                    'درباره تک بلاگ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {},
                ),
                const Divider(color: SolidColors.dividerColor),
                ListTile(
                  title: const Text(
                    'اشتراک گذاری تک بلاگ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {},
                ),
                const Divider(color: SolidColors.dividerColor),
                ListTile(
                  title: const Text(
                    'تک بلاگ در گیت هاب',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {},
                ),
                const Divider(color: SolidColors.dividerColor),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading:
              false, //! برای حذف آیکن منویی که دراور اضافه می کند
          backgroundColor: SolidColors.scafoldBg,
          elevation: 0,
          title: //منوی بالای صفحه اصلی
              Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  child: const Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                //fluttergen استفاده از تصویر با
                Assets.images.logo.image(
                  height: size.height / 13.6,
                ),
                //روش عادی
                // Image.asset(
                //   'assets/images/logo.png',
                //   height: size.height / 13.6,
                // ),
                const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned.fill(
              child: IndexedStack(
                index: selectedPageIndex,
                children: [
                  HomeScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                  ProfileScreen(
                      size: size, textTheme: textTheme, bodyMargin: bodyMargin)
                ],
              ),
            ),
            //بانم نویگیتور
            ButtonNavigation(changeScreen: (int value) {
              setState(() {
                selectedPageIndex = value;
              });
            }),
          ],
        ),
      ),
    );
  }
}

//! نوار پایینی
class ButtonNavigation extends StatelessWidget {
  const ButtonNavigation({
    Key? key,
    required this.changeScreen,
  }) : super(key: key);
  final Function(int) changeScreen;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        // height: size.height / 8,
        height: 120,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: GradiantColors.bottomNavBackgroand,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 30),
          child: Container(
            // height: 60,
            // height: size.height / 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: GradiantColors.bottomNav,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () => changeScreen(0),
                    icon: Assets.icons.home.image(height: 30)),
                IconButton(
                    onPressed: () {},
                    icon: Assets.icons.write.image(height: 30)),
                IconButton(
                    onPressed: () => changeScreen(1),
                    icon: Assets.icons.user.image(height: 30)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
