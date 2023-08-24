class Home01Model {
  String? image;
  String? title;
  String? descriptiomn;

  Home01Model(
      {required this.image, required this.title, required this.descriptiomn});

  static List<Home01Model> homemodellist = [
    Home01Model(
        image: 'images/home/learnfun01.png',
        descriptiomn:
            "Get your blood pumping and build up your endurance with some...",
        title: 'Daily Star Basics'),
    Home01Model(
        image: 'images/home/learnfun02.png',
        descriptiomn:
            "Strength training makes you stronger, helps you control your...",
        title: 'Acrobatic Games'),
    Home01Model(
        image: 'images/home/learnfun03.png',
        descriptiomn:
            "There are many benefits to yoga and Pilates, including increased...",
        title: 'Spagat Challenge'),
    Home01Model(
        image: 'images/home/learnfun04.png',
        descriptiomn:
            "There are many benefits to yoga and Pilates, including increased...",
        title: 'Yoga & Pilates'),
  ];
}
