import 'package:flutter/material.dart';

import '../model/yu_gi_oh.dart';
import '../network/api_client.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 10;
  int _offset = 0;
  YuGiOh _yuGiOh;
  List<Datum> _listData = List<Datum>();
  ScrollController _controller = ScrollController();

  void _requestNewData() async {
    setState(() {});
    _yuGiOh = await ApiClient.getCardInfo(
      count: _count,
      offset: _offset,
    );
    _offset = _yuGiOh.meta.nextPageOffset;
    _listData.addAll(_yuGiOh.data);
    setState(() {});
  }

  Widget _homeContent() {
    return ListView.builder(
      controller: _controller,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        if (index == _listData.length) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(),
          );
        } else {
          return Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: ListTile(
              title: Text(_listData[index].name),
            ),
          );
        }
      },
      itemCount: _listData.length + 1,
    );
  }

  @override
  void initState() {
    _requestNewData();
    _controller.addListener(() {
      double _pixels = _controller.position.pixels;
      double _maxScroll = _controller.position.maxScrollExtent;
      if (_pixels == _maxScroll) {
        _requestNewData();
      }
    });
    super.initState();
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
          "Show $_offset Of ${_yuGiOh?.meta?.totalRows ?? "0"}",
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _listData.clear();
              _offset = 0;
              _requestNewData();
            },
          ),
        ],
      ),
      body: _homeContent(),
    );
  }
}
