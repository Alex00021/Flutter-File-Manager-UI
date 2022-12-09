import 'package:flutter/material.dart';
import '../theme/colors.dart';



/// 我的 页面
class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  List<String> itemsList = [
    "会员服务",
    "系统设置",
    "App分享",
    "意见反馈",
    "用户服务协议",
    "隐私政策",
    "退出登录",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              height: 160,
              width: double.infinity,
              decoration:   const BoxDecoration(
                color: primary,
                // image: DecorationImage(
                //     image: AssetImage("assets/images/icon_me_vip_bg.png"), fit: BoxFit.cover),
              ),
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    children: const [
                      SafeArea(
                        child: Icon(Icons.settings, size: 20, color: Colors.white,),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 78,
                        width: 78,
                        margin: const EdgeInsets.only(left: 24),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1.0, color: Colors.black38),
                          boxShadow: const [BoxShadow( offset: Offset(5.0, 1.0),    blurRadius: 10.0, spreadRadius: 1.0) ],
                          // image: const DecorationImage(
                          //   image: AssetImage("assets/images/head_imag.jpg"), fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                      const SizedBox(width: 30,),
                      Container(
                        // margin: const EdgeInsets.only(top: 10),
                        height: 100,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("游客 9547", style:  TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                            SizedBox(height: 12,),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        height: 52,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: secondary.withOpacity(0.05),

                        ),
                        child: Row(
                          children: [
                            Text(itemsList[index]),
                            const Spacer(),
                            const Icon(Icons.arrow_forward_ios_sharp, size: 20,),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index){
                      return Container(
                        height: 8,
                      );
                    },
                    itemCount: itemsList.length),
              )
            ),
          ],
        ),
      ),
    );
  }
}