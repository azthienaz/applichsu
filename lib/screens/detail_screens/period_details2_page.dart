import 'package:applichsu/screens/detail_screens/detail_detail_screens/bacthuoc1_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/bacthuoc2_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/bacthuoc3_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/bacthuoc_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/tienly_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/trungnuvuong_page.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:applichsu/home_bottombar.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/screens/detail_screens/anecdote_details2_page.dart';
import 'package:applichsu/screens/detail_screens/museum_details6_page.dart';
import 'package:applichsu/screens/detail_screens/event_details1_page.dart';
import 'package:applichsu/data/period_details2_data.dart';
import 'package:applichsu/widgets/detail_widgets/period_details_widget.dart';
import 'package:applichsu/data/search_data.dart';
import 'package:applichsu/data/search_datas.dart';
import 'package:applichsu/screens/main_screens/search_page.dart';
class PeriodDetails2Page extends StatefulWidget {
  const PeriodDetails2Page({super.key});
  @override
  _PeriodDetails2PageState createState() => _PeriodDetails2PageState();
}
class _PeriodDetails2PageState extends State<PeriodDetails2Page>{
  int _screenIndex = 0;
  bool shorten = true;
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
  void _onItemTapped(int index) {
    setState(() {
      ScreenIndex.screenIndex = index;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  void onSelectPeriodDetails2Model(int index){
    if(index == 3){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BacThuoc1Page()),
      );
    }
    else if(index == 4){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TrungNuVuongPage()),
      );
    }
    else if(index == 5){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BacThuoc2Page()),
      );
    }
    else if(index == 6){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TienLyPage()),
      );
    }
    else{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BacThuoc3Page()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 221, 156, 58), Color.fromARGB(255, 233, 226, 226)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Center(
            child: Text(
              'Thời kỳ lịch sử',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 21,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        body: 
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SearchAnchor(
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
                const SizedBox(height: 8),
                Card(
                  margin: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  clipBehavior: Clip.hardEdge,
                  elevation: 2,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BacThuocPage()),
                      );
                    },
                    child: Stack(
                      children: [
                        FadeInImage(
                          placeholder: MemoryImage(kTransparentImage),
                          image: const AssetImage('assets/images/period2.png'),
                          fit: BoxFit.cover,
                          height: 140,
                          width: double.infinity,
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          right: 10,
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    "111 TCN - 905",
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis, // Very long text ...
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      backgroundColor: Colors.red,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    "Thời kỳ Bắc thuộc",
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis, // Very long text ...
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 90, 89, 86),
                                    ),
                                  ),
                                ),
                              ],
                            )     
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8,),
                Container(
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),),
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Column(
                      children: [
                        Text(
                          'Bắc thuộc chỉ thời kỳ Việt Nam bị đặt dưới quyền cai trị của các triều đại Trung Quốc, nghĩa là thuộc địa của Trung Quốc.',
                          style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w700),
                          softWrap: shorten,
                          overflow: shorten == false ? TextOverflow.ellipsis : null,
                        ),
                        const SizedBox(height: 3),
                        TextButton(
                          child: const Text(
                            'Thu nhỏ',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 221, 156, 58),
                            ),
                          ),
                          onPressed: (){
                            setState(() {
                              shorten = !shorten;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8,),
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
                      for(final periodDetailsModel in periodDetails2Data)
                        PeriodDetailsWidget(
                          periodDetailsModel: periodDetailsModel,
                          onSelectPeriodDetailsModel: onSelectPeriodDetails2Model,
                          
                        ),
                    ],
                  ),
                ),

              ],
            ),
          ),
            
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.public),
                  label: 'Thời kỳ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.description),
                  label: 'Sự kiện',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book),
                  label: 'Giai thoại',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.museum),
                  label: 'Bảo tàng',
                ),
              ],
              currentIndex: _screenIndex,
              unselectedItemColor: Colors.grey,
              unselectedLabelStyle: const TextStyle(
                color: Colors.grey, 
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
              selectedLabelStyle: const TextStyle(
                color: Color.fromARGB(255, 228, 160, 59), 
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
              selectedItemColor: const Color.fromARGB(255, 228, 160, 59),
              onTap: _onItemTapped,
            ),
      ),
    );
  }
}
