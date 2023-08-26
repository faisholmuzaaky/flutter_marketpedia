part of 'screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: backgroundColor,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customButtonNav(),
      body: body(),
    );
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const SearchScreen();
      case 2:
        return const HistoryScreen();
      case 3:
        return const ProfileScreen();
      default:
        return const HomeScreen();
    }
  }

  Widget cartButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CartScreen(),
          ),
        );
      },
      backgroundColor: blackColor,
      child: const Icon(
        Icons.shopping_cart_outlined,
      ),
    );
  }

  Widget customButtonNav() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: blackColor,
          selectedLabelStyle: orangeTextStyle,
          unselectedLabelStyle: whiteTextStyle,
          unselectedFontSize: 14,
          selectedItemColor: orangeColor,
          unselectedItemColor: whiteColor,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  'assets/icons/icons8-home-100.png',
                  width: 32,
                  color: currentIndex == 0 ? orangeColor : whiteColor,
                ),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  'assets/icons/icons8-search-100.png',
                  width: 32,
                  color: currentIndex == 1 ? orangeColor : whiteColor,
                ),
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  'assets/icons/icons8-file-100.png',
                  width: 32,
                  color: currentIndex == 2 ? orangeColor : whiteColor,
                ),
              ),
              label: "History",
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  'assets/icons/icons8-person-100.png',
                  width: 36,
                  color: currentIndex == 3 ? orangeColor : whiteColor,
                ),
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
