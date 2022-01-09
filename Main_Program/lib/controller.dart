import 'dart:ffi';

import 'package:main_program/Models/event_location.dart';

import 'package:main_program/admin_view/add_new_painting_artifacts.dart';
import 'package:main_program/admin_view/add_new_visitor.dart';

import 'api.dart';
import 'package:intl/intl.dart';
import 'data_holders.dart';

class Controller {
  Controller() {}

  //------------------- my part ---------------------- just for quick access

  static Future<dynamic> select_data() async {
    String result =
        'SELECT a.SO_ID, SUM(a.quantity) FROM ((SELECT SO_ID, quantity FROM buy_member_souvenir) UNION (SELECT S_ID , quantity FROM buys_visitor_souvenir))a GROUP BY a.SO_ID;';
    //String result = "select * from user_";
    return DBManager.executeReader(result);
  }

  static Future<dynamic> show_coming_events() async {
    String result = "select * from events";
    return DBManager.executeReader(result);
  }

  static Future<dynamic> show_coming_tours() async {
    String result = "select * from tour";
    return DBManager.executeReader(result);
  }

  //------------------- my part ---------------------- just for quick access

  static Future<int> getUserType(Map<String, dynamic> formData) async {
    String username = formData["username"];
    String password = formData["password"];

    String query =
        "select type_ from museum.user_ where username_ = '$username' and password_ = '$password';";

    dynamic userType = await DBManager.executeScaler(query);

    if (userType == null) {
      //don't exist
      return -1;
    }
    return userType;
  }

  static Future<int> getUserType_u(String Username) async {
    String query =
        "select type_ from museum.user_ where username_ = '$Username';";

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

  static Future<int> getStaffCount() async {
    String query = "SELECT count(id) FROM museum.staff;";

    dynamic count = await DBManager.executeScaler(query);

    if (count == null) {
      //don't exist
      return -1;
    }
    return count;
  }

  static Future<int> getResearcherCount() async {
    String query = "SELECT count(id) FROM museum.RESEARCHER;";

    dynamic count = await DBManager.executeScaler(query);

    if (count == null) {
      //don't exist
      return -1;
    }
    return count;
  }

  static Future<int> getSectionCount() async {
    String query = "SELECT count(id) FROM museum.section;";

    dynamic count = await DBManager.executeScaler(query);

    if (count == null) {
      //don't exist
      return -1;
    }
    return count;
  }

  static Future<int> getPaintingCount() async {
    String query = "SELECT count(id) FROM museum.painting_artifact;";

    dynamic count = await DBManager.executeScaler(query);

    if (count == null) {
      //don't exist
      return -1;
    }
    return count;
  }

  static Future<int> getDepartmentCount() async {
    String query = "SELECT count(Dno) FROM museum.department;";

    dynamic count = await DBManager.executeScaler(query);

    if (count == null) {
      //don't exist
      return -1;
    }
    return count;
  }

  static Future<int> getVisitorCount() async {
    String query = "SELECT count(id) FROM museum.visitor;";

    dynamic count = await DBManager.executeScaler(query);

    if (count == null) {
      //don't exist
      return -1;
    }
    return count;
  }

  static Future<int> getTourCount() async {
    String query = "SELECT count(id) FROM museum.tour;";

    dynamic count = await DBManager.executeScaler(query);

    if (count == null) {
      //don't exist
      return -1;
    }
    return count;
  }

  static Future<int> addNewUser(Map<String, dynamic> formData) async {
    String username_ = formData["username_"];
    String password_ = formData["password_"];
    int type_ = int.parse(formData['type_']);

    // members have type int 1
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String registerDate = formatter.format(now);

    List<dynamic> toSend = [username_, password_, type_, registerDate];
    //first you add the user
    dynamic res =
        await DBManager.executeNonQueryProc('insert_new_user', toSend);

    if (res == 0) {
      //don't exist
      return -1;
    }
    return 1; // returned successfully
  }

  //ID, ArrivalTime, DepartureTime
  static Future<int> addNewVisitor(Map<String, dynamic> formData) async {
    String ArrivalTime = formData["ArrivalTime"];
    String DepartureTime = formData['DepartureTime'];
    int id = await getVisitorCount();

    List<dynamic> toSend = [id, ArrivalTime, DepartureTime];
    //first you add the user
    dynamic res =
        await DBManager.executeNonQueryProc('insert_new_visitor', toSend);

    if (res == 0) {
      //don't exist
      return -1;
    }
    return 1; // returned successfully
  }

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

//ID, Fname, Mname, Lname, gender, job_title, B_date, salary, start_date, super_ID, department_num, staff_username
  static Future<int> addNewStaff(Map<String, dynamic> formData) async {
    print(formData);
    String username = formData["staff_username"];
    String Mname = formData["Mname"];
    String Fname = formData["Fname"];
    String Lname = formData["Lname"];
    String jobTitle = formData["job_title"];
    String gender = formData["gender"][0];
    String BDate = formData["B_date"];
    String password = formData["password"];
    int type = int.parse(formData["type"]);
    int ID = await getStaffCount();
    int salary = int.parse(formData["salary"]);
    int superID = int.parse(formData["super_ID"]);
    int departmentNum = int.parse(formData["department_num"]);

    // members have type int 1
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String regDate = formatter.format(now);

    List<dynamic> toSend = [username, password, type, regDate];
    //first you add the user
    dynamic res =
        await DBManager.executeNonQueryProc('insert_new_user', toSend);
    if (res == 0) {
      //don't exist
      return -1;
    }

    // if inserted correctly then add the member

    List<dynamic> toSend2 = [
      ID,
      Fname,
      Mname,
      Lname,
      gender,
      jobTitle,
      BDate,
      salary,
      regDate,
      superID,
      departmentNum,
      username
    ];
    dynamic res2 =
        await DBManager.executeNonQueryProc('insert_new_staff', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    return 1; // returned successfully
  }

  //ID, Fname, Mname, Lname, B_date, years_of_experience, R_username
  static Future<int> addNewResearcher(Map<String, dynamic> formData) async {
    String username = formData["R_username"];
    String password = formData["password"];
    String Mname = formData["Mname"];
    String Fname = formData["Fname"];
    String Lname = formData["Lname"];
    String BDate = formData["B_date"];
    int ID = await getResearcherCount();
    int yearsOfExperience = int.parse(formData["years_of_experience"]);

    // members have type int 1
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String regDate = formatter.format(now);

    List<dynamic> toSend = [username, password, 3, regDate];
    //first you add the user
    dynamic res =
        await DBManager.executeNonQueryProc('insert_new_user', toSend);
    if (res == 0) {
      //don't exist
      return -1;
    }

    List<dynamic> toSend2 = [
      ID,
      Fname,
      Mname,
      Lname,
      BDate,
      yearsOfExperience,
      username
    ];
    dynamic res2 =
        await DBManager.executeNonQueryProc('insert_new_researcher', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    return 1; // returned successfully
  }

//ID, Fname, Mname, Lname, B_date, years_of_experience, R_username
  static Future<int> addNewSection(Map<String, dynamic> formData) async {
    //name_, number, floor_, hall
    String name_ = formData["name_"];
    int number = await getSectionCount();
    int floor_ = int.parse(formData["floor_"]);
    String hall = formData["hall"];

    List<dynamic> toSend2 = [name_, number, floor_, hall];
    dynamic res2 =
        await DBManager.executeNonQueryProc('insert_new_section', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    return 1; // returned successfully
  }

  static Future<List<dynamic>> getAllUsernamesWithType(int type) async {
    String query = "SELECT username_ FROM museum.user_ where type_=${type};";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get res usernames from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllResearcherID() async {
    String query = "SELECT ID FROM museum.researcher;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get res IDs from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllArticleID() async {
    String query = "SELECT ID FROM museum.article;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get art IDs from database");
    }
    return ret;
  }

  //Dno, name, manager_ID
  static Future<int> addNewDepartment(Map<String, dynamic> formData) async {
    //name_, number, floor_, hall
    String name = formData["name"];
    int Dno = await getDepartmentCount();
    int managerID = int.parse(formData["manager_ID"]);

    List<dynamic> toSend2 = [Dno, name, managerID];
    dynamic res2 =
        await DBManager.executeNonQueryProc('insert_new_department', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    return 1; // returned successfully
  }

  static Future<List<dynamic>> getDepNums() async {
    String query = "SELECT Dno FROM museum.department;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get Deps nums from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getEmpIDs() async {
    String query = "SELECT id FROM museum.staff;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get IDSSS nums from database");
    }
    return ret;
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

    List<dynamic> memData = data[0];
    print(memData);
    Member mem = Member(memData[0], memData[1], memData[2], memData[3],
        memData[4], memData[5], memData[6], memData[7]
        //mem_data[8]
        ); //just need the first row as its the only one exists
    print(mem.Fname);
    return mem; //
  }

  static Future<dynamic> getAccData(String username) async {
    String query =
        "SELECT * FROM museum.staff where staff_username = '$username';";

    List<dynamic> data = await DBManager.executeReader(query); // list of rows
    //print(data);
    if (data.isEmpty) {
      //don't exist
      return null;
    }

    List<dynamic> memData = data[0];
    print(memData);
    Staff mem = Staff(
        memData[0],
        memData[1],
        memData[2],
        memData[3],
        memData[4],
        memData[5],
        memData[6],
        memData[7],
        memData[8],
        memData[9],
        memData[10],
        memData[11]); //just need the first row as its the only one exists
    print(mem.Fname);
    return mem; //
  }

  static Future<List<dynamic>> getAllArticles() async {
    String query = "SELECT * FROM museum.article;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get articles from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllUsers() async {
    String query = "SELECT * FROM museum.user_;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get Users from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllMembers() async {
    String query = "SELECT * FROM museum.member;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get members from database");
    }
    return ret;
  }

  static Future<int> addNewArticleFeedback(
      Map<String, dynamic> formData) async {
    String comment = formData["comment"];
    double rating = formData["rating"];
    int memberId = formData["member_id"];
    int articleId = formData["article_id"];

    List<dynamic> toSend = [memberId, articleId, rating, comment];

    dynamic res =
        await DBManager.executeNonQueryProc('insert_article_feedback', toSend);

    if (res == 0) {
      //don't exist
      return -1;
    }
    return 1; // returned successfully
  }

  static Future<int> getEventCount() async {
    String query = "SELECT count(id) FROM museum.event;";

    dynamic count = await DBManager.executeScaler(query);

    if (count == null) {
      //don't exist
      return -1;
    }
    return count;
  }

//ID, Date_Start, Date_End, description, theme, title, sec_number, staff_id
  static Future<int> addNewEvent(Map<String, dynamic> formData) async {
    String DateStart = formData["Date_Start"];
    String DateEnd = formData['Date_End'];
    String description = formData['description'];
    String theme = formData['theme'];
    String title = formData['title'];
    int secNumber = int.parse(formData['sec_number']);
    int staffId = int.parse(formData['staff_id']);
    int ID = await getEventCount();

    List<dynamic> toSend = [
      ID,
      DateStart,
      DateEnd,
      description,
      theme,
      title,
      secNumber,
      staffId
    ];
    //first you add the user
    dynamic res =
        await DBManager.executeNonQueryProc('insert_new_event', toSend);

    if (res == 0) {
      //don't exist
      return -1;
    }
    return 1; // returned successfully
  }

  static Future<List<dynamic>> getAllSecNums() async {
    String query = "SELECT number FROM museum.section;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get res usernames from database");
    }
    return ret;
  }

//ID, place, description, topic, Date_Start, Date_End, organizer_id, title
  static Future<int> addNewTour(Map<String, dynamic> formData) async {
    String DateStart = formData["Date_Start"];
    String DateEnd = formData['Date_End'];
    String description = formData['description'];
    String place = formData['place'];
    String topic = formData['topic'];
    String title = formData['title'];
    int organizerId = int.parse(formData['organizer_id']);
    int ID = await getTourCount();

    List<dynamic> toSend = [
      ID,
      place,
      description,
      topic,
      DateStart,
      DateEnd,
      organizerId,
      title
    ];
    //first you add the user
    dynamic res =
        await DBManager.executeNonQueryProc('insert_new_tour', toSend);

    if (res == 0) {
      //don't exist
      return -1;
    }
    print('feedback inserted success');
    return res;
  }

  static Future<List<dynamic>> getAllEvents() async {
    String query = "SELECT * FROM museum.event;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get Events from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllTours() async {
    String query = "SELECT * FROM museum.tour;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get Tours from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllSouvenirs() async {
    String query = "SELECT * FROM museum.souvenir;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get Souvenirs from database");
    }
    return ret;
  }

  static Future<int> addNewEventAttends(Map<String, dynamic> formData) async {
    String classe = formData["class"];
    int memberId = formData["member_id"];
    int articleId = formData["article_id"];

    List<dynamic> toSend = [memberId, articleId, classe];

    dynamic res =
        await DBManager.executeNonQueryProc('insert_into_attends', toSend);

    if (res == 0) {
      //don't exist
      return -1;
    }
    print('attended inserted success');
    return res;
  }

  static Future<int> addNewTourGoOn(Map<String, dynamic> formData) async {
    int memberId = formData["member_id"];
    int articleId = formData["article_id"];

    List<dynamic> toSend = [memberId, articleId];

    dynamic res =
        await DBManager.executeNonQueryProc('insert_new_go_on', toSend);

    if (res == 0) {
      //don't exist
      return -1;
    }
    print('attended tour inserted success');
    return res;
  }

  static Future<List<dynamic>> getAllAttends() async {
    String query = "SELECT * FROM museum.attends;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get attends from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllDepartment() async {
    String query = "SELECT * FROM museum.department;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get departments from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllResearcher() async {
    String query = "SELECT * FROM museum.researcher;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get researchers from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllStaff() async {
    String query = "SELECT * FROM museum.staff;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get staff from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllVisitor() async {
    String query = "SELECT * FROM museum.visitor;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get visitor from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllBuy_member_souvenir() async {
    String query = "SELECT * FROM museum.buy_member_souvenir;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get buy_member_souvenir from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllbuys_visitor_souvenir() async {
    String query = "SELECT * FROM museum.buys_visitor_souvenir;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get buys_visitor_souvenir from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllFeedback() async {
    String query = "SELECT * FROM museum.give_feedback;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get give_feedback from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllgive_session() async {
    String query = "SELECT * FROM museum.give_session;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get give_session from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllpainting_artifact() async {
    String query = "SELECT * FROM museum.painting_artifact;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get painting_artifact from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllReads() async {
    String query = "SELECT * FROM museum.reads;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get reads from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllReviews() async {
    String query = "SELECT * FROM museum.reviews;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get reviews from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllSection() async {
    String query = "SELECT * FROM museum.section;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get sections from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllWrites() async {
    String query = "SELECT * FROM museum.writes;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get writes from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllgo_on() async {
    String query = "SELECT * FROM museum.go_on;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get go_on from database");
    }
    return ret;
  }

  static Future<int> addNewReview(Map<String, dynamic> formData) async {
    String result = formData["result"];
    int progress = int.parse(formData['progress']);
    int RID = int.parse(formData['R_ID']);
    int AID = int.parse(formData['A_ID']);

    List<dynamic> toSend = [result, progress, RID, AID];
//first you add the user
    dynamic res =
        await DBManager.executeNonQueryProc('insert_new_review', toSend);

    if (res == 0) {
//don't exist
      return -1;
    }
    return 1; // returned successfully
  }

  static Future<List<dynamic>> getAllSectionNumbers() async {
    String query = "SELECT number FROM museum.section;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get go_on from database");
    }
    return ret;
  }

  //getMemIDs
  static Future<List<dynamic>> getMemIDs() async {
    String query = "SELECT ID FROM museum.member;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get go_on from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getTourIDs() async {
    String query = "SELECT ID FROM museum.tour;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get tours from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getPIDs() async {
    String query = "SELECT ID FROM museum.painting_artifact;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get go_on from database");
    }
    return ret;
  }

  static Future<int> addNewPaintingAndArtifacts(
      Map<String, dynamic> formData) async {
    //ID, name, type, description, section_number

    int ID = await getPaintingCount();
    String name = formData["name"];
    String type = formData["Type"];
    String description = formData["description"];
    int sectionNumber = int.parse(formData["section_number"]);

    List<dynamic> toSend2 = [ID, name, type, description, sectionNumber];
    dynamic res2 = await DBManager.executeNonQueryProc(
        'inser_new_painting_artifact', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    return 1; // returned successfully
  }

  static Future<int> deleteMember(int chosenID) async {
    List<dynamic> toSend2 = [chosenID];
    dynamic res2 =
        await DBManager.executeNonQueryProc('delete_member', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    return 1; // returned successfully
  }

  static Future<int> addNewFeedback(Map<String, dynamic> formData) async {
    //rate, comment, ME_ID, P_ID
    int rate = int.parse(formData["rate"]);
    String comment = formData["comment"];
    int ME_ID = int.parse(formData["ME_ID"]);
    int P_ID = int.parse(formData["P_ID"]);

    List<dynamic> toSend2 = [rate, comment, ME_ID, P_ID];
    dynamic res2 =
        await DBManager.executeNonQueryProc('insert_new_feedback', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    return 1; // returned successfully
  }

  static Future<int> addNewArticle(Map<String, dynamic> formData) async {
    //ID, state_, content, likes, views_, header
    int ID = await getArticleCount();
    String state_ = formData["state_"];
    String content = formData["content"];
    int likes = int.parse(formData["likes"]);
    int views_ = int.parse(formData["views_"]);
    String header = formData["header"];

    List<dynamic> toSend2 = [ID, state_, content, likes, views_, header];
    dynamic res2 =
        await DBManager.executeNonQueryProc('insert_new_article', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    return 1; // returned successfully
  }

  static Future<int> addNewSession(Map<String, dynamic> formData) async {
    //R_ID, E_ID
    int R_ID = int.parse(formData["R_ID"]);
    int E_ID = int.parse(formData["E_ID"]);

    List<dynamic> toSend2 = [R_ID, E_ID];
    dynamic res2 =
        await DBManager.executeNonQueryProc('insert_new_session', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    return 1; // returned successfully
  }

  static Future<List<dynamic>> getEventIDs() async {
    String query = "SELECT ID FROM museum.event;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get go_on from database");
    }
    return ret;
  }

  static Future<int> getArticleCount() async {
    String query = "SELECT count(ID) FROM museum.article;";

    dynamic count = await DBManager.executeScaler(query);

    if (count == null) {
      //don't exist
      return -1;
    }
    return count;
  }

  // static Future<int> getTourCount() async {
  //   String query = "SELECT count(ID) FROM museum.tour;";
  //
  //   dynamic count = await DBManager.executeScaler(query);
  //
  //   if (count == null) {
  //     //don't exist
  //     return -1;
  //   }
  //   return count;
  // }

  // static Future<int> addNewTour(Map<String, dynamic> formData) async {
  //   //ID, place, description, topic, Date_Start, Date_End, organizer_id, title
  //   int ID = await getTourCount();
  //   String place = formData["place"];
  //   String description = formData["description"];
  //   String topic = formData["topic"];
  //   String Date_Start = formData["Date_Start"];
  //   String Date_End = formData["Date_End"];
  //   int organizer_id = int.parse(formData["organizer_id"]);
  //   String title = formData["title"];
  //
  //   List<dynamic> toSend2 = [
  //     ID,
  //     place,
  //     description,
  //     topic,
  //     Date_Start,
  //     Date_End,
  //     organizer_id,
  //     title
  //   ];
  //   dynamic res2 =
  //       await DBManager.executeNonQueryProc('insert_new_tour', toSend2);
  //   if (res2 == 0) {
  //     //don't exist
  //     return -1;
  //   }
  //   return 1; // returned successfully
  // }

  static Future<List<dynamic>> getSouvenirIDs() async {
    String query = "SELECT ID FROM museum.souvenir;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get ID from database");
    }
    return ret;
  }

  static Future<int> deleteUser(String username) async {
    int type_ = await getUserType_u(username);
    dynamic memId;

    if (type_ == 1) {
      //member
      String query =
          "select id from museum.member where mem_username = '$username';";
      memId = await DBManager.executeScaler(query);
    } else if (type_ == 3) {
      //researcher
      String query =
          "select id from museum.researcher where R_username = '$username';";
      memId = await DBManager.executeScaler(query);
    } else if (type_ != 0) {
      //staff
      String query =
          "select id from museum.staff where staff_username = '$username';";
      memId = await DBManager.executeScaler(query);
    }

    List<dynamic> toSend2 = [username];
    dynamic res2 = await DBManager.executeNonQueryProc('delete_user', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    List toSend = [memId];
    if (type_ == 1) {
      //member
      dynamic res2 = await DBManager.executeNonQueryProc('up_mem', toSend);
    } else if (type_ == 3) {
      //researcher
      dynamic res2 =
          await DBManager.executeNonQueryProc('up_researcher', toSend);
    } else if (type_ != 0) {
      //staff
      dynamic res2 = await DBManager.executeNonQueryProc('up_staff', toSend);
    }
    print('succ');
    return 1; // returned successfully
  }

  static Future<List<dynamic>> getAllMemIDs() async {
    String query = "SELECT id FROM museum.member;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get Ids from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllEventsIDs() async {
    String query = "SELECT id FROM museum.event;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get Ids from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllDepIDs() async {
    String query = "SELECT dno FROM museum.department;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get Ids from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllArticlesIDs() async {
    String query = "SELECT id FROM museum.article;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get Ids from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllPaintingArtifactIDs() async {
    String query = "SELECT id FROM museum.painting_artifact;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get Ids from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllResearcherIDs() async {
    String query = "SELECT id FROM museum.researcher;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get Ids from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllSouvenirIDs() async {
    String query = "SELECT id FROM museum.souvenir;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get Ids from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllUserIDs() async {
    String query = "SELECT username_ FROM museum.user_;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get USernames from database");
    }
    return ret;
  }

  static Future<List<dynamic>> getAllVisitorsIDs() async {
    String query = "SELECT id FROM museum.visitor;";

    dynamic ret = await DBManager.executeReader(query);
    if (ret == null) {
      throw Exception("Cant get Ids from database");
    }
    return ret;
  }

  static Future<int> deleteDepartment(int chosenID) async {
    List<dynamic> toSend2 = [chosenID];
    dynamic res2 = await DBManager.executeNonQueryProc('delete_dep', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    dynamic res3 = await DBManager.executeNonQueryProc('up_dep', toSend2);

    return 1; // returned successfully
  }

  static Future<int> deleteEvent(int chosenID) async {
    List<dynamic> toSend2 = [chosenID];
    dynamic res2 = await DBManager.executeNonQueryProc('delete_event', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    dynamic res3 = await DBManager.executeNonQueryProc('up_event', toSend2);

    return 1; // returned successfully
  }

  static Future<int> deleteTour(int chosenID) async {
    List<dynamic> toSend2 = [chosenID];
    dynamic res2 = await DBManager.executeNonQueryProc('delete_tour', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    dynamic res3 = await DBManager.executeNonQueryProc('up_tour', toSend2);

    return 1; // returned successfully
  }

  static Future<int> deleteSection(int chosenID) async {
    List<dynamic> toSend2 = [chosenID];
    dynamic res2 =
        await DBManager.executeNonQueryProc('delete_section', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    dynamic res3 = await DBManager.executeNonQueryProc('up_section', toSend2);

    return 1; // returned successfully
  }

  static Future<int> deleteResearcher(int chosenID) async {
    List<dynamic> toSend2 = [chosenID];
    dynamic res2 =
        await DBManager.executeNonQueryProc('delete_researcher', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    return 1; // returned successfully
  }

  static Future<int> getSouvenirCount() async {
    String query = "SELECT count(ID) FROM museum.souvenir;";

    dynamic count = await DBManager.executeScaler(query);

    if (count == null) {
      //don't exist
      return -1;
    }
    return count;
  }

  static Future<int> addNewSouvenir(Map<String, dynamic> formData) async {
    //ID int PK
    // _name varchar(50)
    // price int
    // quantity
    int ID = await getSouvenirCount();
    String _name = formData["_name"];
    int price = int.parse(formData["price"]);
    int quantity = formData["quantity"];

    List<dynamic> toSend2 = [ID, _name, price, quantity];
    dynamic res2 =
        await DBManager.executeNonQueryProc('insert_new_souvenir', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    dynamic res3 =
        await DBManager.executeNonQueryProc('up_researcher', toSend2);

    return 1; // returned successfully
  }

  static Future<int> deleteSouvenir(int chosenID) async {
    List<dynamic> toSend2 = [chosenID];
    dynamic res2 =
        await DBManager.executeNonQueryProc('delete_souvenir', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    dynamic res3 = await DBManager.executeNonQueryProc('up_souvenir', toSend2);

    return 1; // returned successfully
  }

  static Future<int> deleteArticle(int chosenID) async {
    List<dynamic> toSend2 = [chosenID];
    dynamic res2 =
        await DBManager.executeNonQueryProc('delete_article', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    dynamic res3 = await DBManager.executeNonQueryProc('up_article', toSend2);

    return 1; // returned successfully
  }

  static Future<int> deleteVisitor(int chosenID) async {
    List<dynamic> toSend2 = [chosenID];
    dynamic res2 =
        await DBManager.executeNonQueryProc('delete_visitor', toSend2);

    if (res2 == 0) {
      //don't exist
      return -1;
    }
    dynamic res3 = await DBManager.executeNonQueryProc('up_visitor', toSend2);

    return 1; // returned successfully
  }

  static Future<int> deletePaintingArtifact(int chosenID) async {
    List<dynamic> toSend2 = [chosenID];
    dynamic res2 = await DBManager.executeNonQueryProc(
        'delete_painting_artifact', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    dynamic res3 =
        await DBManager.executeNonQueryProc('up_painting_artifact', toSend2);

    return 1; // returned successfully
  }

  static Future<dynamic> getSouvenirSale() async {
    String query =
        "select So_ID,count(quantity) from museum.buy_member_souvenir group by So_ID ;";
    var us = await DBManager.executeReader(query);
    if (us == null) {
      return null;
    }
    return us;
  }

  static Future<dynamic> getSouvenirSale_visitor() async {
    String query =
        "select S_ID,count(quantity) from museum.buys_visitor_souvenir group by S_ID;";
    var us = await DBManager.executeReader(query);
    if (us == null) {
      return null;
    }
    return us;
  }

  static Future<int> UpdateSalary(Map<String, dynamic> formData) async {
    int ID = formData["ID"];
    int promotion = int.parse(formData["Promotion"]);
    // String query = "select salary from museum.staff where ID = '$ID';";
    // int salary = await DBManager.executeScaler(query);
    // if (salary == null) {
    //   return -1;
    // }
    List<int> toSend = [ID, promotion];
    dynamic res =
        await DBManager.executeNonQueryProc('update_employee_salary', toSend);
    if (res == 0) {
      return -1;
    }
    return 1;
  }

  static Future<dynamic> getReviewedArticles() async {
    String query =
        "select ID,state_,content,likes,views_,header from article,reviews where result='F' and article.ID=reviews.A_ID;";
    List<dynamic> us = await DBManager.executeReader(query);
    if (us.isEmpty) {
      return null;
    }
    return us;
  }

  static Future<int> UpdateArticleToP(Map<String, dynamic> formData) async {
    int ID = formData["ID"];
    print(ID);
    List<int> toSend = [ID];
    dynamic res =
        await DBManager.executeNonQueryProc('update_article_toP', toSend);
    print(res);
    if (res == 0) {
      return -1;
    }
    return 1;
  }

  static Future<List<event_loc>> geteventlocation(String eve_title) async {
    List<event_loc> ret = await DBManager.geteventloc(eve_title);
    if (ret == null) {
      throw Exception("Cant get Events from database");
    }
    return ret;
  }
  static Future<int> ChangePassowrd(Map<String, dynamic> formData) async {
    String password = formData["password"];
    String username = formData["username"];
    List<dynamic> toSend = [username,password];
    dynamic res =
    await DBManager.executeNonQueryProc('update_password', toSend);
    print(res);
    if (res == 0) {
      return -1;
    }
    return 1;
  }
}
