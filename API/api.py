import datetime
from flask import Flask, render_template, request
from flask_mysqldb import MySQL
from flask_restful import Resource, Api, reqparse
import json


class DateTimeEncoder(json.JSONEncoder):
    def default(self, z):
        def default(self, z):
            if isinstance(z, datetime.date):
                return (str(z))
            else:
                return super().default(z)


app = Flask(__name__)


app.config["DEBUG"] = True
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'NewRoot26042020'
app.config['MYSQL_DB'] = 'museum'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

mysql = MySQL(app)
parser = reqparse.RequestParser()


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
    except Exception as inst:
        print(type(inst))    # the exception instance
        print(inst.args)     # arguments stored in .args
        print(inst)
        cursor.close()
        print("In excpet")
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
        return json.dumps(my_reader_response, cls=DateTimeEncoder)
    except Exception as inst:
        print(type(inst))    # the exception instance
        print(inst.args)     # arguments stored in .args
        print(inst)          # __str__ allows args to be printed directly,
        cursor.close()
        return ''


if __name__ == '__main__':
    app.run()
