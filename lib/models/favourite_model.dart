class FavouriteModel {
  String? image;
  String? title;
  String? descriptiomn;

  FavouriteModel(
      {required this.image, required this.title, required this.descriptiomn});

  static List<FavouriteModel> homemodellist = [
    FavouriteModel(
        image: 'images/home/learnfun01.png',
        descriptiomn:
            "Get your blood pumping and build up your endurance with some...",
        title: 'Daily Star Basics'),
    FavouriteModel(
      image: 'images/home/favourite1.png',
      descriptiomn:
          "Strength training makes you stronger, helps you control your...",
      title: 'Acrobatic Games',
    ),
    FavouriteModel(
        image: 'images/home/learnfun03.png',
        descriptiomn:
            "There are many benefits to yoga and Pilates, including increased...",
        title: 'Spagat Challenge'),
    FavouriteModel(
        image: 'images/home/favourite2.png',
        descriptiomn:
            "There are many benefits to yoga and Pilates, including increased...",
        title: 'Yoga & Pilates'),
    FavouriteModel(
        image: 'images/home/favourite3.png',
        descriptiomn:
            "There are many benefits to yoga and Pilates, including increased...",
        title: 'Yoga & Pilates'),
  ];
}
