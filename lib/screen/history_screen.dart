part of 'screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    context.read<InternetCubit>().checkConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return BlocConsumer<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected) {
          context.read<TransactionCubit>().getHistoryTransaction();
        }
      },
      builder: (context, state) {
        context.read<TransactionCubit>().getHistoryTransaction();
        if (state is InternetConnected) {
          return SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomAppBar(
                    title: 'History Transaction',
                    action: Icon(
                      Icons.notifications_none_rounded,
                      size: 32,
                    ),
                  ),
                  listTransaction(),
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
                    title: 'History Transaction',
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

  Widget listTransaction() {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionSuccess) {
          if (state.transaction.isNotEmpty) {
            return Column(
              children: state.transaction
                  .map(
                    (item) => Container(
                      margin: EdgeInsets.only(
                        bottom: state.transaction.indexOf(item) ==
                                state.transaction.length - 1
                            ? 120
                            : 24,
                      ),
                      child: ListTransaction(transaction: item),
                    ),
                  )
                  .toList(),
            );
          } else {
            return NoContent(
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: orangeColor,
                size: 100,
              ),
              title: 'No transaction',
              message: 'Lets find something for you',
              buttoTittle: 'Explore Product',
              buttonWidth: 150,
              buttonHeight: 48,
              onTap: () => Get.to(const MainScreen()),
            );
          }
        } else {
          return NoContent(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: orangeColor,
              size: 100,
            ),
            title: 'Something wrong',
            message: 'something problem when fetch data',
            buttoTittle: 'Refresh',
            buttonWidth: 150,
            buttonHeight: 48,
            onTap: () => setState(() {}),
          );
        }
      },
    );
  }
}
