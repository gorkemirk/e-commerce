import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BagPage extends ConsumerStatefulWidget {
  const BagPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BagPageState();
}

class _BagPageState extends ConsumerState<BagPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Bag Page")),
    );
  }
}
