import 'package:applichsu/screens/screen_details/screen_detail_details/screen_detail_detail_details/thoiduong_page.dart';
import 'package:applichsu/screens/screen_details/screen_detail_details/screen_detail_detail_details/thoituy_page.dart';
import 'package:flutter/material.dart';
import 'package:applichsu/home_page.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bacthuoc3_data.dart';
import 'package:applichsu/widgets/bacthuoc3.dart';
import 'package:applichsu/screens/screen_details/anecdote_details2.dart';
import 'package:applichsu/screens/screen_details/museum_details6.dart';
import 'package:applichsu/screens/screen_details/event_details1.dart';
import 'package:applichsu/data/search_data.dart';
import 'package:applichsu/data/search_datas.dart';
import 'package:applichsu/screens/search_page.dart';

class BacThuoc3Page extends StatefulWidget {
  const BacThuoc3Page({super.key});
  @override
  _BacThuoc3PageState createState() => _BacThuoc3PageState();
}
class _BacThuoc3PageState extends State<BacThuoc3Page>{
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

  void onSelectBacThuoc3Model(int index){
    if(index == 27){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ThoiTuyPage()),
      );
    }
    else{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ThoiDuongPage()),
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
          title: const Text(
            'Bắc thuộc 3',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: 
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                const SizedBox(height: 12),
                const Image(image: AssetImage('assets/images/period_details2_5.png')),
                const SizedBox(height: 9,),
                const Text(
                  "602 - 905",
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8,),
                const Divider(
                  color: Colors.grey,
                  thickness: 2,
                  height: 16,
                  indent: 5,
                  endIndent: 5,
                ),
                const SizedBox(height: 8),
                const Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Bắc thuộc lần thứ ba (ngắn gọn: Bắc thuộc lần 3) trong lịch sử Việt Nam kéo dài từ năm 602 đến năm 905 hoặc năm 939. Thời kỳ này bắt đầu khi Tùy Văn Đế sai Lưu Phương đánh chiếm nước Vạn Xuân, bức hàng Hậu Lý Nam Đế, kéo dài cho đến khi Khúc Thừa Dụ tiến vào Đại La, giành quyền cai quản toàn bộ Tĩnh Hải quân năm 905 - thời Đường Ai Đế, ông vua bù nhìn trong tay quyền thần Chu Ôn.',
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
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
                        for(final bacthuoc3Model in bacthuoc3Data)
                          BacThuoc3Widget(
                            bacthuoc3Model: bacthuoc3Model,
                            onSelectBacThuoc3Model: onSelectBacThuoc3Model,
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
