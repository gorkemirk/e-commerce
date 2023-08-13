import 'package:ecommerce/core/widgets/card/category_card.dart';
import 'package:ecommerce/feature/profile/profile.dart';
import 'package:ecommerce/feature/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShopPage extends ConsumerStatefulWidget {
  const ShopPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShopPageState();
}

ProductRepository productRepository = ProductRepository();

class _ShopPageState extends ConsumerState<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: productRepository.getAllCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!.length != 0
                  ? ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ),
                          child: CategoryCardWidget(
                              categoryName: snapshot.data![index]),
                        );
                      },
                    )
                  : const Center(child: Text("No data"));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
