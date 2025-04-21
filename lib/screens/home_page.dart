import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_assesment/controller/home_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Getx Assessment",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 22.0,color: Colors.white),),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search products...'
                    ),
                    controller: controller.searchController,
                    onChanged: (value){
                      controller.getQueryProductList(value);
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    controller.showFilterBottomSheet(context);
                  }, // optional popup
                )
              ],
            ),
          ),

          Expanded(
            child: Obx(() => controller.productList.value.products?.isNotEmpty == true
                ? GridView.builder(
              itemCount: controller.productList.value.products?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (_, index) => listItem(index)
            )
                : Center(child: Lottie.asset("assets/json/empty.json"),)),
          )
        ],
      ),
    );
  }

  Widget listItem(int index){
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10)),
              child: Image.network(
                controller.productList.value.products![index].thumbnail.toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              controller.productList.value.products![index].title.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text("\$${controller.productList.value.products?[index].price}",
                style: TextStyle(
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

}
