import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:net_demo/services/net_service.dart';
import '../model/net_model.dart';
class HomePage extends StatefulWidget {
  static final String id="home_page";

   @override
   _HomePageState createState() => _HomePageState();
 }

 class _HomePageState extends State<HomePage> {
   String data="";

   @override
   void initState() {
     // TODO: implement initState
     super.initState();
     var post= Post(id: '2',title: "pdp",body: "online",userID: "1");
     _apiPostDelete(post);
   }

  void _apiPostlist(Post post){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      showResponse(response!),
    });
  }
   void _apiPostlist1(Post post){
     Network.GET(Network.API_LIST1+post.id.toString(), Network.paramsEmpty()).then((response) => {
       showResponse(response!),
     });
   }
  void _apiCreatePost(Post post){
     Network.POST(Network.API_CREATE, Network.paramsCreat(post)).then((response) => {
       print(response),
       showResponse(response!),
     });
   }
   void _apiPostDelete(Post post){
     Network.DEL(Network.API_DELETE+post.id.toString(), Network.paramsEmpty()).then((response) => {
       print(response),
       showResponse(response!),
     });
   }

   void _apiUpgrate(Post post){
     Network.PUT(Network.API_UPDATE+post.id.toString(), Network.paramsUpdate(post)).then((response) => {
       showResponse(response!),
     });
   }


  void showResponse(String response){
    setState(() {
      data=response ;
    });
  }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Center(
         child: Text(data != null ? data :"no pro"),
       ),
     );
   }
 }
