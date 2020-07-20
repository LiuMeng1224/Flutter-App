import 'package:ECEIBS/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

//登录页面
class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  TextEditingController _domainController;
  TextEditingController _usernameController;
  TextEditingController _passwordController;
  bool isHideDomain = true;
  bool isHideUsername = true;
  bool isHidePassword = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values); //显示状态栏、底部按钮栏
    _domainController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/login_bg.webp"),
              fit: BoxFit.cover
            )
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30,right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 120,
                    ),
                    SizedBox(
                      width: 100,
                      height: 26,
                      child: Image.asset("assets/images/app_logo.webp"),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/domain_name.webp",
                          width: 16,
                          height: 16,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 20),
                          child: SizedBox(
                            width: 1,
                            height: 20,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Color(0xff005587)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.name,
                            maxLines: 1,
                            textAlignVertical: TextAlignVertical.center,
                            controller: _domainController,
                            style: TextStyle(color: Color(0xff252631), fontSize: 12),
                            onChanged: (text){
                              setState(() {
                                isHideDomain = text.isEmpty;
                              });
                            },
                            decoration: InputDecoration(
                                hintText: "学习平台或者企业ID号",
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                ),
                                focusedBorder: UnderlineInputBorder( //当[InputDecorator]具有焦点且未显示错误的显示的边框
                                  borderSide: BorderSide(
                                      color: Color(0xff005587),
                                      width: 0.8,
                                      style: BorderStyle.solid),
                                ),
                                enabledBorder: UnderlineInputBorder( //当[InputDecorator]启用且未显示错误时显示的边框
                                  borderSide: BorderSide(
                                      style: BorderStyle.none
                                  ),
                                ),
                                hintMaxLines: 1,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                suffixIcon: Offstage(
                                  offstage: isHideDomain,
                                  child: IconButton(
                                    iconSize: 18,
                                    icon: Icon(Icons.clear),
                                    onPressed: () {
                                      _domainController.clear();
                                      setState(() {
                                        isHideDomain = true;
                                      });
                                    },
                                  ),
                                ),
                            ),
                          ),
                        ),
                        IconButton(
                          iconSize: 20,
                          icon: Icon(
                            Icons.help,
                            color: Color(0xff999999),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/icon_username.webp",
                          width: 16,
                          height: 18,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 20),
                          child: SizedBox(
                            width: 1,
                            height: 20,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Color(0xff005587)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            textAlignVertical: TextAlignVertical.center,
                            controller: _usernameController,
                            style:
                            TextStyle(color: Color(0xff252631), fontSize: 12),
                            onChanged: (text){
                              setState(() {
                                isHideUsername = text.isEmpty;
                              });
                            },
                            decoration: InputDecoration(
                                hintText: "用户名",
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff005587),
                                      width: 0.8,
                                      style: BorderStyle.solid),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      style: BorderStyle.none
                                  ),
                                ),
                                hintMaxLines: 1,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                suffixIcon: Offstage(
                                  offstage: isHideUsername,
                                  child: IconButton(
                                    iconSize: 18,
                                    icon: Icon(Icons.clear),
                                    onPressed: () {
                                      _usernameController.clear();
                                      setState(() {
                                        isHideUsername = true;
                                      });
                                    },
                                  ),
                                ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/icon_password.webp",
                          width: 16,
                          height: 17,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 20),
                          child: SizedBox(
                            width: 1,
                            height: 20,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Color(0xff005587)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.visiblePassword,
                            maxLines: 1,
                            textAlignVertical: TextAlignVertical.center,
                            controller: _passwordController,
                            style:
                            TextStyle(color: Color(0xff252631), fontSize: 12),
                            obscureText: true,
                            onChanged: (text){
                              setState(() {
                                isHidePassword = text.isEmpty;
                              });
                            },
                            decoration: InputDecoration(
                                hintText: "密码",
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                ),
                                hintMaxLines: 1,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff005587),
                                      width: 0.8,
                                      style: BorderStyle.solid),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      style: BorderStyle.none
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                suffixIcon: Offstage(
                                  offstage: isHidePassword,
                                  child: IconButton(
                                  iconSize: 18,
                                  icon: Icon(Icons.clear),
                                  onPressed: () {
                                    _passwordController.clear();
                                    setState(() {
                                      isHidePassword = true;
                                    });
                                  },
                                ),
                                ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: null,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              "忘记密码?",
                              style:
                              TextStyle(color: Color(0xffcccccc), fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 56,
                    ),
                    MaterialButton(
                      color: Color(0xff005587),
                      minWidth: 300,
                      height: 36,
                      child: Text(
                        "登录",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xffffffff), fontSize: 15),
                      ),
                      onPressed: () {

                        Future<SharedPreferences> _preference = SharedPreferences.getInstance();
                        _preference.then((preference) => {
                          preference.setString("token", "123456")
                        });
                        Navigator.pushAndRemoveUntil(context, new MaterialPageRoute(builder: (context) => MainPage()), (_)=>false);
//                        Navigator.push<Object>(context, MaterialPageRoute(builder: (context) => MainPage()));
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {},
                            child: Text(
                              "注册体验",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Color(0xff252631),
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                              ),
                            )
                        ),
                        Text(
                          "当前版本：1.0.0",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Color(0xff005587),
                            fontSize: 12,
                          ),
                        ),
                      ],
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
