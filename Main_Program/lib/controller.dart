import 'package:flutter/cupertino.dart';

import 'api.dart';
import 'package:intl/intl.dart';
import 'data_holders.dart';

class Controller {
  Controller() {}

  static Future<int> getUserType(Map<String, dynamic> formData) async {
    String username = formData["username"];
    String password = formData["password"];
    List<dynamic> to_send = [username, password];

    String query =
        "select type_ from museum.user_ where username_ = '$username' and password_ = '$password';";

    dynamic userType = await DBManager.executeScaler(query);

    if (userType == null) {
      //don't exist
      return -1;
    }
    return userType;
  }

  static Future<int> getMembersCount() async {
    String query = "SELECT count(id) FROM museum.member;";

    dynamic count = await DBManager.executeScaler(query);

    if (count == null) {
      //don't exist
      return -1;
    }
    return count;
  }
  static Future<int> getToursCount() async {
    String query = "SELECT count(ID) FROM museum.tour;";

    dynamic count = await DBManager.executeScaler(query);

    if (count == null) {
      //don't exist
      return -1;
    }
    return count;
  }
  static Future<int> getEventsCount() async {
    String query = "SELECT count(ID) FROM museum.event;";

    dynamic count = await DBManager.executeScaler(query);

    if (count == null) {
      //don't exist
      return -1;
    }
    return count;
  }
  static Future<int> getEmployeesCount() async {
    String query = "SELECT count(ID) FROM museum.staff;";

    dynamic count = await DBManager.executeScaler(query);

    if (count == null) {
      //don't exist
      return -1;
    }
    return count;
  }
  //
  static Future<int> addNewEmployee(Map<String,dynamic> formData)async{
  print(formData);
    String Fname = formData["Fname"];
    String Mname = formData["Mname"];
    String Lname = formData["Lname"];
    String gender = formData["gender"][0];
    String job_title = formData["job_title"];
    String B_date = formData["B_date"];
    String salary = formData["salary"];
    int c = int.parse(salary);
    print('aaaaaaaaaaaaaaaaaaa');

    String start_date = formData["start_date"];
    print('aaaaaaaaaaaaaaaaaaa');
  print (formData["super_ID"].runtimeType);
    var d= formData["super_ID"];

    print('aaaaaaaaaaaaaaaaaaa');
    //int d = int.parse(super_ID);
  print (formData["department_num"].runtimeType);
    var e = formData["department_num"];
  print('aaaaaaaaaaaaaaaaaaa');
    String staff_username = formData["staff_username"];
    String password = formData["password"];
   var f = formData["type"];


    int id = await Controller.getEmployeesCount()+1;

    // members have type int 1
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String regDate = formatter.format(now);

    List<dynamic> toSend = [staff_username, password, f, regDate];
    //first you add the user
    dynamic res =
    await DBManager.executeNonQueryProc('insert_new_user', toSend);

    if (res == 0) {
      //don't exist
      return -1;
    }
    DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(start_date);
    DateTime tempDate2 = new DateFormat("yyyy-MM-dd").parse(B_date);
    print(id.runtimeType);
    List<dynamic> EmployeeToSend=[id,Fname,Mname,Lname,gender,job_title,tempDate2,c,tempDate,d,e,staff_username];
    print (EmployeeToSend);
    dynamic result= await DBManager.executeNonQueryProc('insert_new_employee',EmployeeToSend);

    if(result==0){
      return-1;
    }
    return 1;
    }
  //
  static Future<int> addNewMember(Map<String, dynamic> formData) async {
    String username = formData["username"];
    String password = formData["Password"];
    String secondName = formData["SecondName"];
    String firstName = formData["FirstName"];
    String lastName = formData["LastName"];
    String phoneNumber = formData["PhoneNumber"];
    String gender = formData["Gender"];
    String birthday = formData["birthday"];

    int id = await getMembersCount();

    // members have type int 1
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String regDate = formatter.format(now);

    List<dynamic> toSend = [username, password, 1, regDate];
    //first you add the user
    dynamic res =
        await DBManager.executeNonQueryProc('insert_new_user', toSend);

    if (res == 0) {
      //don't exist
      return -1;
    }
    // if inserted correctly then add the member

    List<dynamic> toSend2 = [
      firstName,
      secondName,
      lastName,
      gender,
      id,
      birthday,
      username,
      phoneNumber
    ];
    dynamic res2 =
        await DBManager.executeNonQueryProc('insert_new_member', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    return 1; // returned successfully
  }
  static Future<int> addNewEvent(Map<String, dynamic> formData) async {
    String Date_Start = formData["Date_Start"];
    DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(Date_Start);
    String Date_End = formData["Date_End"];
    DateTime tempDate1 = new DateFormat("yyyy-MM-dd").parse(Date_End);
    String description = formData["description"];
    String theme = formData["theme"];
    String title = formData["title"];
    int sec_number = formData["sec_number"];
    int staff_id = formData["staff_id"];

    int ID = await getEventsCount();

    List<dynamic> toSend2 = [
      ID,
      tempDate,
      tempDate1,
      description,
      theme,
      title,
      sec_number,
      staff_id
    ];
    dynamic res2 =
    await DBManager.executeNonQueryProc('insert_new_event', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    return 1; // returned successfully
  }
  static Future<int> addNewTour(Map<String, dynamic> formData) async {
    String place = formData["place"];
    String description = formData["description"];
    String topic = formData["topic"];
    String Date_Start = formData["Date_Start"];
    DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(Date_Start);
    String Date_End = formData["Date_End"];
    DateTime tempDate1 = new DateFormat("yyyy-MM-dd").parse(Date_End);
    String organizer_id = formData["organizer_id"];
    String title = formData["title"];

    int ID = await getToursCount();

    List<dynamic> toSend2 = [
      ID,
      place,
      description,
      topic,
      tempDate,
      tempDate1,
      organizer_id,
      title
    ];
    dynamic res2 =
    await DBManager.executeNonQueryProc('insert_new_tour', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    return 1; // returned successfully
  }
  static Future<int> UpdateSalary(Map<String, dynamic> formData)async{
    int ID = formData["ID"];
    int promotion = formData["Promotion"];
    String query=
        "select salary from museum.staff where ID = '$ID';";
    int salary = await DBManager.executeScaler(query);
    if (salary==null) {

      return -1;
    }
    List<int> toSend = [ID,promotion+salary];
    dynamic res =
    await DBManager.executeNonQueryProc('update_employee_salary', toSend);
        if(res==0){
                return -1;
                  }
        return 1;

  }
  static Future<int> UpdateArticleToP(Map<String, dynamic> formData)async{
    int ID = formData["ID"];
       print (ID);
    List<int> toSend = [ID];
    dynamic res =
    await DBManager.executeNonQueryProc('update_article_toP', toSend);
    print(res);
    if(res==0){
      return -1;
    }
    return 1;

  }
  static Future<dynamic> getMembersData(String username) async {
    String query =
        "SELECT * FROM museum.member where mem_username = '$username';";

    List<dynamic> data = await DBManager.executeReader(query); // list of rows
    //print(data);
    if (data.isEmpty) {
      //don't exist
      return null;
    }
    List<dynamic> mem_data = data[0];
    Member mem = Member(
        mem_data[0],
        mem_data[1],
        mem_data[2],
        mem_data[3],
        mem_data[4],
        mem_data[5],
        mem_data[6],
        mem_data[7]); //just need the first row as its the only one exists
    print(mem.Fname);
    return mem; //
  }

  static Future<dynamic> getAllEmployeesIDs() async
  {
    String query=
        "select ID from museum.staff;";
    List<dynamic> IDS= await DBManager.executeReader(query);
  if (IDS.isEmpty) {
    return null;
  } //
  return IDS;
}
  static Future<dynamic> getAllDepNumbers()async{
    String query=
        "select Dno from museum.department;";
    List<dynamic> nums= await DBManager.executeReader(query);
    if (nums.isEmpty) {

      return null;
    }
    return nums;
  }

  static Future<dynamic> getSouvenirSale()async{
    String query=
        "select So_ID,count(quantity) from museum.buy_member_souvenir group by So_ID ;";
   var us= await DBManager.executeReader(query);
    if (us==null) {

      return null;
    }
    return us;
  }
  static Future<dynamic> getSouvenirSale_visitor()async{
    String query=
        "select S_ID,count(quantity) from museum.buys_visitor_souvenir group by S_ID;";
    var us= await DBManager.executeReader(query);
    if (us==null) {

      return null;
    }
    return us;
  }
  static Future<dynamic> getSecNumber()async{
    String query=
        "select number from section;";
    List<int> us= await DBManager.executeReader(query);
    if (us.isEmpty) {

      return null;
    }
    return us;
  }
  static Future<dynamic> getReviewedArticles()async{
    String query=
        "select ID,state_,content,likes,views_,header from article,reviews where result='F';";
    List<dynamic> us= await DBManager.executeReader(query);
    if (us.isEmpty) {

      return null;
    }
    return us;
  }

}
