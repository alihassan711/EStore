// import 'package:estore/bloc/category/category_cubit.dart';
// import 'package:estore/bloc/category/category_state.dart';
// import 'package:estore/constants/color.dart';
// import 'package:estore/constants/image_path.dart';
// import 'package:estore/localization/language_constants.dart';
// import 'package:estore/model/product_model.dart';
// import 'package:estore/screens/dashboard/drawer/notification_screen.dart';
// import 'package:estore/widgets/iconbtn.dart';
// import 'package:estore/widgets/my_container.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class AllProducts extends StatefulWidget {
//   const AllProducts({Key? key}) : super(key: key);
//
//   @override
//   _AllProductsState createState() => _AllProductsState();
// }
//
// class _AllProductsState extends State<AllProducts> {
//   bool userSearch = false;
//   List<ProductModel> _userSearchList = [];
//   List<ProductModel> _list = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: whiteColor,
//         elevation: 0.0,
//         toolbarHeight: 60.0,
//          title:
//
//          TextFormField(
//           cursorColor: Colors.white,
//           decoration: InputDecoration(
//               hintText:getTranslated(context, 'search').toString(),
//               border: InputBorder.none,
//               suffixIcon: IconButton(
//                 icon: const Icon(Icons.search),
//                 color: const Color.fromRGBO(93, 25, 72, 1),
//                 onPressed: () {
//                 },
//               )),
//           style: const TextStyle(color: blackColor, fontSize: 15.0),
//            onSaved: (value) {
//              onSearchTextChanged(value!);
//            },
//            onChanged: (String value) async {
//              onSearchTextChanged(value);
//            },
//
//         ),
//         actions: [
//           // IconBtn(
//           //   icon: const Icon(
//           //     Icons.search,
//           //     color: blackColor,
//           //   ),
//           //   onPress: () {},
//           //   color: blackColor,
//           // ),
//           IconBtn(
//             icon: const Icon(
//               Icons.notifications_active_outlined,
//               color: blackColor,
//             ),
//             onPress: () {
//               Navigator.push(context,
//                   MaterialPageRoute(
//                       builder: (ctx) => const NotificationScreen()));
//             },
//             color: blackColor,
//           ),
//         ],
//         iconTheme: const IconThemeData(color: blackColor),
//       ),
//       body:  Container(
//         height: 200,
//         decoration:
//         BoxDecoration(borderRadius: BorderRadius.circular(12)),
//         child: BlocBuilder<CategoryCubit, CategoryState>(
//           builder: (context, state) {
//             if (state is InitialState) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (state is LoadingState) {
//               return const Center(
//                 child: Text("Loading..."),
//               );
//             } else if (state is ErrorState) {
//               return const Center(
//                 child: Text("Something went wrong"),
//               );
//             } else if (state is LoadedState) {
//               final List users = state.product;
//               return GridView.builder(
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     childAspectRatio: MediaQuery.of(context).size.width /
//                         (MediaQuery.of(context).size.height * 0.94),
//                   ),
//                   itemCount: users.length,
//                   itemBuilder: (BuildContext ctx, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         /*
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     ProductDetailScreen(name: users[index].name.toString(),price: users[index].price.toString(),description:users[index].description.toString(),)));
//                         */
//                       },
//                       child: MyProductContainerg(
//                         // txt:snapshot.data.name,
//                         //"Categories",
//                         img:ImagesPath.watch,
//                         //users[index].image.toString(),
//                         txt: users[index].name.toString(),
//                         price: "${getTranslated(context, 'price').toString()}: ${users[index].price.toString()}",
//                         // price: snapshot.data.price,
//                       ),
//                     );
//                   });
//             } else {
//               return Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       Text(
//                         'Loading....',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w100, fontSize: 20),
//                       ),
//                       Text(
//                         'check your internet connection!....',
//                         style:
//                         TextStyle(color: Colors.redAccent, fontSize: 10),
//                       )
//                     ],
//                   ));
//             }
//           },
//         ),
//         /*
//               ListView.builder(
//                   shrinkWrap: true,
//                   // physics: NeverScrollableScrollPhysics(),
//                   scrollDirection: Axis.horizontal,
//                   itemCount: categoryData.length,
//                   itemBuilder: (BuildContext context, index) {
//                     return MyProductContainer(
//                       txt: categoryData[index].name.toString(),
//                      id: categoryData[index].id.toString(),
//                      // "Jewelery &\n Watches",
//                       img: ImagesPath.jewelery,
//                     );
//                   }),
//               */
//       ),
//     );
//   }
//   onSearchTextChanged(String text) async {
//     if (text.length == 0) {
//       userSearch = false;
//     } else {
//       userSearch = true;
//       _userSearchList = await _list
//           .where((element) =>
//           element.uniqname!.toLowerCase().startsWith(text.toLowerCase()))
//           .toList();
//     }
//     setState(() {});
//   }
// }
