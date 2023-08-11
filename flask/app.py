from flask import Flask
from views import views

app = Flask(__name__)
app.register_blueprint(views, url_prefix="/views")


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True, port=5000)
