import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) => ListItemWidget(index: index),
    );
  }
}

class ListItemWidget extends StatefulWidget {
  final int index;

  const ListItemWidget({Key? key, required this.index}) : super(key: key);

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = _getStoredCount(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Text(count.toString()),
          MaterialButton(
            onPressed: () {
              setState(() {
                count++;
                _storeCount(widget.index, count);
              });
            },
            child: const Text("+"),
          ),
        ],
      ),
    );
  }
}

class CountStorage {
  static final Map<int, int> _countMap = {};

  static int getCount(int index) {
    return _countMap[index] ?? 0;
  }

  static void setCount(int index, int count) {
    _countMap[index] = count;
  }
}

void _storeCount(int index, int count) {
  CountStorage.setCount(index, count);
}

int _getStoredCount(int index) {
  return CountStorage.getCount(index);
}

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       body: ListWidget(),
//     ),
//   ));
// }
