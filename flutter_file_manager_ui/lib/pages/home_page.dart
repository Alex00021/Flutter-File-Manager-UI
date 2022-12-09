import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter_file_manager_ui/data/category_json.dart';
import 'package:flutter_file_manager_ui/data/recent_files_json.dart';
import 'package:flutter_file_manager_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          getStorageBox(),
          const SizedBox(height: 30,),
          getRecentFiles(),
          const SizedBox(height: 30,),
          getCategoryFiles()
        ],
      ),
    ));
  }
  Widget getStorageBox(){
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(22)
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -40,
            right: -30,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: white.withOpacity(0.2),
                shape: BoxShape.circle
              ),
            ),
          ),
          Positioned(
            bottom: -10,
            left: -50,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: white.withOpacity(0.2),
                shape: BoxShape.circle
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 120,
            child: Padding(
              padding: const EdgeInsets.only(right: 20,left: 20),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child: CircleProgressBar(
                      foregroundColor: white,
                      backgroundColor: white.withOpacity(0.2),
                      value: 0.80,
                      child: const Center(
                        child: AnimatedCount(
                          style: TextStyle(
                            color: white
                          ),
                          count: 0.80, unit: "%", duration: Duration(milliseconds: 500)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("已用16 GB，共20 GB",style: TextStyle(
                          fontSize:16,
                          color: white
                        ),),
                        const SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                            color: white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: const Padding(padding: EdgeInsets.only(left: 12,right: 12,top: 10,bottom: 10),
                          child: Text("购买存储空间",style: TextStyle(
                            fontSize: 16,
                            color: white
                          ),),
                          ),
                          
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getRecentFiles(){
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 2,right: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("最近使用",style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),),
          const SizedBox(height: 20,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(recentFilesJson.length, (index) {
                var fileType = "assets/icons/image.svg";
                if(recentFilesJson[index]['type'] == 'image'){
                  fileType = "assets/icons/image.svg";
                } else if(recentFilesJson[index]['type'] == 'video'){
                  fileType = "assets/icons/video.svg";
                }
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    width: size.width*0.6,
                    height: 160,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(22),
                      image: DecorationImage(image: NetworkImage(recentFilesJson[index]['img']),fit: BoxFit.cover)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                          BlurryContainer(
                            blur: 5,
                            padding: EdgeInsets.zero,
                            borderRadius: const BorderRadius.only(
                              bottomLeft:Radius.circular(22),
                              bottomRight:Radius.circular(22),
                            ),
                            child: Container(
                              width: size.width*0.6,
                              height: 50,
                              decoration: BoxDecoration(
                                color: white.withOpacity(0.5)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(fileType,color: white,width: 15,),
                                        const SizedBox(width: 10,),
                                        Text(recentFilesJson[index]['file_name'],style: TextStyle(
                                          color: white.withOpacity(0.8)
                                        ),)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  Widget getCategoryFiles(){
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 2,right: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("分类",style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),),
          const SizedBox(height: 20,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categoryJson.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    height: 150,
                    width: 140,
                    decoration: BoxDecoration(
                      color: secondary.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(22)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(categoryJson[index]['img'],width: 40,),
                        const SizedBox(height: 10,),
                        Text(categoryJson[index]['text'],style: const TextStyle(
                          fontSize:15,
                          fontWeight: FontWeight.w500
                        ),),
                        const SizedBox(height: 10,),
                         Text(categoryJson[index]['file_count'],style: TextStyle(
                          fontSize:14,
                          fontWeight: FontWeight.w500,
                          color: secondary.withOpacity(0.5)
                        ),),
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
