import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/core/widgets/card/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import '../../model/banner.dart';
import '../locator/locator.dart';
import '../repository/repository.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

ProductRepository _productRepository = locator<ProductRepository>();

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          imageSliderHomePage(context),
          context.emptySizedHeightBoxLow,
          listViewHeaderListTile(
            context,
            subtitle: "You've never seen it before!",
            title: "New",
          ),
          context.emptySizedHeightBoxLow,
          productListView(context, category: "new"),
          context.emptySizedHeightBoxLow,
          listViewHeaderListTile(
            context,
            subtitle: "Super summer sale!",
            title: "Sale",
          ),
          context.emptySizedHeightBoxLow,
          productListView(context, category: "sale"),
        ],
      ),
    );
  }

  Widget productListView(BuildContext context, {required String category}) {
    return FutureBuilder(
      future: _productRepository.getProductsByCategory(category: category),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? SizedBox(
                height: context.dynamicHeight(0.32),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      debugPrint(snapshot.data!.length.toString());
                      debugPrint(snapshot.data![index].image);
                      return Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: ProductCardWidget(
                          rating: snapshot.data![index].rating,
                          imageUrl: snapshot.data![index].image,
                          productName: snapshot.data![index].name,
                          productPrice: snapshot.data![index].price,
                          category: snapshot.data![index].bundle,
                        ),
                      );
                    },
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  ListTile listViewHeaderListTile(BuildContext context,
      {required String title, required String subtitle}) {
    return ListTile(
      title: Text(
        title,
        style: context.textTheme.headline4
            ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      trailing: const Text("View all"),
    );
  }

  CarouselSlider imageSliderHomePage(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: context.dynamicHeight(0.7),
          viewportFraction: 1,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5)),
      items: BannerModel.homePageSliderItems.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
                SizedBox(
                    width: context.width,
                    child: Image.asset(
                      i.imageUrl,
                      fit: BoxFit.fill,
                    )),
                Positioned(
                    left: context.dynamicWidth(0.04),
                    bottom: context.dynamicHeight(0.06),
                    child: Text(
                      i.title,
                      style: context.textTheme.headline2?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
