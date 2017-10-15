# This program demonstrates how easy it is to serve some content through via a webserver.

# source: http://flask.pocoo.org/docs/0.12/quickstart/

# to run this app use the command `export FLASK_APP="03-hello-world-web-application.py"; flask run`
# and then open your browser at http://127.0.0.1:5000/


from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, <b>World</b>! <br> Web apps are <i>simple</i>.'
