import 'package:flutter/material.dart';
import 'package:food_recipe/controllers/second_screen_controller.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SecondScreenController secondScreenController =
        Get.put(SecondScreenController());

    return SafeArea(
      child: Scaffold(
        body: Obx(() => secondScreenController.fooData.value.id != null
            ? ListView(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        child: Container(
                          height: 350,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  secondScreenController.fooData.value.image ??
                                      ""),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 15,
                        right: 15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: InkWell(
                                  onTap: () => Get.back(),
                                  child: const Icon(Icons.arrow_back)),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.bookmark),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: -10,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            secondScreenController.fooData.value.name ?? "",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            Text(
                              "${secondScreenController.fooData.value.rating ?? " "}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "By Rachel William",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15, top: 20),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.access_time, size: 15),
                            SizedBox(width: 4),
                            Text(
                              "10 mains",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            Icon(Icons.signal_cellular_alt, size: 15),
                            SizedBox(width: 4), // Space between icon and text
                            Text(
                              "Medium",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            Icon(Icons.crisis_alert_outlined, size: 15),
                            SizedBox(width: 4), // Space between icon and text
                            Text(
                              "512 Cal",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Chocolate Chip Cookie Bars Just like your favorite chocolate chip cookie recipe, these bars get loads of flavor from brown sugar, vanilla, and, of course, a whole bag of chocolate chips. A sprinkle of flaky sea salt over the top gives every bite that amazing contrast between salty and sweet. The flaky salt is optional, but if you’ve never tried this trick, trust us on this one—it’s going to blow your mind!",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ...List.generate(
                      10,
                          (index) => Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: NetworkImage(
                                    'https://lh3.googleusercontent.com/blogger_img_proxy/AEn0k_tgXRMHWfcaOeCmMFH8PQNYF9HOykARPyUgRuzXngxZb0G-vjDxfkU9DcOMpfV1rycrPpaoGnpvJJK7BUISC0fC6Q1JjxZ1HMKs6Zk5_JFfco8oN9RbyeMXiG7ldlCn1v_q=s0-d',
                                  ),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Row(
                            children: [
                              Text("Kitchen King Masala"),
                              SizedBox(
                                width: 80,
                              ),
                              Text("160 g"),
                            ],
                          ),
                        ],
                      ))
                ],
              )
            : const Center(
                child: SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      color: Colors.green,
                      strokeWidth: 3,
                    )),
              )),
      ),
    );
  }
}
