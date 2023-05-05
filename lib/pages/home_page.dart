import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_provider/models/post_model.dart';
import 'package:pattern_provider/services/http_service.dart';
import 'package:pattern_provider/viewmodel/home_view_model.dart';
import 'package:pattern_provider/viewmodel/items_of_post.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  HomeViewModel viewmodel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    viewmodel.apiPostList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => viewmodel,
        child: Consumer<HomeViewModel>(
          builder: (ctx, model, index) =>Stack(
            children: [
              ListView.builder(
                itemCount: viewmodel.items.length,
                itemBuilder: (ctx, index) {
                  Post post = viewmodel.items[index];
                  return itemsOfPost(viewmodel,post);
                },
              ),
              viewmodel.isLoading? Center(
                child: CircularProgressIndicator(),
              ): SizedBox.shrink(),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }
}









