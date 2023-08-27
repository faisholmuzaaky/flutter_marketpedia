part of 'screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<CartCubit>().getallCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartCheckoutSuccess) {
          Get.to(
            const MainScreen(),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(
                  title: 'Your Cart',
                  leading: true,
                  ontap: () {
                    // saveAllCart(state.cart);
                    Get.back();
                  },
                ),
                context.read<CartCubit>().cart.isNotEmpty
                    ? Column(
                        children: [
                          cartList(),
                          billingInformation(),
                          buttonCheckOut(),
                        ],
                      )
                    : NoContent(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: orangeColor,
                          size: 90,
                        ),
                        title: 'Opss! Your Cart is Empty',
                        message: 'Lets find something for you',
                        buttoTittle: 'Explore Product',
                        buttonWidth: 150,
                        buttonHeight: 48,
                        onTap: () => Get.to(const MainScreen()),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget cartList() {
    return Column(
        children: context
            .read<CartCubit>()
            .cart
            .map(
              (item) => ListItemCart(
                cart: item,
              ),
            )
            .toList());
  }

  Widget billingInformation() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Billing Information',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: defaultMargin,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Total',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              Text(
                NumberFormat.currency(
                        locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                    .format(context.read<CartCubit>().totalPrice()),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tax 10%',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              Text(
                NumberFormat.currency(
                        locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                    .format(context.read<CartCubit>().totalPrice() * 0.1),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              )
            ],
          ),
          SizedBox(
            height: defaultMargin,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '- - - - - - -',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Grand Total',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              Text(
                NumberFormat.currency(
                        locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                    .format(context.read<CartCubit>().totalPrice() * 0.1 +
                        context.read<CartCubit>().totalPrice()),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buttonCheckOut() {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: defaultMargin),
            child: CircularProgressIndicator(
              color: orangeColor,
            ),
          );
        }
        return GestureDetector(
          onTap: () => context.read<CartCubit>().checkOut(),
          child: Container(
            width: double.infinity,
            height: 48,
            margin: EdgeInsets.all(defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            decoration: BoxDecoration(
              color: orangeColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  color: whiteColor,
                  size: 28,
                ),
                Text(
                  'Checkout',
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }
}
