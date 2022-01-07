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
class Staff{
  int ID;
  String Fname;
  String Mname;
  String Lname;
  String gender;
  String job_title;
  String B_date;
  int salary;
  String start_date;
  int super_ID;
  int department_num;
  String staff_username;
  Staff(this.ID, this.Fname,
  this.Mname,
  this.Lname,
  this.gender,
  this.job_title,
  this.B_date,
  this.salary,
  this.start_date,
  this.super_ID,
  this.department_num,
  this.staff_username){}
}
class article{
  int ID;
  String state_;
  String content;
  int likes;
  int views_;
  String header;
  article(
      this.ID,
      this.state_,
      this.content,
      this.likes,
      this.views_,
      this.header,
      ){}
}