import os
from flask import Flask

app = Flask(__name__)

# Pesan akan diambil dari environment variable SERVER_MESSAGE
server_message = os.environ.get("SERVER_MESSAGE", "Hello from an unknown server!")

@app.route("/")
def hello():
    return f"<h1>{server_message}</h1>"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)