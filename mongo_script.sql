
use study1;

db.students.insertOne({
  "name": "Alice",
  "age": 24,
  "major": "Computer Science"
});
db.students.insertMany([
  { "name": "Alice", "age": 22, "major": "Mathematics", "grades": [90, 88, 94] },
  { "name": "Bob", "age": 20, "major": "Physics", "grades": [70, 80, 75] }
]);

db.students.find();

//select from sutdents where name = "john doe"
db.students.find({"name": "John Doe"});
db.students.find({"age": 21});
db.students.find({"age": { $gte: 20 }});
db.students.find({"age": { $gt: 20 }});

db.students.updateOne(
{"name": "John Doe"}, // find
{$set: { "major": "Software Engineering"} }
);

db.students.updateOne(
{"name": "Bob"}, // find
{$set: { "major": "Mathematics"} }
);

db.students.updateMany(
{"major": "Mathematics"}, // find
{$set: { "age": 23} }
);

db.students.deleteOne({"major": "Mathematics"});

db.students.deleteMany({"major": "Mathematics"});

db.students.insertMany([
  { "name": "Jon Snow", "age": 25, "major": "Leadership", "grades": [88, 92, 85] },
  { "name": "Daenerys Targaryen", "age": 23, "major": "Political Science", "grades": [95, 97, 94] },
  { "name": "Arya Stark", "age": 20, "major": "Combat", "grades": [85, 90, 92] },
  { "name": "Sansa Stark", "age": 22, "major": "Diplomacy", "grades": [89, 85, 87] },
  { "name": "Tyrion Lannister", "age": 30, "major": "Strategy", "grades": [90, 95, 88] },
  { "name": "Bran Stark", "age": 18, "major": "History", "grades": [85, 87, 89] },
  { "name": "Jaime Lannister", "age": 32, "major": "Combat", "grades": [78, 80, 85] },
  { "name": "Cersei Lannister", "age": 35, "major": "Political Science", "grades": [95, 94, 96] },
  { "name": "Sandor Clegane", "age": 40, "major": "Combat", "grades": [70, 75, 72] },
  { "name": "Samwell Tarly", "age": 24, "major": "Library Science", "grades": [92, 95, 91] }
]);

db.students.find().sort({"age": -1});
db.students.find().sort({"age": 1});

db.students.find({}, // filter
    // which columns? yes=1
 {
    "name": 1, "age": 1, _id: 0
});

db.students.aggregate([
    { $project: {_id: 0, "name": 1, "averageGrade": { $avg: "$grades"}}}
]);

// select name, age, major from student where major = "Computer Science" or age > 21
db.students.find({
    $or: [
        {"major": "Mathematics"}, // or
        {"age": {$gt: 21}}
    ]
},  {
    "name": 1, "age": 1, "major": 1, _id: 0
});

db.students.find({
    $and: [
        {"major": "Mathematics"}, // and
        {"age": {$gt: 21}}
    ]
},  {
    "name": 1, "age": 1, "major": 1, _id: 0
});





