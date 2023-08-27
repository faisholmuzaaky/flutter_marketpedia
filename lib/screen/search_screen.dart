part of 'screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return BlocConsumer<InternetCubit, InternetState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is InternetConnected) {
          return SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomAppBar(
                    title: 'Search',
                    action: Icon(
                      Icons.notifications_none_rounded,
                      size: 32,
                    ),
                  ),
                  searchBar(),
                  product(),
                ],
              ),
            ),
          );
        } else {
          return SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomAppBar(
                    title: 'Your Profile',
                    action: Icon(
                      Icons.notifications_none_rounded,
                      size: 32,
                    ),
                  ),
                  NoContent(
                    icon: Icon(
                      Icons.wifi_off,
                      color: orangeColor,
                      size: 100,
                    ),
                    title: 'Your connection are lost',
                    message:
                        'Please check your internet connection\nand try again',
                    buttoTittle: 'Refresh',
                    buttonWidth: 150,
                    buttonHeight: 48,
                    onTap: () =>
                        context.read<InternetCubit>().checkConnection(),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget searchBar() {
    return Container(
      margin: EdgeInsets.only(
          left: defaultMargin, right: defaultMargin, bottom: defaultMargin),
      child: GestureDetector(onTap: () {}, child: const CustomSearchBar()),
    );
  }

  Widget product() {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return Column(
            children: [
              Column(
                children: state.products
                    .map(
                      (item) => Container(
                        margin: EdgeInsets.only(
                          bottom: state.products.indexOf(item) ==
                                  state.products.length - 1
                              ? 120
                              : 24,
                        ),
                        child: ListProduct(
                          product: item,
                        ),
                      ),
                    )
                    .toList(),
              )
            ],
          );
        }
        return Container();
      },
    );
  }
}
