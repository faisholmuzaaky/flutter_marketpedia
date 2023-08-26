part of 'widget.dart';

class ListProduct extends StatelessWidget {
  final ProductModel product;
  const ListProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartSubmit) {
          if (!Get.isSnackbarOpen) {
            customSnackBar(
              title: 'Horray!',
              message: 'The product has been added to cart',
            );
          }
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailProduct(product: product),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: 150,
            margin: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
            ),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: greyColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  margin: const EdgeInsets.only(right: 14),
                  decoration: BoxDecoration(
                    // color: whiteColor,
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                      image: NetworkImage(product.productPhoto!),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        product.productName!,
                        style: blackTextStyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                            .format(int.parse(product.productValue!)),
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 18,
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
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      alignment: Alignment.center,
                      child: const Icon(Icons.favorite),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().addCart(
                              product,
                              size: product.productSize,
                            );
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: greyColor.withOpacity(0.2),
                          ),
                        ),
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
