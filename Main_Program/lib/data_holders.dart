class Member {
  String Fname;
  String Sname;
  String Lname;
  String gender;
  int id;
  String birthday;
  String username;
  String phoneNumber;
  Member(this.Fname, this.Sname, this.Lname, this.gender, this.id,
      this.birthday, this.username, this.phoneNumber) {}
}

class Researcher {
  String fName;
  String mName;
  String lName;
  int id;
  String birthday;
  String username;
  int yearsExpert;
  Researcher(this.id, this.fName, this.mName, this.lName,
      this.birthday, this.yearsExpert, this.username) {}
}
class Article {
  int id;
  String content;
  String state;
  String header;
  late int views;
  late int likes;
  late int reviews;
  Article(this.id, this.state, this.content, this.header, views, likes, reviews)
  {
    if(views) {this.views = views;}
    else {views = 0;}
    if(likes) {this.likes = likes;}
    else {likes = 0;}
    if(reviews) {this.reviews = reviews;}
    else {reviews = 0;}
  }
}