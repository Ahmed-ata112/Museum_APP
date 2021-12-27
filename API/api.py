from flask import Flask, render_template, request
from flask_mysqldb import MySQL
from flask_restful import Resource, Api, reqparse
import json
app = Flask(__name__)


app.config["DEBUG"] = True
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '<Ahmedata>'
app.config['MYSQL_DB'] = 'MyDB'

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
    except:
        cursor.close()
        print("In excpet")
        ret = {'result': 0}
        return ret


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
    except:
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
        print(json.dumps(my_reader_response))
        # String query = "SELECT id FROM mydb.bag where id = 2;";
        # ret = {'result': my_reader_response[0][0]}
        # print(cursor.description)
        # print(my_reader_response) # ((1, 'ahmed'), (2, 'ali'), (3, 'ibrahim'))
        cursor.close()
        return json.dumps(my_reader_response)
    except:
        cursor.close()
        print("In exception")
        return ''


if __name__ == '__main__':
    app.run()
