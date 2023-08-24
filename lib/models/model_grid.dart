class ModelGridView {
  String? image;
  String? head;
  String? description;

  ModelGridView({this.image, this.head, this.description});

  static List<ModelGridView> gridlist = [
    ModelGridView(
      image: "images/training/abs.png",
      head: "Full body strength",
      description: "26 Min | Intensity...",
    ),
    ModelGridView(
        image: "images/training/bignner.png",
        head: "Total-body balance",
        description: "24 Min | Intensity..."),
    ModelGridView(
        image: "images/training/fullbody.png",
        head: "Cicuit training",
        description: "13 Min | Intensity..."),
    ModelGridView(
        image: "images/training/glutes.png",
        head: "Morning Stretch",
        description: "15 Min | Intensity..."),
    ModelGridView(
        image: "images/training/gym.png",
        head: "relaxing yoga",
        description: "26 | Intensity..."),
    ModelGridView(
        image: "images/training/improvestrength.png",
        head: "Full body strength",
        description: "26 | Intensity..."),
    ModelGridView(
        image: "images/training/intence.png",
        head: "Full body strength",
        description: "26 | Intensity..."),
    ModelGridView(
        image: "images/training/interval.png",
        head: "Full body strength",
        description: "26 | Intensity..."),
  ];
}
