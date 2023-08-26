part of 'screen.dart';

class DetailProduct extends StatefulWidget {
  final ProductModel product;
  const DetailProduct({super.key, required this.product});

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
      bottomNavigationBar: customBottom(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                title: widget.product.productName!,
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
          widget.product.productPhoto!,
          fit: BoxFit.fill,
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
                      widget.product.productName!,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                              locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                          .format(int.parse(widget.product.productValue!)),
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
            widget.product.productDescription!,
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

  Widget customBottom() {
    return Container(
      height: 70,
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(right: defaultMargin),
            decoration: BoxDecoration(
              color: greyColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(
              Icons.shopping_bag_outlined,
              size: 32,
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: orangeColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'Add to Cart',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
