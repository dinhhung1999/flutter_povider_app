import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_app_provider/pages/home/animations_demo.dart';
import 'package:flutter_app_provider/widgets/design_system/form/app_text_form_field.dart';

class HomePage extends StatefulWidget {
  static const ROUTENAME = 'HomePage';
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final ScrollController autoScrollController = ScrollController();
  final TextEditingController _textEditingController = TextEditingController();
  static const TAG = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  CustomScrollView(
        controller: autoScrollController,
        // headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
        //   return <Widget>[
        //
        //   ];
        // },
        // body: const Center(
        //   child: Text("Sample Text"),
        // ),
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: true,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: const Text("Collapsing Toolbar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: Image.network(
                  "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                  fit: BoxFit.cover,
                )),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: TextFormField(
                controller: _textEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Nhập index',

                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      autoScrollController.animateTo(double.tryParse(_textEditingController.text)! * 116.toDouble(),
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.linear);
                    },
                  )
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 10,),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context,AnimationsDemo.ROUTENAME);
                      },
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black,width: 1)
                        ),
                        margin: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(index.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),),
                        ),
                      ),
                    );
                  },
                childCount: 1000,
                addAutomaticKeepAlives: true,
                addRepaintBoundaries: true,
                addSemanticIndexes: true,
              ))
        ],
      )
      // body:  NestedScrollView(
      //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
      //     return <Widget>[
      //
      //     ];
      //   },
      //   body: const Center(
      //     child: Text("Sample Text"),
      //   ),
      // )
    );
  }
}