part of 'screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CartCubit>().getallCart();
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartSuccess && state.cart.isNotEmpty) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(
                    title: 'Your Cart',
                    leading: true,
                    ontap: () => Get.back(),
                  ),
                  cartList(),
                  billingInformation(),
                  buttonCheckOut(),
                ],
              ),
            ),
          );
        } else {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(
                    title: 'Your Cart',
                    leading: true,
                    ontap: () => Get.back(),
                  ),
                  NoContent(
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
        }
      },
    );
  }

  Widget cartList() {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartSuccess) {
          return Column(
            children: state.cart
                .map((item) => ListItemCart(
                      cart: item,
                    ))
                .toList(),
          );
        }
        return Container();
      },
    );
  }

  Widget billingInformation() {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
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
      },
    );
  }

  Widget buttonCheckOut() {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartCheckoutSuccess) {
          Get.to(
            const MainScreen(),
          );
        }
      },
      builder: (context, state) {
        if (state is CartLoading) {
          return Container(
            margin: EdgeInsets.only(top: defaultMargin),
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
