import 'package:flutter/material.dart';
import 'package:flutter_pagination/model.dart';
import 'package:flutter_pagination/network.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // recent page
  int page = 1;

  // request data per page
  int perPage = 1;

  // model data
  ReqResListUsers _users;

  // list model data
  List<Datum> listDatum = List();

  // ListView scroll controller
  ScrollController controller = ScrollController();

  // loading add data statement
  bool isLoading = false;

  // refresh new data statement
  bool isRefresh = false;

  // request add data
  addData() async {
    // max page they have is 12 if per_page is 1 (12 total data)
    if (page != 12) {
      setState(() {
        // set loading true
        isLoading = true;
      });
      // waiting for get data from internet
      _users = await Network.getCategories(page, perPage);
      setState(() {
        // set loading false
        isLoading = false;
        // add 10 data to make it look more
        for (int i = 0; i < 10; i++) {
          listDatum.addAll(_users.data);
        }
        // set page to next page
        page++;
      });
    }
  }

  // request refresh data
  Future newData() {
    setState(() {
      // set refresh true
      isRefresh = true;
      // set page to first page
      page = 1;
      // clear data
      listDatum.clear();
    });
    // waiting for get data from internet
    return Network.getCategories(page, perPage).then((users) {
      setState(() {
        // set refresh false
        isRefresh = false;
        // add 10 data to make it look more
        for (int i = 0; i < 10; i++) {
          listDatum.addAll(users.data);
        }
      });
    });
  }

  // on initialization state
  @override
  void initState() {
    super.initState();
    // add data
    addData();
    // set ListView controller listener
    controller.addListener(() {
      // if ListView position on max scroll add data
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        addData();
      }
    });
  }

  // on dispose
  @override
  void dispose() {
    super.dispose();
    // dispose controller
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${listDatum.length} datas we have now'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              newData();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        // if is refreshing set child to Container
        child: isRefresh
            ? Container()
            : ListView.builder(
                // add 1 for indicator
                itemCount: listDatum.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == listDatum.length) {
                    // if on last index return indicator
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: Center(
                        // if is loading set child progress indicator
                        child: isLoading
                            ? LinearProgressIndicator()
                            : Icon(Icons.refresh),
                      ),
                    );
                  } else {
                    return ListTile(
                      title: Text(listDatum[index].email),
                    );
                  }
                },
                controller: controller,
              ),
        onRefresh: newData,
      ),
    );
  }
}
