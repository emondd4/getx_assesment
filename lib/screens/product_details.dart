import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/details_controller.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  DetailsController controller = Get.put(DetailsController());


  @override
  Widget build(BuildContext context) {
    final product = controller.product;

    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 22.0,color: Colors.white),),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Carousel
            CarouselSlider(
              options: CarouselOptions(
                height: 250.0,
                enlargeCenterPage: true,
                autoPlay: true,
              ),
              items: product.images?.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(imageUrl, fit: BoxFit.cover, width: double.infinity),
                    );
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // Product Info
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title.toString(), style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                  Text("Brand: ${product.brand}",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.normal))),
                  SizedBox(height: 8),
                  Text("Price: \$${product.price}", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,color: Colors.green))),
                  Text("Discount: ${product.discountPercentage}%",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.normal))),
                  SizedBox(height: 8),
                  Text("Rating: ⭐ ${product.rating}",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.normal))),
                  Text("Stock: ${product.stock} (${product.availabilityStatus})",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.normal))),
                  SizedBox(height: 8),
                  Text("Category: ${product.category}",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.normal))),
                  SizedBox(height: 16),
                  Text(product.description.toString(),style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.normal))),
                  SizedBox(height: 16),
                  Divider(),
                  Text("Shipping: ${product.shippingInformation}",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.normal))),
                  Text("Warranty: ${product.warrantyInformation}",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.normal))),
                  Text("Return Policy: ${product.returnPolicy}",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.normal))),
                  SizedBox(height: 16),
                  Divider(),
                  Text("Minimum Order: ${product.minimumOrderQuantity} pcs",style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.normal))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
