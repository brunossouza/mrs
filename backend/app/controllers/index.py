from flask import render_template
from app import app, db
from app.models import models


@app.route("/")
@app.route("/index")
def index():
    return render_template("index.html")
