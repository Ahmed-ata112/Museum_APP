from flask import Flask, render_template, request
from flask_mysqldb import MySQL
from flask_restful import Resource, Api, reqparse
import json
import simplejson



app = Flask(__name__)


# app.config["DEBUG"] = True
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '123456789'
app.config['MYSQL_DB'] = 'museum'

mysql = MySQL(app)
parser = reqparse.RequestParser()


class DateTimeEncoder(json.JSONEncoder):
    def default(self, z):
        if isinstance(z, datetime.date):
            return (str(z))
        else:
            return super().default(z)


@app.route('/login', methods=['POST', 'GET'])
def login():
    if request.method == 'GET':
        return "Login via the login Form"

    if request.method == 'POST':
        name = request.form['name']
        age = request.form['age']
        cursor = mysql.connection.cursor()
        cursor.execute(''' INSERT INTO myusers VALUES(%s,%s)''', (name, age))
        mysql.connection.commit()
        cursor.close()
        return f"Done!!"


@app.route('/ExecuteNonQuery', methods=['POST'])
def execute_nonquery():
    try:
        parser.add_argument("query")
        args = parser.parse_args()
        cursor = mysql.connection.cursor()
        Q = args["query"]
        cursor.execute(Q)
        mysql.connection.commit()
        cursor.close()
        ret = {'result': 1}
        return ret
    except Exception as inst:
        print(type(inst))    # the exception instance
        print(inst.args)     # arguments stored in .args
        print(inst)          # __str__ allows args to be printed directly,
        cursor.close()
        print("In excpet")
        ret = {'result': 0}
        return None  # indicates error


@app.route('/ExecuteNonQueryproc', methods=['POST'])
def execute_nonquery_proc():
    try:
        parser.add_argument("procName")
        parser.add_argument("Parameters")

        args = parser.parse_args()
        cursor = mysql.connection.cursor()
        PROC_NAME = args["procName"]
        parameters = args["Parameters"]  # needs to be a list of the parameters

        # print(parameters)
        # print(PROC_NAME)
        t_list = tuple(json.loads(parameters))  # loads jsom -> list
        cursor.callproc(PROC_NAME, t_list)
        mysql.connection.commit()
        cursor.close()
        ret = {'result': 1}
        return ret
    except:
        cursor.close()
        print("In excpet")
        ret = {'result': 0}
        return None


@app.route('/ExecuteScaler', methods=['POST'])
def execute_scaler():
    try:
        parser.add_argument("query")
        args = parser.parse_args()
        cursor = mysql.connection.cursor()
        Q = args["query"]
        cursor.execute(Q)
        mysql.connection.commit()
        my_scaler_response = cursor.fetchall()
        # [[4]]
        ret = {'result': my_scaler_response[0][0]}
        cursor.close()
        return ret
    except Exception as inst:
        print(type(inst))    # the exception instance
        print(inst.args)     # arguments stored in .args
        print(inst)          # __str__ allows args to be printed directly,
        cursor.close()
        print("In exception")
        return None


@app.route('/ExecuteScalerProc', methods=['POST'])
def execute_scaler_proc():
    try:
        parser.add_argument("procName")
        parser.add_argument("Parameters")
        args = parser.parse_args()
        cursor = mysql.connection.cursor()
        PROC_NAME = args["procName"]
        parameters = args["Parameters"]  # needs to be a list of the parameters
        print(parameters)
        print(PROC_NAME)
        t_list = tuple(json.loads(parameters))  # loads jsom -> list
        cursor.callproc(PROC_NAME, t_list)
        # mysql.connection.commit()
        my_scaler_response = [x for x in cursor]
        print(my_scaler_response)
        # cursor.nextset()
        # [[4]]
        ret = {'result': my_scaler_response[0][0]}
        cursor.close()
        return ret
    except Exception as inst:
        print(type(inst))    # the exception instance
        print(inst.args)     # arguments stored in .args
        print(inst)          # __str__ allows args to be printed directly,
        cursor.close()
        print("In exception")
        return None


@app.route('/ExecuteReader', methods=['POST'])
def execute_reader():
    try:
        parser.add_argument("query")
        args = parser.parse_args()
        cursor = mysql.connection.cursor()
        Q = args["query"]
        cursor.execute(Q)
        mysql.connection.commit()
        my_reader_response = cursor.fetchall()
        # print(my_reader_response)
        #print(json.dumps(my_reader_response, cls=DateTimeEncoder))
        # print(my_reader_response) # ((1, 'ahmed'), (2, 'ali'), (3, 'ibrahim'))
        cursor.close()
        return json.dumps(my_reader_response)
    except Exception as inst:
        print(type(inst))    # the exception instance
        print(inst.args)     # arguments stored in .args
        print(inst)          # __str__ allows args to be printed directly,
        cursor.close()
        return ''




# --------------- doaa -------------------------------

@app.route('/getdata', methods=['GET'])
def get_data():
    try:
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT a.SO_ID, SUM(a.quantity) FROM ((SELECT SO_ID, quantity FROM buy_member_souvenir) UNION (SELECT S_ID , quantity FROM buys_visitor_souvenir))a GROUP BY a.SO_ID ORDER BY a.SO_ID;')
        my_reader_response = [x for x in cursor]
        data = []
        for x in my_reader_response:
            data.append({
                'sov_id': x[0],
                'quantity': x[1]
            })
        cursor.close()
        return simplejson.dumps(data)
    except Exception as inst:
        cursor.close()
        return inst


@app.route('/getMaxQuantity', methods=['GET'])
def get_Max_Sold():
    try:
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT max(b.q) as maximum FROM (SELECT a.SO_ID, SUM(a.quantity) as q FROM ((SELECT SO_ID, quantity FROM buy_member_souvenir) UNION (SELECT S_ID , quantity FROM buys_visitor_souvenir))a GROUP BY a.SO_ID)b;')
        my_reader_response = [x for x in cursor]
        data = []
        for x in my_reader_response:
            data.append({
                'maximum': x[0]
            })
        cursor.close()
        return simplejson.dumps(data)
    except Exception as inst:
        cursor.close()
        return inst





@app.route('/getstatistics', methods=['GET'])
def get_Stat():
    try:
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT a.timestamp as time, SUM(a.quantity) as q FROM ((SELECT timestamp, quantity FROM buy_member_souvenir) UNION (SELECT  timestamp, quantity FROM buys_visitor_souvenir))a GROUP BY a.timestamp ORDER BY a.timestamp DESC;')
        my_reader_response = [x for x in cursor]
        data = []
        for x in my_reader_response:
            data.append({
                'time': x[0].strftime("%Y-%m-%d %H:%M:%S"),
                'q': x[1]
            })
        cursor.close()
        return simplejson.dumps(data)
    except Exception as inst:
        cursor.close()
        return inst





@app.route('/getMaxSale', methods=['GET'])
def get_max_sale():
    try:
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT MAX(b.q) as maximum FROM (SELECT a.timestamp as time, SUM(a.quantity) as q FROM ((SELECT timestamp, quantity FROM buy_member_souvenir) UNION (SELECT  timestamp, quantity FROM buys_visitor_souvenir))a GROUP BY a.timestamp ORDER BY a.timestamp)b;')
        my_reader_response = [x for x in cursor]
        data = []
        for x in my_reader_response:
            data.append({
                'maximum': x[0],
            })
        cursor.close()
        return simplejson.dumps(data)
    except Exception as inst:
        cursor.close()
        return inst




@app.route('/getVisitorsArrivalTime', methods=['GET'])
def get_visitors_arriaval_time():
    try:
        cursor = mysql.connection.cursor()
        cursor.execute('select ArrivalTime from museum.visitor;')
        my_reader_response = [x for x in cursor]
        data = []
        for x in my_reader_response:
            data.append({
                'ArrivalTime': x[0].strftime("%Y-%m-%d %H:%M:%S"),
            })
        cursor.close()
        return simplejson.dumps(data)
    except Exception as inst:
        cursor.close()
        return inst







@app.route('/getEvents', methods=['GET'])
def get_events():
    try:
        cursor = mysql.connection.cursor()
        cursor.callproc('show_coming_events')
        #cursor.execute('SELECT ID,Date_Start,Date_End,description,theme,title,sec_number,staff_id FROM museum.event;')
        my_reader_response = [x for x in cursor]
        data = []
        for x in my_reader_response:
            data.append({
                'ID': x[0],
                'Date_Start': x[1].strftime("%d-%b-%Y (%H:%M:%S.%f)"),
                'Date_End': x[2].strftime("%d-%b-%Y (%H:%M:%S.%f)"),
                'description': x[3],
                'theme': x[4],
                'title': x[5],
                'sec_number': x[6],
                'staff_id': x[7]

            })
        cursor.close()
        return simplejson.dumps(data)
    except Exception as inst:
        cursor.close()
        return inst






@app.route('/getTours', methods=['GET'])
def get_Tours():
    try:
        cursor = mysql.connection.cursor()
        cursor.callproc('show_coming_tours')
        #cursor.execute('SELECT ID,Date_Start,Date_End,description,theme,title,sec_number,staff_id FROM museum.event;')
        my_reader_response = [x for x in cursor]
        data = []
        for x in my_reader_response:
            data.append({
                'ID': x[0],
                'place': x[1],
                'description': x[2],
                'topic': x[3],
                'Date_Start': x[4].strftime("%d-%b-%Y (%H:%M:%S.%f)"),
                'Date_End': x[5].strftime("%d-%b-%Y (%H:%M:%S.%f)"),
                'organizer_id': x[6]
            })
        cursor.close()
        return simplejson.dumps(data)
    except Exception as inst:
        cursor.close()
        return inst






@app.route('/getEventLocation', methods=['POST'])
def get_Event_Loc():
    try:
        parser.add_argument("event_title")
        args = parser.parse_args()
        cursor = mysql.connection.cursor()
        cursor.callproc('search_event_location',(args["event_title"],) )
        my_reader_response = [x for x in cursor]
        data = []
        for x in my_reader_response:
            data.append({
                'sec_number': x[0],
            })
        cursor.close()
        return simplejson.dumps(data)
    except Exception as inst:
        cursor.close()
        return inst




@app.route('/getTourLocation', methods=['POST'])
def get_Tour_Loc():
    try:
        parser.add_argument("tour_topic")
        args = parser.parse_args()
        cursor = mysql.connection.cursor()
        cursor.callproc('search_tour_location',(args["tour_topic"],) )
        my_reader_response = [x for x in cursor]
        data = []
        for x in my_reader_response:
            data.append({
                'place': x[0],
            })
        cursor.close()
        return simplejson.dumps(data)
    except Exception as inst:
        cursor.close()
        return inst





@app.route('/SearchVisitorID', methods=['POST'])
def Search_Visitor_ID():
    try:
        parser.add_argument("ID")
        args = parser.parse_args()
        cursor = mysql.connection.cursor()
        cursor.callproc('search_visitor_id',(args["ID"],) )
        my_reader_response = [x for x in cursor]
        data = []
        for x in my_reader_response:
            data.append({
                'ID': x[0],
            })
        cursor.close()
        return simplejson.dumps(data)
    except Exception as inst:
        cursor.close()
        return inst




@app.route('/selectSoveID', methods=['POST'])
def get_Sov_ID():
    try:
        parser.add_argument("ID")
        args = parser.parse_args()
        cursor = mysql.connection.cursor()
        cursor.callproc('search_sov_id',(args["ID"],) )
        my_reader_response = [x for x in cursor]
        data = []
        for x in my_reader_response:
            data.append({
                'ID': x[0],
            })
        cursor.close()
        return simplejson.dumps(data)
    except Exception as inst:
        cursor.close()
        return inst





@app.route('/getNumVisitorsNow', methods=['POST'])
def count_num_visitors():
    try:
        parser.add_argument("arr_time")
        args = parser.parse_args()
        cursor = mysql.connection.cursor()
        cursor.callproc('get_number_of_visitors_now',(args["arr_time"],) )
        my_reader_response = [x for x in cursor]
        data = []
        for x in my_reader_response:
            data.append({
                'numVisitors': x[0],
            })
        cursor.close()
        return simplejson.dumps(data)
    except Exception as inst:
        cursor.close()
        return inst

#get_number_of_visitors_now


# @app.route('/selectSovID', methods=['GET'])
# def get_Sov_ID():
#     try:
#         cursor = mysql.connection.cursor()
#         cursor.execute('SELECT ID FROM museum.souvenir;')
#         my_reader_response = [x for x in cursor]
#         data = []
#         for x in my_reader_response:
#             data.append({
#                 'ID': x[0],
#             })
#         cursor.close()
#         return simplejson.dumps(data)
#     except Exception as inst:
#         cursor.close()
#         return inst



#SELECT ID FROM museum.visitor WHERE ID = id_;




# @app.route('/getMaxQuantity', methods=['GET'])
# def get_Max_Sold():
#     try:
#         cursor = mysql.connection.cursor()
#         cursor.callproc('get_max_quantity_sold_sov')
#         my_reader_response = [x for x in cursor]
#         data = []
#         for x in my_reader_response:
#             data.append({
#                 'quantity': x[0],

#             })
#         cursor.close()
#         return simplejson.dumps(data)
#     except Exception as inst:
#         cursor.close()
#         return inst




#get_max_quantity_sold_sov
#search_event_location
# show_coming_tours

#  show_coming_events

     #name               parameters
#"exec dbo.UpdateCheck_In @room = '400', @building = 'PE', @department = 307, @global_id = 'bacon', @tag = '120420'"
# Execute stored procedure
#storedProc = "exec database..stored_procedure 'param1','param2'"




if __name__ == '__main__':
    app.run()