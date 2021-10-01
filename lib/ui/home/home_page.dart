import 'package:flutter/material.dart';

import '../../../model/yu_gi_oh.dart';
import '../../../network/api_client.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _count = 50;
  final List<Datum> _listData = <Datum>[];
  final ScrollController _controller = ScrollController();
  int _offset = 0;
  YuGiOh? _yuGiOh;

  @override
  void initState() {
    super.initState();
    _requestNewData();
    _controller.addListener(() {
      double _pixels = _controller.position.pixels;
      double _maxScroll = _controller.position.maxScrollExtent;
      if (_pixels == _maxScroll) _requestNewData();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Show $_offset of ${_yuGiOh?.meta?.totalRows ?? '0'}',
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _listData.clear();
                _offset = 0;
              });
              _requestNewData();
            },
          ),
        ],
      ),
      body: ListView.builder(
        controller: _controller,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(2.0),
        itemBuilder: (BuildContext context, int index) {
          if (index == _listData.length) {
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: const CircularProgressIndicator(),
            );
          } else {
            return Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: ListTile(
                title: Text(
                  _listData[index].name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text('${index + 1}'),
              ),
            );
          }
        },
        itemCount: _listData.length + 1,
      ),
    );
  }

  Future<void> _requestNewData() async {
    _yuGiOh = await ApiClient.getCardInfo(
      count: _count,
      offset: _offset,
    );
    if (_yuGiOh != null) {
      _offset = _yuGiOh!.meta?.nextPageOffset ?? _offset;
      _listData.addAll(_yuGiOh!.data);
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Oops! Something went wrong...'),
        ),
      );
    }
  }
}
