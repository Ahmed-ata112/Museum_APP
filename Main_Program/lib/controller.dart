import 'api.dart';
import 'package:intl/intl.dart';
import 'data_holders.dart';

class Controller {
  Controller() {}

  static Future<int> getUserType(Map<String, dynamic> formData) async {
    String username = formData["username"];
    String password = formData["password"];

    String query =
        "select type_ from museum.user_ where username_='$username' and password_='$password';";

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

    dynamic count = await DBManager.executeScaler(query);

    if (count == null) {
      //don't exist
      return -1;
    }
    return count;
  }

  static Future<int> getResearcherID(String username) async {
    String query =
        "select id from museum.researcher where R_username='$username';";

    dynamic id = await DBManager.executeScaler(query);

    if (id == null) {
      //don't exist
      return -1;
    }
    return id;
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


  static Future<int> insertNewArticle(Map<String, dynamic> newArticle) async {
    String state = newArticle["state"];
    String content = newArticle["content"];
    String header = newArticle["header"];
    int rId = newArticle['rId'];

    int id = await getArticlesCount();

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

  static Future<int> updateExistingArticle(Map<String, dynamic> toEdit) async
  {
    int id = toEdit['id'];
    String content = toEdit['content'];
    String state = toEdit['state'];

    List<dynamic> toSend = [id, state, content];

    dynamic res =
    await DBManager.executeNonQueryProc('updateArticle', toSend);
    if (res == 0) {
      //some problem occurred
      return -1;
    }
    return 1;
  }
  static Future<dynamic> getOwnNFArticles(int rID) async {
    String query =
        "SELECT * FROM article join writes on Art_ID=article.ID where Re_ID=$rID;";

    List<dynamic> articles = await DBManager.executeReader(query);
    if (articles.isEmpty) {
      //don't exist
      return null;
    }
    List<dynamic> art;
    List<Article> toReturn = List<Article>.generate(articles.length, (index)
    {
      art = articles[index];
      return Article(art[0], art[1], art[2], art[5], null, null, null);
    }
    );
    return toReturn; //
  }

  static Future<dynamic> getOwnPubArticles(int rID) async {
    String query =
        "SELECT * FROM article join writes on Art_ID=article.ID where Re_ID=$rID and state_='P';";

    List<dynamic> articles = await DBManager.executeReader(query);
    if (articles.isEmpty) {
      return null;
    }
    List<dynamic> art;
    List<dynamic> toReturn = List.filled(0, null, growable: true);
    for(art in articles)
      {
        int reviews = await getReviewsCount(art[0]);
        toReturn.add(
            Article(art[0], art[1], art[2], art[5], art[3], art[4], reviews));
      }
    return toReturn; //
  }

  static Future<dynamic> getOwnRevArticles(int rID) async {
    String query =
        "SELECT * FROM article join writes on Art_ID=article.ID where Re_ID=$rID and state_='R';";
    List<dynamic> articles = await DBManager.executeReader(query);
    if (articles.isEmpty) {
      return null;
    }
    List<dynamic> art;
    List<dynamic> toReturn = List.filled(0, null, growable: true);
    for(art in articles)
    {
      int reviews = await getReviewsCount(art[0]);
      toReturn.add(
          Article(art[0], art[1], art[2], art[5], art[3], art[4], reviews));
    }
    return toReturn; //
  }

  static Future<dynamic> getToReviewArticles(int rID) async
  {
    String query =
        "SELECT * FROM article as A join writes on Art_ID=A.ID where Re_ID!=$rID and state_='P'"
  " and A.ID NOT IN (SELECT A_ID FROM reviews where A_ID=A.ID and R_ID=$rID)";
    List<dynamic> articles = await DBManager.executeReader(query);
    if (articles.isEmpty) {
      return null;
    }
    List<dynamic> art;
    List<dynamic> toReturn = List.filled(0, null, growable: true);
    for(art in articles)
    {
      int reviews = await getReviewsCount(art[0]);
      toReturn.add(
          Article(art[0], art[1], art[2], art[5], art[3], art[4], reviews));
    }
    return toReturn; //
  }
  //reviewed articles or he reviewed
  static Future<dynamic> getGenArticles(int rID) async
  {
    String query =
        "SELECT * FROM article as A join writes on Art_ID=A.ID where (Re_ID!=$rID and state_='R')"
    " OR A.ID IN (SELECT A_ID FROM reviews where A_ID=A.ID and R_ID=$rID);";
    List<dynamic> articles = await DBManager.executeReader(query);
    if (articles.isEmpty) {
      return null;
    }
    List<dynamic> art;
    List<dynamic> toReturn = List.filled(0, null, growable: true);
    for(art in articles)
    {
      int reviews = await getReviewsCount(art[0]);
      toReturn.add(
          Article(art[0], art[1], art[2], art[5], art[3], art[4], reviews));
    }
    return toReturn; //
  }

  static Future<dynamic> addReview(Map<String, dynamic> review) async
  {
    int progress = review["progress"];
    String result = review["result"];
    int articleId = review["articleId"];
    int rID = review['rId'];

  }

  static getResearcherData(String username) async {
    String query =
        "SELECT * FROM museum.researcher where R_username='$username';";

    List<dynamic> data = await DBManager.executeReader(query);
    if (data.isEmpty) {
      //don't exist
      return null;
    }
    List<dynamic> resData = data[0];
    Researcher res = Researcher(
        resData[0],
        resData[1],
        resData[2],
        resData[3],
        resData[4],
        resData[5],
        resData[6]);
    print(res.fName);
    return res; //
  }
}
