from flask import Flask
import os

app = Flask(__name__)

@app.route("/health")
def health():
    return '',200

@app.route("/ready")
def ready():

    return 'Hello world\n',200

if __name__ == "__main__":
    app.run(host='0.0.0.0')