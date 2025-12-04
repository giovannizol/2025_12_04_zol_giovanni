// TODO: write your pure dart code excercise here

class Excercise {
  Excercise({required this.name, required this.score, required this.submittedAt})
    : assert(score >= 0 && score <= 100, "value must be between 0 and 100");

  final String name;
  final int score;
  final DateTime submittedAt;

  bool get isPassed {
    return score >= 60;
  }

  @override
  String toString() {
    return "Excercise(name: $name, score: $score, submittedAt: $submittedAt)";
  }
}

// #1 function passedOnly(): return a list with exercises where score => 60 (isPassed)

List<Excercise> passedOnly(List<Excercise> exercises) {
  final filteredList = <Excercise>[];

  if (exercises.isEmpty) return filteredList;

  for (final exercise in exercises) {
    if (exercise.isPassed) {
      filteredList.add(exercise);
    }
  }
  return filteredList;
}

// #2 function averageScore(): return the avg score of the given list

double? averageScore(List<Excercise> exercises) {
  double avgScore = 0;

  if (exercises.isEmpty) return null;

  for (final exercise in exercises) {
    avgScore = avgScore + exercise.score;
  }
  return avgScore / exercises.length;
}

// #3 function bestStudent(): return the student with the best score from the the given list

List<Excercise> bestStudent(List<Excercise> exercises) {
  final bestStudentList = <Excercise>[];
  var tempMaxScore = 0;
  final listTempIndexes = <int>[];

  if (exercises.isEmpty) return bestStudentList;

  for (final exercise in exercises) {
    if (tempMaxScore < exercise.score) {
      tempMaxScore = exercise.score;
    }
  }

  for (final (index, exercise) in exercises.indexed) {
    if (exercise.score == tempMaxScore) {
      listTempIndexes.add(index);
    }
  }

  for (final index in listTempIndexes) {
    bestStudentList.add(exercises[index]);
  }

  return bestStudentList;
}

void main() {
  final listOfExercises = <Excercise>[
    Excercise(name: "Mario", score: 70, submittedAt: DateTime.now()),
    Excercise(name: "Luigi", score: 100, submittedAt: DateTime.now()),
    Excercise(name: "Sivio", score: 100, submittedAt: DateTime.now()),
    Excercise(name: "PierSilvio", score: 40, submittedAt: DateTime.now()),
  ];

  final list2 = passedOnly(listOfExercises);
  final avgScore = averageScore(listOfExercises);
  final bestStudents = bestStudent(listOfExercises);

  print("list2: $list2");
  print("avgScore: $avgScore");
  print("bestStudents: $bestStudents");
}
