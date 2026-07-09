// ===============================
// HANDS-ON 5 - MongoDB
// ===============================

// Use Database
use("college_nosql");

// ===============================
// Task 65
// Find all feedback with rating 5
// ===============================
db.feedback.find({ rating: 5 });

// ===============================
// Task 66
// Find CS101 feedback with tag "challenging"
// ===============================
db.feedback.find({
    course_code: "CS101",
    tags: "challenging"
});

// ===============================
// Task 67
// Display only student_id, course_code and rating
// ===============================
db.feedback.find(
    {},
    {
        _id: 0,
        student_id: 1,
        course_code: 1,
        rating: 1
    }
);

// ===============================
// Task 68
// Add needs_review = true
// ===============================
db.feedback.updateMany(
    { rating: { $lt: 3 } },
    { $set: { needs_review: true } }
);

// ===============================
// Task 69
// Add reviewed tag
// ===============================
db.feedback.updateMany(
    { needs_review: true },
    { $push: { tags: "reviewed" } }
);

// ===============================
// Task 70
// Delete 2021-EVEN records
// ===============================
db.feedback.deleteMany({
    semester: "2021-EVEN"
});

// ===============================
// Task 71 & 72
// Aggregation Pipeline
// ===============================
db.feedback.aggregate([
    {
        $match: {
            semester: "2022-ODD"
        }
    },
    {
        $group: {
            _id: "$course_code",
            avg_rating: { $avg: "$rating" },
            feedback_count: { $sum: 1 }
        }
    },
    {
        $sort: {
            avg_rating: -1
        }
    },
    {
        $project: {
            _id: 0,
            course_code: "$_id",
            average_rating: {
                $round: ["$avg_rating", 1]
            },
            feedback_count: 1
        }
    }
]);

// ===============================
// Task 73
// Tag Frequency
// ===============================
db.feedback.aggregate([
    {
        $unwind: "$tags"
    },
    {
        $group: {
            _id: "$tags",
            count: { $sum: 1 }
        }
    },
    {
        $sort: {
            count: -1
        }
    }
]);

// ===============================
// Task 74
// Create Index
// ===============================
db.feedback.createIndex({
    course_code: 1
});

// Verify Index
db.feedback.find({
    course_code: "CS101"
}).explain("executionStats");