import 'api.dart';

class Controller {
  late DBManager dbMan;
  Controller() {
    dbMan = DBManager();
  }

  static Future<dynamic> select_data() async
  {
   // String result = 'SELECT a.SO_ID, SUM(a.quantity) FROM ((SELECT SO_ID, quantity FROM buy_member_souvenir) UNION (SELECT S_ID , quantity FROM buys_visitor_souvenir))a GROUP BY a.SO_ID;';
    String result = "select * from user_";
    return DBManager.executeReader(result);
  }


}
