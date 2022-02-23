class Post{
  String id;
  String title;
  String userID;
  String body;
  Post({required this.body,required this.title,required this.userID,required this.id});

  Post.fromJSon(Map<String,dynamic>json)
      :
        id=json['id'],
        body=json['body'],
        title=json['title'],
        userID=json["userID"];
Map<String,dynamic> toJson()=>{
  'id':id,
  'body':body,
  "title":title,
  "userID":userID,
};
}