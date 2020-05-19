from app import app, db
from app.models import tables


@app.route("/")
@app.route("/index")
def index():
    me = tables.Capacitacao.query.get(1)
    print(me)
    return "running"
