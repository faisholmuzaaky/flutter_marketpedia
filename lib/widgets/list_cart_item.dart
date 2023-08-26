part of 'widget.dart';

class ListItemCart extends StatelessWidget {
  final CartModel cart;
  const ListItemCart({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        bottom: defaultMargin,
      ),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            margin: const EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                image: NetworkImage(cart.product!.productPhoto!),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  cart.product!.productName!,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  NumberFormat.currency(
                          locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                      .format(int.parse(cart.product!.productValue!)),
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Size : XL',
                  style: blackTextStyle,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => context.read<CartCubit>().addQuantity(cart),
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: blackColor,
                  ),
                  child: Icon(
                    Icons.add,
                    color: whiteColor,
                  ),
                ),
              ),
              Text(
                cart.quantity.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              GestureDetector(
                onTap: () => context.read<CartCubit>().reduceQuantity(cart),
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: blackColor,
                  ),
                  child: Icon(
                    Icons.remove,
                    color: whiteColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
