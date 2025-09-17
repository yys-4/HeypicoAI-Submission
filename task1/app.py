import os
from flask import Flask

app = Flask(__name__)

greeting_message = os.environ.get("GREETING", "Hello, World!")

@app.route("/")
def hello():
    # Tampilkan pesan tersebut
    return f"<h1>{greeting_message}</h1>"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)