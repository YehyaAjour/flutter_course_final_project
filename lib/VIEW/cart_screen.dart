import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_course_final_project/SERVICES/firebase_helper.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../SERVICES/app_imports.dart';
import '../VIEW_MODEL/cart_provider.dart';
import 'custom_widget/cart_widget.dart';
import 'favourite/widget/favourite_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with TickerProviderStateMixin {
  AnimationController animationController2;
  Animation<Offset> animation2;

  intsd() {
    animationController2 = AnimationController(
      duration: const Duration(milliseconds: 750),
      vsync: this,
    )..repeat(reverse: true);
    animation2 = Tween<Offset>(
      begin: const Offset(0.70, 0),
      end: Offset.zero,
    ).animate(animationController2);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    intsd();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 60.h,
              elevation: 0,
              backgroundColor: greenColor,
              title: CustomText(
                'Cart'.tr(),
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            cart.items.isEmpty
                ? const SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '???????? ??????????',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      SlideTransition(
                        position: animation2,
                        child: const CircleAvatar(
                          radius: 15,
                          backgroundColor: greenColor,
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
            cart.items.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      Center(
                        child: Image.asset(
                          'assets/images/shopping-cart.png',
                          height: 180,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        ' ! ?????????? ?????????? ???? ???????????? ????????????',
                        style: TextStyle(
                            color: greenColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: cart.items.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          secondaryActions: [
                            IconSlideAction(
                              caption: '??????',
                              icon: Icons.delete,
                              color: Colors.red,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Text("?????????? ??????????"),
                                    content: Text("?????? ???? ?????????????? ??"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          cart.removeItem(cart.items.values
                                              .toList()[index]
                                              .id);
                                          print('Remove item');
                                          print(cart.items.values.length);
                                          Navigator.of(ctx).pop();
                                        },
                                        child: CustomText(
                                          "??????????",
                                          color: greenColor,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                        child: CustomText(
                                          "??????????",
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          ],
                          child: CartItemWidget(
                            fruitImageUrl:
                                cart.items.values.toList()[index].imgurl,
                            fruitName: cart.items.values.toList()[index].name,
                            fruitPrice: cart.items.values
                                .toList()[index]
                                .price
                                .toString(),
                            fruitDetails:
                                cart.items.values.toList()[index].desc,
                            fruitRate: '4',
                            onPressedAdd: () {},
                          ),
                        );
                      },
                    ),
                  ),
            SizedBox(height: 100,)
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            height: 90,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    cart.items.values.isEmpty
                        ? ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please Add Items To Cart')))
                        : AwesomeDialog(
                            context: context,
                            animType: AnimType.LEFTSLIDE,
                            headerAnimationLoop: false,
                            dialogType: DialogType.SUCCES,
                            showCloseIcon: true,
                            title: '???? ?????????? ??????????',
                            desc:
                                '???? ?????????? ???????? ??????????',

                            btnOkOnPress: () {
                              cart.clear();
                            },
                            btnOkIcon: Icons.check_circle,
                            onDissmissCallback: (type) {
                              cart.clear();
                            },
                          ).show();

                    FirebaseHelper.firebaseHelper.addOrderToFireStore(
                      price: cart.totalAmount.toString(),
                      orders: cart.items,
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                      color: greenColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(
                      child: Text(
                        '????????',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '??????????????',
                      style: TextStyle(
                        color: Color(0xff929292),
                        fontFamily: 'Poppins',
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      cart.totalAmount.toStringAsFixed(2),
                      style: const TextStyle(
                        color: greenColor,
                        fontFamily: 'Poppins',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
