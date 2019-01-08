///User model to manage jsonplaceholder posts API data.
class Post {
  int id, userId;
  String title, body;

  Post(this.id, this.userId, this.title, this.body);

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    body = json['body'];
  }
}
