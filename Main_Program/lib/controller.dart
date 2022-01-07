import 'api.dart';
import 'package:intl/intl.dart';
import 'data_holders.dart';

class Controller {
  Controller() {}

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

  static Future<int> getMembersCount() async {
    String query = "SELECT count(id) FROM museum.member;";

    dynamic count = await DBManager.executeScaler(query);

    if (count == null) {
      //don't exist
      return -1;
    }
    return count;
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
    String img = formData["image"];

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
      phoneNumber,
      img
    ];
    dynamic res2 =
        await DBManager.executeNonQueryProc('insert_new_member', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    return 1; // returned successfully
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
    print(mem_data);
    Member mem = Member(mem_data[0], mem_data[1], mem_data[2], mem_data[3],
        mem_data[4], mem_data[5], mem_data[6], mem_data[7]
        //mem_data[8]
        ); //just need the first row as its the only one exists
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
    int member_id = formData["member_id"];
    int article_id = formData["article_id"];

    List<dynamic> toSend = [member_id, article_id, rating, comment];

    dynamic res =
        await DBManager.executeNonQueryProc('insert_article_feedback', toSend);

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
    int member_id = formData["member_id"];
    int article_id = formData["article_id"];

    List<dynamic> toSend = [member_id, article_id, classe];

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
    int member_id = formData["member_id"];
    int article_id = formData["article_id"];

    List<dynamic> toSend = [member_id, article_id];

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
}
