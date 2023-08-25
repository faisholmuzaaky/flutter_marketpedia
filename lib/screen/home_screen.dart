part of 'screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imageList = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg'
  ];

  List<String> categories = [
    'assets/icons/icons8-tshirt-100.png',
    'assets/icons/icons8-tshirt-100-2.png',
    'assets/icons/icons8-headphone-100.png',
    'assets/icons/icons8-smartwatch-100.png',
    'assets/icons/icons8-device-100.png',
    'assets/icons/icons8-laptop-100.png',
    'assets/icons/icons8-bike-100.png',
  ];

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(
                title: 'Marketpedia',
                action: Icon(
                  Icons.notifications_none_rounded,
                  size: 32,
                ),
              ),
              imageCarousel(),
              topCategories(),
              newArrivals(),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageCarousel() {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: imageList.length,
          carouselController: _controller,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              width: double.infinity,
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                  image: AssetImage(imageList[index]),
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 200,
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 4.0,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == entry.key ? blackColor : greyColor,
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }

  Widget topCategories() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Categories',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: medium,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'View More >',
                    style: orangeTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories
                  .map(
                    (item) => Container(
                      margin: EdgeInsets.only(
                        left: categories.indexOf(item) == 0 ? 24 : 0,
                        right: 12,
                      ),
                      child: CardCategories(image: item),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget newArrivals() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'New Arrivals',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: medium,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View More >',
                  style: orangeTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ),
            ],
          ),
        ),
        ListProduct(),
        ListProduct(),
      ],
    );
  }
}
