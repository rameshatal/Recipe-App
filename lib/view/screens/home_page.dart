import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/controllers/home_page_controller.dart';
import 'package:get/get.dart';
import '../../controllers/bottom_home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBottomNavigationController homeBottomNavigationController = Get.put(HomeBottomNavigationController());
    final HomePageController homePageController = Get.put(HomePageController());
    TextEditingController searchTextEditingController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
             Padding(
              padding: EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Obx(()=>Text(
                  "Hello,${homePageController.name.value}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Text(
                      "What would you like to cook today?",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYkqkkFGI0jMCkzMZZmFUuvdYXkWPiybX_Yg&usqp=CAU"),
                          fit: BoxFit.fill,
                        ),
                        color: Colors.red,
                        shape: BoxShape.circle),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  controller: searchTextEditingController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      size: 30,
                    ),
                    hintText: "Search any recipes",
                    suffixIcon: const Icon(Icons.save_alt_rounded),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.green),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                    horizontal: 15), // Padding around the ListView
                children: List.generate(
                  5,
                  (index) => Container(
                    margin: const EdgeInsets.only(
                        left: 5), // Adjust margin for the first item
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                          8), // Padding inside the container
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt4D9MVvCObDClml1AaC7ttua59Mc2IPmFEA&usqp=CAU',
                            fit: BoxFit.fill,
                            height: 40,
                            width: 50,
                          ),
                          const SizedBox(
                              height: 5), // Space between image and text
                          const Text(
                            'Breakfast item',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommendation",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.green),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // SizedBox(
            //   height: 150,
            //   child: ListView(
            //     padding: const EdgeInsets.symmetric(
            //         horizontal: 15.0), // Adjust padding as needed
            //     scrollDirection: Axis.horizontal,
            //     shrinkWrap: true,
            //     children: List.generate(
            //         5,
            //         (index) => Container(
            //               margin: const EdgeInsets.only(left: 5),
            //               height: 140,
            //               width: 120,
            //               decoration: BoxDecoration(
            //                   image: const DecorationImage(
            //                       image: NetworkImage(
            //                           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPRqDDAJ4TA0YCXkS9cJlo5cgYEsQp1zYE74jMQli7FqlqOijyRhxyrCVOIsV1gq-rsI0&usqp=CAU'),
            //                       fit: BoxFit.cover),
            //                   color: Colors.red,
            //                   borderRadius: BorderRadius.circular(20)),
            //             )),
            //   ),
            // ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Obx(()=>Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children:List.generate(homePageController.fooData.length, (index) => Padding(
            //       padding:  EdgeInsets.only(left: 15,right: index==4?15:0),
            //       child: InkWell(
            //         onTap: (){Get.toNamed('/SecondScreen',arguments: {'id':homePageController.fooData[index].id??0});},
            //         child: SizedBox(
            //           width: 120,
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Container(
            //                 height: 140,
            //                 width: 120,
            //                 decoration: BoxDecoration(
            //                     image:  DecorationImage(
            //                         image: NetworkImage(
            //                             homePageController.fooData[index].image??""),
            //                         fit: BoxFit.cover),
            //                     color: Colors.red,
            //                     borderRadius: BorderRadius.circular(15)),
            //               ),
            //               const SizedBox(height: 5,),
            //               Text(homePageController.fooData[index].name??"",style:TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.w600 )),
            //               Wrap(
            //                 children: List.generate(homePageController.fooData[index].tags?.length??0, (tagIndex) => Text('${homePageController.fooData[index].tags?[tagIndex]??""}, ',style: TextStyle(fontSize: 10,color: Colors.black.withOpacity(.6))),),
            //               )
            //
            //             ],
            //           ),
            //         ),
            //       ),
            //     )),
            //   )),
            // ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FutureBuilder(
                future: homePageController.getRecipeDataForFuture(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          snapshot.data?.recipes?.length ?? 0,
                          (index) => Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: index == 4 ? 15 : 0),
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed('/SecondScreen', arguments: {
                                      'id': snapshot.data?.recipes?[index].id ?? 0
                                    });
                                  },
                                  child: SizedBox(
                                    width: 120,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 140,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(snapshot.data?.recipes?[index].image ??""),
                                                  fit: BoxFit.cover),
                                              color: Colors.red,
                                              borderRadius: BorderRadius.circular(15)),),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                            snapshot.data?.recipes?[index].name ??
                                                "",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600)),
                                        Wrap(
                                          children: List.generate(
                                            snapshot.data?.recipes?[index].tags
                                                    ?.length ??
                                                0,
                                            (tagIndex) => Text(
                                                '${snapshot.data?.recipes?[index].tags?[tagIndex] ?? ""}, ',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black
                                                        .withOpacity(.6))),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Creamy Pasta",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "By David Charges",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recipes Of The Week",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.green),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            SizedBox(
              height: 220,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: List.generate(
                    10,
                    (index) => Container(
                          margin: const EdgeInsets.only(left: 5),
                          width: 250,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTLxkC-sp1PF0jqgW50LWhO0BETZ0rQx7rEw&usqp=CAU'),
                                  fit: BoxFit.cover),
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)),
                        )),
              ),
            ),
          ],
        ),
        /* floatingActionButton: FloatingActionButton(
       onPressed: () {  },
       child: const Icon(Icons.add),

       ),*/
        bottomNavigationBar: Obx(() => CurvedNavigationBar(
              index: homeBottomNavigationController.currentIndex.value,
              backgroundColor: Colors.green,
              height: 50,
              animationDuration: const Duration(milliseconds: 300),
              onTap: (index) {
                homeBottomNavigationController.changeIndex(index);
              },
              items: const [
                Icon(Icons.home_outlined, color: Colors.grey),
                Icon(Icons.search_rounded, color: Colors.grey),
                Icon(Icons.bookmark, color: Colors.grey),
                Icon(Icons.person, color: Colors.grey),
              ],
            )),
      ),
    );
  }
}
