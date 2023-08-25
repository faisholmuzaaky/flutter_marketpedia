part of 'widget.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final TextStyle? titleStlye;
  final bool leading;
  final Widget? action;
  final Function()? ontap;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.titleStlye,
    this.action,
    this.leading = false,
    this.centerTitle = false,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: defaultMargin,
        vertical: defaultMargin,
      ),
      child: Row(
        children: [
          leading
              ? GestureDetector(
                  onTap: ontap,
                  child: const SizedBox(
                    width: 32,
                    height: 32,
                    child: Icon(Icons.arrow_back_ios),
                  ),
                )
              : centerTitle
                  ? const SizedBox(
                      width: 32,
                      height: 32,
                      // color: whiteColor,
                    )
                  : const SizedBox.shrink(),
          Expanded(
            child: Container(
              alignment: leading
                  ? Alignment.center
                  : centerTitle
                      ? Alignment.center
                      : Alignment.centerLeft,
              child: Text(
                title,
                style: titleStlye ??
                    blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: bold,
                    ),
              ),
            ),
          ),
          action ??
              const SizedBox(
                width: 32,
              ),
        ],
      ),

      // Row(
      //   children: [
      //     leading ? const Icon(Icons.arrow_back_ios) : const SizedBox.shrink(),
      //     Align(
      //       alignment: leading ? Alignment.center : Alignment.centerLeft,
      // child: Text(
      //   title,
      //   style: blackTextStyle.copyWith(
      //     fontSize: 24,
      //     fontWeight: bold,
      //   ),
      // ),
      //     ),
      //     const Expanded(
      //       child: Align(
      //         alignment: Alignment.centerRight,
      // child: Icon(
      //   Icons.notifications_none_rounded,
      //   size: 32,
      // ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
