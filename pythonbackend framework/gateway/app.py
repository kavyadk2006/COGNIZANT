from flask import Flask, request
import requests

app = Flask(__name__)

@app.route("/api/students/<int:id>/enroll", methods=["POST"])
def gateway(id):
    r = requests.post(
        f"http://localhost:5002/api/students/{id}/enroll",
        json=request.json
    )
    return (r.text, r.status_code)

if __name__ == "__main__":
    app.run(port=5000)