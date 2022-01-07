from flask import Flask, render_template, request
from flask_mysqldb import MySQL
from flask_restful import Resource, Api, reqparse
import datetime
import json
app = Flask(__name__)


#app.config["DEBUG"] = True
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_DB'] = 'museum'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
mysql = MySQL(app)
parser = reqparse.RequestParser()


@app.route('/form')
def form():
    return render_template('form.html')


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

     print(type(inst)) # the exception instance

     print(inst.args)  # arguments stored in .args

     print(inst) # _str_ allows args to be printed directly,

     cursor.close()

     print("In excpet")

     ret = {'result': 0}

     return None # indicates error


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

        print(type(inst))# the exception instance
        print(inst.args) # arguments stored in .args

        print(inst) # _str_ allows args to be printed directly,

        cursor.close()

        print("In exception")

        return None
class DateTimeEncoder(json.JSONEncoder):
    def default(self, z):
        if isinstance(z, datetime.date):
            return (str(z))
        else:
            return super().default(z)

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
        print(inst)          # str allows args to be printed directly,
        cursor.close()
        return ''

if __name__ == '__main__':
    app.run()
