part of 'shared.dart';

final box = GetStorage();

SnackbarController customSnackBar({
  required String title,
  required String message,
}) {
  return Get.showSnackbar(
    GetSnackBar(
      titleText: Text(
        title,
        style: whiteTextStyle.copyWith(
          fontSize: 12,
          fontWeight: bold,
          color: whiteColor,
        ),
      ),
      messageText: Text(message, style: whiteTextStyle),
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      backgroundColor: orangeColor,
      borderRadius: 10,
      margin: EdgeInsets.only(
        left: defaultMargin,
        top: 20,
        right: defaultMargin,
      ),
    ),
  );
}

customDialog({
  required String title,
  required String message,
  required Function()? ontapConfirm,
}) {
  Get.defaultDialog(
    title: title,
    titleStyle: blackTextStyle.copyWith(
      fontSize: 16,
      fontWeight: bold,
    ),
    titlePadding: const EdgeInsets.only(top: 16),
    radius: 6,
    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
    content: Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Text(
          message,
          style: blackTextStyle.copyWith(
            color: blackColor,
            fontWeight: medium,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: ontapConfirm,
              child: Container(
                width: 65,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    'Yes',
                    style: whiteTextStyle,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                width: 65,
                height: 32,
                decoration: BoxDecoration(
                  color: redColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    'Cancel',
                    style: whiteTextStyle,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Stream<bool> streamInternetConnection() async* {
  bool result = false;
  InternetConnectionChecker().onStatusChange.listen((event) {
    result = event == InternetConnectionStatus.connected;
  });
  yield result;
  // if (result) {
  //   yield true;
  // } else {
  //   yield false;
  // }
}

void saveAllCart(List<CartModel> cart) {
  removeCartFromLocal();
  box.write('cart', cart);
}

getAllCartFromLocal() {
  return box.read('cart') ?? [];
}

void removeCartFromLocal() {
  box.remove('cart');
}
