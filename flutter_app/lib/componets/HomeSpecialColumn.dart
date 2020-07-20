
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

//专栏
class HomeSpecialColumn extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeSpecialColumnState();
  }

}

class HomeSpecialColumnState extends State<HomeSpecialColumn>{

  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController
        .network("https://a1.test.eceibs.com.cn/index.php/mobile/file/media?hash=video/column/ceibs/0adaf22d09a94b35aacc806882477dbc.m3u8&sso_token=83da64f920a663fb581842c3c556fd2d&user_id=10547&company_id=145&sys_id=0&client_version=1.8.7",formatHint: VideoFormat.hls)
    ..initialize().then((_) {
      setState(() {
      });
    });

  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget _getHeader(){
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      height: 40,
      child: Text(
        "-专栏测试-",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xff7f8485),
          fontSize: 15,
        ),
      ),
    );
  }

  //底部布局
  Widget _getFooter(){
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      child: Text(
        "查看更多>",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xff005587),
          fontSize: 14,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          _getHeader(),
          SizedBox(
            height: 1,
          ),
          Container(
            height: 200,
            color: Colors.white,
            padding: EdgeInsets.only(left: 15,right: 15,top:10),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: 16/9,
                      child: _controller.value.initialized?VideoPlayer(_controller):Container(),
                    ),
                    Offstage(
                      offstage: _controller.value.isPlaying,
                      child: Image.network("https://img.test.eceibs.net/image/ceibs/178c1f717944409e9bbd25117b58abb9.jpg?x-oss-process=image/resize,w_690,h_388,m_fill,limit_0/quality,q_50"),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                      child:Image.asset(
                        _controller.value.isPlaying?"assets/images/icon_player_pause.png":"assets/images/icon_player_start.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          _getFooter(),
        ],
      ),
    );
  }

}