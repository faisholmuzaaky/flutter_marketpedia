part of 'screen.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  List<String> size = ['S', 'M', 'L', 'XL'];
  int? currentIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                title: 'Marketpedia',
                leading: true,
                action: Icon(
                  Icons.favorite,
                  color: greyColor.withOpacity(0.4),
                  size: 32,
                ),
                ontap: () => Navigator.pop(context),
              ),
              imageProduct(),
              productDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageProduct() {
    return Container(
      margin: EdgeInsets.only(bottom: defaultMargin),
      color: greyColor,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Image.network(
          'https://cyclopedia.id/web/image/product.product/372768/image_1024?unique=4f7d1df',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget productDetails() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cooper Mount Bike',
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      '\$570.0',
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.star_border,
                  color: whiteColor,
                ),
                label: Text(
                  '4.5',
                  style: whiteTextStyle,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: orangeColor,
                ),
              )
            ],
          ),
          SizedBox(
            height: defaultMargin,
          ),
          Text(
            'Lightweight SmartForm C2 Alloy, 12x142 thru-axle, tapered headtube, BSA threaded BBm flat mount disc, StraightShot internal cable routing, multiple gear/bottle mounts',
            style: blackTextStyle,
          ),
          SizedBox(
            height: defaultMargin,
          ),
          Text(
            'Size',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
          Row(
            children: size
                .map(
                  (item) => GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = size.indexOf(item);
                      });
                    },
                    child: ListSize(
                      title: item,
                      titleStyle: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                        color: currentIndex == size.indexOf(item)
                            ? whiteColor
                            : blackColor,
                      ),
                      backgroundColor: currentIndex == size.indexOf(item)
                          ? blackColor
                          : greyColor.withOpacity(0.2),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
