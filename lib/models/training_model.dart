class TraingModel {
  String? image;
  String? name;
  String? duration;

  TraingModel({this.image, this.name, this.duration});

  static List<TraingModel> traingList = [
    //row 1
    TraingModel(
        image: "images/training/strength.png",
        name: 'Strength & lengthen',
        duration: "16 Min | Intensity ...."),
    TraingModel(
        image: "images/training/ropebattle.png",
        name: 'Battle ropes  HIIT',
        duration: "14 Min | Intensity ...."),
    TraingModel(
        image: "images/training/improvestrength.png",
        name: 'Improve  strength  for run',
        duration: "13 Min | Intensity ...."),
    TraingModel(
        image: "images/training/intence.png",
        name: 'Intense  full body workout',
        duration: "25 Min | Intensity ...."),
//row 2
    TraingModel(
        image: "images/training/workout.png",
        name: 'Workout  with weights',
        duration: "12 Min | Intensity ...."),
    TraingModel(
        image: "images/training/glutes.png",
        name: 'Glutes and leg strength',
        duration: "15 Min | Intensity ...."),
    TraingModel(
        image: "images/training/fullbody.png",
        name: 'Full body strength',
        duration: "28 Min | Intensity ...."),
    TraingModel(
        image: "images/training/bignner.png",
        name: 'Strength for beginners',
        duration: "10 Min | Intensity ...."),
    //row3
    TraingModel(
        image: "images/training/interval.png",
        name: 'Interval 5 day split',
        duration: "16 Min | Intensity ...."),
    TraingModel(
        image: "images/training/power.png",
        name: 'Power workout',
        duration: "25 Min | Intensity ...."),
    TraingModel(
        image: "images/training/abs.png",
        name: 'Beginner abs training',
        duration: "13 Min | Intensity ...."),
    TraingModel(
        image: "images/training/gym.png",
        name: 'Working  in the gym',
        duration: "20 Min | Intensity ...."),
  ];
}
