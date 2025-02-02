import 'package:applichsu/screens/detail_screens/museum_details1_page.dart';
import 'package:applichsu/screens/detail_screens/museum_details2_page.dart';
import 'package:applichsu/screens/detail_screens/museum_details3_page.dart';
import 'package:applichsu/screens/detail_screens/museum_details4_page.dart';
import 'package:applichsu/screens/detail_screens/museum_details5_page.dart';
import 'package:flutter/material.dart';
import 'bookmark_page.dart';
import '../../widgets/main_widgets/museum_widget.dart';
import 'package:applichsu/data/museum_data.dart';
import 'package:applichsu/screens/detail_screens/event_details1_page.dart';
import 'package:applichsu/screens/detail_screens/anecdote_details2_page.dart';
import 'package:applichsu/screens/detail_screens/museum_details6_page.dart';
import 'package:applichsu/data/search_data.dart';
import 'package:applichsu/data/search_datas.dart';
import 'package:applichsu/screens/main_screens/search_page.dart';
class MuseumPage extends StatefulWidget {
  const MuseumPage({super.key});
  @override
  _MuseumPageState createState() => _MuseumPageState();
}
class _MuseumPageState extends State<MuseumPage>{

  late SearchController _controller;
  late TextEditingController textController;

  @override
  void initState(){
    _controller = SearchController();
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose(){
    _controller.dispose();
    textController.dispose();
    super.dispose();
    
  }
  void onSelectMuseumModel(int index){
    if(index == 1){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MuseumDetails1Page()),
      );
    }
    else if(index == 2){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MuseumDetails2Page()),
      );
    }
    else if(index == 3){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MuseumDetails3Page()),
      );
    }
    else if(index == 4){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MuseumDetails4Page()),
      );
    }
    else if(index == 5){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MuseumDetails5Page()),
      );
    }
    else{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MuseumDetails6Page()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return
      Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(255, 221, 156, 58), Color.fromARGB(255, 233, 226, 226)])),
        
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
              children: [
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: SearchAnchor(
                        searchController: _controller,
                        headerTextStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                        ),
                        
                        viewLeading: IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: (){
                            _controller.clear();
                            Navigator.of(context).pop();
                          },
                        ),
                        viewTrailing: {
                          IconButton(
                            icon: const Icon(Icons.clear, color: Colors.white),
                            onPressed: (){
                              setState(() {
                                if(_controller.value.text.isNotEmpty){
                                  _controller.clear();
                                }
                                else{
                                  Navigator.of(context).pop();
                                }
                              });
                            },
                          ),
                        },
                        viewBackgroundColor: Colors.black,
                        viewOnSubmitted: (_) {
                          for(final data in searchDatas){
                            if(data.title.contains(_controller.value.text)){
                              searchData.add(data);
                            }
                          } 
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SearchPage()),
                          );
                          
                        },
                        builder: (BuildContext context, _controller)
                        {
                          return SearchBar(
                            hintText: "Tìm kiếm",
                            hintStyle: const WidgetStatePropertyAll(
                              TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w100,
                                fontStyle: FontStyle.normal,
                                fontSize: 15,
                              ),
                            ),
                            backgroundColor: const WidgetStatePropertyAll(Colors.black),
                            padding: const WidgetStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(horizontal: 16.0)
                            ),
                            textStyle: const WidgetStatePropertyAll(
                              TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontSize: 15,
                              ),
                            ),
                           
                            onTap: () {
                              _controller.openView();
                            },
                            onChanged: (_) {
                              _controller.openView();
                            },
                            
                            leading: const Icon(Icons.search, color: Colors.white,),
                       
                          );
                        },
                        suggestionsBuilder:
                        (BuildContext context, _controller) {
                          return List<ListTile>.generate(3, (int index) {
                            final String item;
                            if(index == 1){
                              item = "Cuộc khởi nghĩa của Hai Bà Trưng giành thắng lợi";
                            }
                            else if(index == 2){
                              item = "Đinh Bộ Lĩnh, cậu bé chăn trâu lấy hoa lau làm cờ";
                            }
                            else{
                              item = "Ấn vàng Sắc mệnh chi bảo";
                            }
                            return ListTile(
                              title: Text(item, style: const TextStyle(color: Colors.white)),
                              onTap: () {
                                setState(() {
                                  _controller.clear();
                                  _controller.closeView(item);
                                });
                                if(index == 1){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const EventDetails1Page()),
                                  );
                                }
                                else if(index == 2){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const AnecdoteDetails2Page()),
                                  );
                                }
                                else{
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const MuseumDetails6Page()),
                                  );
                                }
                              },
                            );
                          });
                        }
                      ),
                      
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // Flexible(
                      IconButton(
                        color: Colors.white,
                        iconSize: 50,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const BookmarkPage()),
                          );
                        },
                        icon: const Icon(Icons.bookmark)
                      ),
                    // ),
                  ],
                ),
                
                  Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                      child: GridView(
                        padding: const EdgeInsets.all(20),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.85,
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 30,
                        ),
                        children: [
                          for(final museumModel in museumData)
                            MuseumWidget(
                              museumModel: museumModel,
                              onSelectMuseumModel: onSelectMuseumModel,
                            ),
                        ],
                      ),
                    ),
                
                    ],
                  ),
                ),
              ],
            ),
        
          ),
        ),
        
      );
  }
}