import 'package:flutter/material.dart';
import 'package:internshipproject11/models/trendingg.dart';
class trending extends StatefulWidget {
  const trending({super.key});

  @override
  State<trending> createState() => _trendingState();
}

class _trendingState extends State<trending> {
  Widget build(BuildContext context) {
    final List<TrendinggModel> trending=[
      TrendinggModel(title: 'How to start a tractor',
          subtitle: "upload date", uploadtime: "15min ago",
          menuoptions: ['share'], views: "320",
          imagePath: "assets/images/trending1.jpg",
          viewsiamge: "assets/images/views.jpg",
          commentimage: "assets/images/comment.jpg", comments: "22comments"),
      TrendinggModel(title: 'How to buy a crane',
          subtitle: "upload date", uploadtime: "21-oct-2021 monday",
          menuoptions: ['share'], views: "320",
          imagePath: "assets/images/trending1.jpg",
          viewsiamge: "assets/images/views.jpg",
          commentimage: "assets/images/comment.jpg", comments: "22comments")
    ];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Training Videos",style:
          TextStyle(fontSize: 23.04,fontWeight: FontWeight.bold),),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.search)),
            IconButton(onPressed: (){}, icon: Icon(Icons.add))
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: TabBar(
                dividerColor: Colors.white,
                indicator: BoxDecoration(
                  color: Color(0xff339D44),
                  borderRadius: BorderRadius.circular(8),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(
                    height: 38,
                    child: Text("All"),
                  ),
                  Tab(
                    height: 38,
                    child: Text("Recently uploded"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
