part of 'screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          context.read<ProductCubit>().getAllProducts();
        }
      },
      builder: (context, state) {
        if (state is InternetConnected) {
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
                  profile(),
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

  Widget profile() {
    return Column(
      children: [
        //photo
        Container(
          alignment: Alignment.center,
          width: 100,
          height: 100,
          margin: EdgeInsets.symmetric(vertical: defaultMargin),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: orangeColor),
          ),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                    'https://ui-avatars.com/api/?name=USER&background=eb7430&color=fff'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        //fullname
        Text(
          'User',
          style: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        //email
        Text(
          "User@user.com",
          style: greyTextStyle,
        ),
        const SizedBox(height: 36),
        //transaction
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ItemList(
            title: 'Transaction',
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: orangeColor,
            ),
          ),
        ),
        const SizedBox(height: 12),
        //edit profile
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ItemList(
            title: 'Edit Profile',
            icon: Icon(
              Icons.person_outline_rounded,
              color: orangeColor,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ItemList(
            title: 'Your Address',
            icon: Icon(
              Icons.location_on_outlined,
              color: orangeColor,
            ),
          ),
        ),
        const SizedBox(height: 12),
        //sign out
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ItemList(
            title: 'Sign Out',
            icon: Icon(
              Icons.logout,
              color: orangeColor,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          padding: const EdgeInsets.only(
            top: 24,
            bottom: 100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Help Center',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 12),
              ItemList(
                title: 'Customer Service',
                icon: Icon(
                  Icons.phone,
                  color: orangeColor,
                ),
              ),
              const SizedBox(height: 12),
              ItemList(
                title: 'Terms of Service',
                icon: Icon(
                  Icons.text_snippet_outlined,
                  color: orangeColor,
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        )
      ],
    );
  }
}
