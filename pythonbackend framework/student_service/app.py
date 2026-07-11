from flask import Flask, request, jsonify
import requests

app = Flask(__name__)

@app.route("/api/students/<int:id>/enroll", methods=["POST"])
def enroll(id):
    course_id = request.json["course_id"]

    try:
        r = requests.get(f"http://localhost:5001/api/courses/{course_id}")

        if r.status_code == 200:
            return jsonify({
                "message": f"Student {id} enrolled successfully"
            })

        return jsonify({"message": "Course not found"}), 404

    except requests.exceptions.ConnectionError:
        return jsonify({
            "message": "Course Service unavailable"
        }), 503

if __name__ == "__main__":
    app.run(port=5002)