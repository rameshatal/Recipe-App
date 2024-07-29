
import 'package:flutter/material.dart';

import '../../../model_view/api_helper/api_helper.dart';
import 'model_view/model/food_data_model.dart';

class FoodData extends StatefulWidget {
  const FoodData({super.key});

  @override
  State<FoodData> createState() => _FoodDataState();
}

class _FoodDataState extends State<FoodData> {
  List<Recipe> fooData = <Recipe>[];
  //late Future<FoodDataModel> dataModel;
  void getRecipeData() async {
    try {
      ApiHandler apiResponse = await ApiCalling.getApi(uri: 'https://dummyjson.com/recipes');
      if (apiResponse.response != null) {
        setState(() {
          FoodDataModel foodModel = FoodDataModel.fromJson(apiResponse.response);
          fooData = foodModel.recipes ?? [];
        });
      } else {
        showSnackBar(apiResponse.error?.message ?? "");
      }
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  void initState() {
    super.initState();
    getRecipeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: fooData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 150,width: 150,child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.network(fooData[index].image??"")),),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(fooData[index].name??"",style: const TextStyle(fontSize: 14,color: Colors.black),),
                        const SizedBox(height:5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Ingredients : ",style: TextStyle(fontSize: 12,color: Colors.black),),
                            Expanded(
                              child: Wrap(
                                children: List.generate(fooData[index].ingredients?.length??0, (ingredientsIndex) =>   Text("${fooData[index].ingredients?[ingredientsIndex]??""}, ",style: const TextStyle(fontSize: 10,color: Colors.grey),)),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height:5,),
                        const Text("instructions : ",style: TextStyle(fontSize: 12,color: Colors.black),),
                        ...List.generate(fooData[index].instructions?.length??0, (instructionsIndex) =>   Text(fooData[index].instructions?[instructionsIndex]??"",style: const TextStyle(fontSize: 10,color: Colors.grey),))
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
     
  }
}



