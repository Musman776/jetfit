class ChallengeModel {
  String? image;
  String? name;
  String? intensity;
  String? type;
  String? descriptiomn;
  String? days;
  String? min;

  ChallengeModel({
    required this.image,
    required this.days,
    required this.min,
    required this.descriptiomn,
    required this.intensity,
    required this.name,
    required this.type,
  });

  static List<ChallengeModel> homemodellist = [
    ChallengeModel(
        days: "30",
        type: "Hugo Wright  |  Challenge",
        intensity: "Easy",
        min: "14 Min",
        image: 'images/training/cinematicbackground.png',
        descriptiomn:
            "Build your full body endurance with high-intensity training drills, kick boxing and more. Quick workouts to warm up before or cool down after your run.",
        name: 'Body Weight Burn'),
    ChallengeModel(
      type: "Charlotte Aldridge  |  Strength",
      min: "15 Min",
      intensity: "Easy",
      days: "15",
      image: 'images/home/learnfun02.png',
      descriptiomn:
          "Strong legs do more than look good. Even the simplest daily movements like walking require leg strength. But you may wonder where to begin. Let’s dive in.",
      name: 'Upper body Basics',
    ),
    ChallengeModel(
        type: "Rachel Wright  |  Yoga",
        intensity: "Easy",
        days: "13",
        min: "13 MIn",
        image: 'images/home/learnfun03.png',
        descriptiomn:
            "Dont let mornings put you in a bad mood! Make your day so much better by launching yourself off your bed and getting in to a full-on workout mode.",
        name: 'lower body Basics'),
    ChallengeModel(
        type: "Andrew Trace  |  Sessions ",
        intensity: "Hard",
        days: "14",
        min: "14 Min",
        image: 'images/home/learnfun04.png',
        descriptiomn:
            "Maximize your workouts with split training! Increase strength and build muscle in this 1-week guided program using heavier weights and targeting specific areas of the body in each workout. Repeat and track your progress!",
        name: 'Speed training basics'),
    ChallengeModel(
        type: "Rachel Wright  |  Yoga",
        intensity: "Medium",
        days: "16",
        min: "14 Min",
        image: 'images/training/intence.png',
        descriptiomn:
            "Establish a connection with your mind, body and thoughts. On board this Awakening Series with me and experience a stronger and more flexible version of you in 30 days. ",
        name: 'Yoga & Pilates'),
    ChallengeModel(
        days: "30",
        type: "Hugo Wright  |  Challenge",
        intensity: "Easy",
        min: "14 Min",
        image: 'images/training/cinematicbackground.png',
        descriptiomn:
            "Build your full body endurance with high-intensity training drills, kick boxing and more. Quick workouts to warm up before or cool down after your run.",
        name: 'Body Weight Burn'),
    ChallengeModel(
      type: "Charlotte Aldridge  |  Strength",
      min: "15 Min",
      intensity: "Easy",
      days: "15",
      image: 'images/home/learnfun02.png',
      descriptiomn:
          "Strong legs do more than look good. Even the simplest daily movements like walking require leg strength. But you may wonder where to begin. Let’s dive in.",
      name: 'Upper body Basics',
    ),
    ChallengeModel(
        type: "Rachel Wright  |  Yoga",
        intensity: "Easy",
        days: "13",
        min: "13 MIn",
        image: 'images/home/learnfun03.png',
        descriptiomn:
            "Dont let mornings put you in a bad mood! Make your day so much better by launching yourself off your bed and getting in to a full-on workout mode.",
        name: 'lower body Basics'),
    ChallengeModel(
        type: "Andrew Trace  |  Sessions ",
        intensity: "Hard",
        days: "14",
        min: "14 Min",
        image: 'images/home/learnfun04.png',
        descriptiomn:
            "Maximize your workouts with split training! Increase strength and build muscle in this 1-week guided program using heavier weights and targeting specific areas of the body in each workout. Repeat and track your progress!",
        name: 'Speed training basics'),
    ChallengeModel(
        type: "Rachel Wright  |  Yoga",
        intensity: "Medium",
        days: "16",
        min: "14 Min",
        image: 'images/training/intence.png',
        descriptiomn:
            "Establish a connection with your mind, body and thoughts. On board this Awakening Series with me and experience a stronger and more flexible version of you in 30 days. ",
        name: 'Yoga & Pilates'),
  ];
}
