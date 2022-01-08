import 'package:main_program/admin_view/add_new_Painting&artifacts.dart';
import 'package:main_program/admin_view/add_new_visitor.dart';

import 'api.dart';
import 'package:intl/intl.dart';
import 'data_holders.dart';

class Controller {
  Controller() {}



  static Future<int> generateArtId() async {
    String query = "SELECT count(*) FROM museum.article;";

    dynamic count = await DBManager.executeReader(query);
    return count[0]['count(*)'];
  }
  static Future<int> getUserType(Map<String, dynamic> formData) async {
    String username = formData["username"];
    String password = formData["password"];

    String query =
        "select type_ from museum.user_ where username_='$username' and password_='$password';";

    dynamic
    userType = (await DBManager.executeReader(query))[0]['type_'];
    print(userType);
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


  static Future<int> getArticlesCount() async {
    String query = "SELECT count(id) FROM museum.article;";

    dynamic count = await DBManager.executeScaler(query);

    if (count == null) {
      //don't exist
      return -1;
    }
    return count;
  }

  static Future<int> getReviewsCount(int id) async {
    String query = "SELECT count(*) FROM museum.reviews where A_ID=$id;";

    dynamic count = await DBManager.executeReader(query);

    if (count == null) {
      //don't exist
      return -1;
    }
    return count[0]['count(*)'];
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
    String username = formData["staff_username"];
    String Mname = formData["Mname"];
    String Fname = formData["Fname"];
    String Lname = formData["Lname"];
    String job_title = formData["job_title"];
    String gender = formData["gender"];
    String B_date = formData["B_date"];
    String password = formData["password"];
    int type = int.parse(formData["type"]);
    int ID = await getStaffCount();
    int salary = int.parse(formData["salary"]);
    int super_ID = int.parse(formData["super_ID"]);
    int department_num = int.parse(formData["department_num"]);

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
      job_title,
      B_date,
      salary,
      regDate,
      super_ID,
      department_num,
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
    String B_date = formData["B_date"];
    int ID = await getResearcherCount();
    int years_of_experience = int.parse(formData["years_of_experience"]);

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
      B_date,
      years_of_experience,
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
    int manager_ID = int.parse(formData["manager_ID"]);

    List<dynamic> toSend2 = [Dno, name, manager_ID];
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

    List<dynamic> mem_data = data[0];
    print(mem_data);
    Member mem = Member(
        mem_data[0],
        mem_data[1],
        mem_data[2],
        mem_data[3],
        mem_data[4],
        mem_data[5],
        mem_data[6],
        mem_data[7]
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

  static Future<dynamic> getArtWriters(int aId) async
  {
    String query = "SELECT Fname, Lname From researcher, writes where Art_ID=$aId"
        " and Re_ID=ID;";
    dynamic ret = await DBManager.executeReader(query);
    return ret;
  }
  static Future<int> insertNewArticle(Map<dynamic, dynamic> newArticle) async {
    String state = newArticle["state"];
    String content = newArticle["content"];
    String header = newArticle["header"];
    int rId = newArticle['rId'];

    int id = await generateArtId();

    List<dynamic> toSend = [id, state, content, header];

    dynamic res =
    await DBManager.executeNonQueryProc('insertNewArticle', toSend);

    if (res == 0) {
      //some problem occurred
      return -1;
    }
    //if inserted, then insert into writes

    String query = 'insert into writes values($rId, $id);';
    res =
    await DBManager.executeNonQuery(query);
    if (res == 0) {
      //some problem occurred
      return -1;
    }
    return 1; // returned successfully
  }

  static Future<int> updateExistingArticle(Map<dynamic, dynamic> toEdit) async
  {
    int artId = toEdit['id'];
    int rId = toEdit['rId'];

    String content = toEdit['content'];
    String state = toEdit['state'];

    List<dynamic> toSend = [artId, rId, state, content];

    dynamic res =
    await DBManager.executeNonQueryProc('updateArticle', toSend);
    if (res == 0) {
      //some problem occurred
      return -1;
    }
    return 1;
  }

  static Future<dynamic> getSelfNFArticles(int rID) async {
    String query =
        "SELECT * FROM museum.article join museum.writes on Art_ID=article.ID where Re_ID=$rID"
        " and state_='NF';";

    List<dynamic> articles = await DBManager.executeReader(query);

    for (Map<String, dynamic> art in articles) {
      int reviews = await getReviewsCount(art['ID']);
      List<String> writers = await getArtWriters(art['ID']);
      art['reviews'] = reviews;
      art['writers'] = writers;
    }

    return articles;
    /*
    List<dynamic> art;
    List<resArticle> toReturn = List<resArticle>.generate(
        articles.length, (index) {
      art = articles[index];
      return resArticle(
          art[0],
          art[1],
          art[2],
          art[5],
          null,
          null,
          null);
    }
    );
    return toReturn;*/ //
  }

  static Future<dynamic> getGenNFArticles(int rID) async {
    String query =
        "SELECT * FROM article join writes on Art_ID=article.ID where state_='NF'"
        " and article.ID NOT IN (SELECT Art_ID FROM writes where Re_ID=$rID);";

    List<dynamic> articles = await DBManager.executeReader(query);
    for (Map<String, dynamic> art in articles) {
      List<String> writers = await getArtWriters(art['ID']);
      art['writers'] = writers;
    }
    return articles;
    /*
    List<dynamic> art;
    List<resArticle> toReturn = List<resArticle>.generate(
        articles.length, (index) {
      art = articles[index];
      return resArticle(
          art[0],
          art[1],
          art[2],
          art[5],
          null,
          null,
          null);
    }
    );
    return toReturn;*/ //
  }

  static Future<dynamic> getSelfPubArticles(int rID) async {
    String query =
        "SELECT * FROM article join writes on Art_ID=article.ID where Re_ID=$rID and state_='P';";

    List<dynamic> articles = await DBManager.executeReader(query);

    for (Map<String, dynamic> art in articles) {
      int reviews = await getReviewsCount(art['ID']);
      List<String> writers = await getArtWriters(art['ID']);
      art['reviews'] = reviews;
      art['writers'] = writers;
    }
    return articles;
    /*
    List<dynamic> art;
    List<dynamic> toReturn = List.filled(0, null, growable: true);
    for (art in articles) {
      int reviews = await getReviewsCount(art[0]);
      toReturn.add(
          resArticle(
              art[0],
              art[1],
              art[2],
              art[5],
              art[3],
              art[4],
              reviews));
    }
    return toReturn; *///
  }

  static Future<dynamic> getSelfRevArticles(int rID) async {
    String query =
        "SELECT * FROM article join writes on Art_ID=article.ID where Re_ID=$rID and state_='R';";
    List<dynamic> articles = await DBManager.executeReader(query);

    for (Map<String, dynamic> art in articles) {
      int reviews = await getReviewsCount(art['ID']);
      List<String> writers = await getArtWriters(art['ID']);
      art['reviews'] = reviews;
      art['writers'] = writers;
    }
    return articles;
    /*List<dynamic> art;
    List<dynamic> toReturn = List.filled(0, null, growable: true);
    for (art in articles) {
      int reviews = await getReviewsCount(art[0]);
      toReturn.add(
          resArticle(
              art[0],
              art[1],
              art[2],
              art[5],
              art[3],
              art[4],
              reviews));
    }
    return toReturn;*/ //
  }

  static Future<dynamic> getToContRevArticles(int rID) async
  {
    String query =
        "SELECT * FROM article as A join reviews on A_ID=A.ID where R_ID=$rID and progress!=100";
    List<dynamic> articles = await DBManager.executeReader(query);

    for (Map<String, dynamic> art in articles) {
      int reviews = await getReviewsCount(art['ID']);
      List<String> writers = await getArtWriters(art['ID']);
      art['reviews'] = reviews;
      art['writers'] = writers;
    }
    return articles;

    /*List<dynamic> art;
    List<dynamic> toReturn = List.filled(0, null, growable: true);
    for (art in articles) {
      int reviews = await getReviewsCount(art[0]);
      toReturn.add(
          resArticle(
              art[0],
              art[1],
              art[2],
              art[5],
              art[3],
              art[4],
              reviews));
    }
    return toReturn;*/ //
  }

  static Future<dynamic> getToReviewArticles(int rID) async
  {
    String query =
        "SELECT * FROM article as A join writes on Art_ID=A.ID where Re_ID!=$rID and state_='F'"
        " and A.ID NOT IN (SELECT A_ID FROM reviews where A_ID=A.ID and R_ID=$rID)";
    List<dynamic> articles = await DBManager.executeReader(query);

    for (Map<String, dynamic> art in articles) {
      int reviews = await getReviewsCount(art['ID']);
      List<String> writers = await getArtWriters(art['ID']);
      art['reviews'] = reviews;
      art['writers'] = writers;
    }
    return articles;
    /*List<dynamic> art;
    List<dynamic> toReturn = List.filled(0, null, growable: true);
    for (art in articles) {
      int reviews = await getReviewsCount(art[0]);
      toReturn.add(
          resArticle(
              art[0],
              art[1],
              art[2],
              art[5],
              art[3],
              art[4],
              reviews));
    }
    return toReturn;*/ //
  }

  //published articles or he reviewed
  static Future<dynamic> getGenArticles(int rID) async
  {
    String query =
        "SELECT * FROM article as A join writes on Art_ID=A.ID where (Re_ID!=$rID and state_='P')"
        " OR A.ID IN (SELECT A_ID FROM reviews where A_ID=A.ID and R_ID=$rID);";
    List<dynamic> articles = await DBManager.executeReader(query);


    for (Map<String, dynamic> art in articles) {
      int reviews = await getReviewsCount(art['ID']);
      List<String> writers = await getArtWriters(art['ID']);
      art['reviews'] = reviews;
      art['writers'] = writers;
    }
    return articles;
    /*List<dynamic> art;
    List<dynamic> toReturn = [];
    for (art in articles) {
      int reviews = await getReviewsCount(art[0]);
      toReturn.add(
          resArticle(
              art[0],
              art[1],
              art[2],
              art[5],
              art[3],
              art[4],
              reviews));
    }
    return toReturn; *///
  }

  static Future<dynamic> addReview(Map<String, dynamic> review) async
  {
    int progress = review["progress"];
    String result = review["result"];
    int articleId = review["articleId"];
    int rID = review['rId'];
    List<dynamic> toSend = [rID, articleId, progress, result];
    dynamic res =
    await DBManager.executeNonQueryProc('addOrUpdateReview', toSend);

    if (res == 0) {
      //some problem occurred
      return -1;
    }
    return 1;
  }

  static getResearcherData(String username) async {
    String query =
        "SELECT * FROM museum.researcher where R_username='$username';";

    List<dynamic> data = await DBManager.executeReader(query);
    if (data.isEmpty) {
      //don't exist
      return null;
    }
    for (dynamic item in data)
      print(item);

    Map<String, dynamic> resData = data[0];
    Researcher res = Researcher(
        resData['ID'],
        resData['Fname'],
        resData['Mname'],
        resData['Lname'],
        resData['B_date'],
        resData['years_of_experience'],
        resData['R_username']);
    print(res.fName);
    return res;
  }

  static Future<dynamic> getArtHomeArticles(int rID) async
  {
    Map<String, List<dynamic>>toReturn= {};
    toReturn['selfNF'] = await getSelfNFArticles(rID);
    toReturn['GenNF'] = await getGenNFArticles(rID);
    toReturn['P'] = await getSelfPubArticles(rID);
    toReturn['Self_reviewed'] = await getSelfRevArticles(rID);
    toReturn['To_cont_review'] = await getToContRevArticles(rID);
    toReturn['To_review'] = await getToReviewArticles(rID);
    toReturn['Gen'] = await getGenArticles(rID);
    /*getSelfNFArticles(rID).then((map)
    {
      if(map!=null)
      {toReturn['selfNF'] = map;}
      else {toReturn['selfNF'] = [];}
    });
    getGenNFArticles(rID).then((map)
    {
      if(map!=null)
      {toReturn['GenNF'] = map;}
      else {toReturn['GenNF'] = [];}
    });
    getSelfPubArticles(rID).then((map)
    {
      if(map!=null)
      {toReturn['P'] = map;}
      else {toReturn['P'] = [];}
    });
    getToContRevArticles(rID).then((map)
    {
      if(map!=null)
      {toReturn['To_cont_review'] = map;}
      else {toReturn['To_cont_review'] = [];}
    });
    getSelfRevArticles(rID).then((map)
    {
      if(map!=null)
      {toReturn['Self_reviewed'] = map;}
      else {toReturn['Self_reviewed'] = [];}
    });
    getToReviewArticles(rID).then((map)
    {
      if(map!=null)
      {toReturn['To_review'] = map;}
      else {toReturn['To_review'] = [];}
    });
    getGenArticles(rID).then((map)
    {
      if(map!=null)
      {toReturn['Gen'] = map;}
      else {toReturn['Gen'] = [];}
    });*/
    print(toReturn);
    return toReturn; //
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
int result = int.parse(formData["result"]);
int progress = int.parse(formData['progress']);
int R_ID = int.parse(formData['R_ID']);
int A_ID = int.parse(formData['A_ID']);

List<dynamic> toSend = [result, progress, R_ID, A_ID];
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
  static Future<int> addNewPaintingAndArtifacts(Map<String, dynamic> formData) async {
    //ID, name, type, description, section_number

    int ID = await getSectionCount();
    String name = formData["name"];
    String type = formData["type"];
    String description = formData["description"];
    int section_number=int.parse(formData["section_number"]);

    List<dynamic> toSend2 = [ID, name, type, description, section_number];
    dynamic res2 =
    await DBManager.executeNonQueryProc('insert_new_PaintingandArtifact', toSend2);
    if (res2 == 0) {
      //don't exist
      return -1;
    }
    return 1; // returned successfully
  }
}