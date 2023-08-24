import 'package:flutter/material.dart';
import 'package:jetfit/models/challenge_model.dart';
import 'package:jetfit/models/home01_model.dart';
import 'package:jetfit/models/training_model.dart';
import 'package:jetfit/utilis/theme_data.dart';

class Home02Screen extends StatefulWidget {
  const Home02Screen({super.key});

  @override
  State<Home02Screen> createState() => _Home02ScreenState();
}

class _Home02ScreenState extends State<Home02Screen> {
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return Container(
          height: height,
          width: width,
          color: MyThemeData.background,
          child: orientation == Orientation.landscape
              ? Row(
                  children: [
                    Container(
                      height: height,
                      width: width * 0.12,
                      color: MyThemeData.background,
                    ),
                    SizedBox(
                      height: height,
                      width: width * 0.82,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height * 0.12,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 08),
                            child: Text(
                              "Categories",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          SizedBox(
                            height: height * 0.25,
                            width: width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: Home01Model.homemodellist.length,
                              itemBuilder: (buildcontext, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                          height: height * 0.2,
                                          width: width * 0.4,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(Home01Model
                                                      .homemodellist[index]
                                                      .image
                                                      .toString())),
                                              color: Colors.yellow,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Container(
                                            height: height * 0.2,
                                            width: width * 0.4,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomLeft,
                                                  colors: [
                                                    Colors.black
                                                        .withOpacity(0.1),
                                                    Colors.black
                                                        .withOpacity(0.3),
                                                    Colors.black
                                                        .withOpacity(0.7),
                                                    Colors.black,
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: height * 0.02,
                                                  ),
                                                  Text(
                                                    Home01Model
                                                        .homemodellist[index]
                                                        .title
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.01,
                                                  ),
                                                  Text(
                                                    Home01Model
                                                        .homemodellist[index]
                                                        .descriptiomn
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 08),
                            child: Text(
                              "Recomended for you",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: height,
                              width: width,
                              color: MyThemeData.background,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 5,
                                ),
                                itemCount: TraingModel.traingList.length,
                                itemBuilder: (BuildContext context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height! * 0.25,
                                        width: width! * 0.6,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(TraingModel
                                                    .traingList[index].image
                                                    .toString()))),
                                      ),
                                      Text(
                                        TraingModel.traingList[index].name
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        TraingModel.traingList[index].duration
                                            .toString(),
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.08,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 08),
                      child: Text(
                        "Categories",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    SizedBox(
                      height: height * 0.2,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Home01Model.homemodellist.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: height * 0.2,
                                      width: width * 0.7,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(Home01Model
                                              .homemodellist[index].image
                                              .toString()),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.2,
                                      width: width * 0.7,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Colors.black.withOpacity(0.1),
                                            Colors.black.withOpacity(0.5),
                                            Colors.black.withOpacity(0.7),
                                            Colors.black,
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.03,
                                          vertical: height * 0.01,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              Home01Model
                                                  .homemodellist[index].title
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.04,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              Home01Model.homemodellist[index]
                                                  .descriptiomn
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Colors.white60,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 08),
                      child: Text(
                        "Recomended for you",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          height: height,
                          width: width,
                          color: MyThemeData.background,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: ChallengeModel.homemodellist.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 3,
                              ),
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: height,
                                  width: width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Card(
                                        elevation: 5,
                                        color: MyThemeData.background,
                                        shadowColor: MyThemeData.onSurface,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Container(
                                          height: height! * 0.13,
                                          width: width,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(ChallengeModel
                                                    .homemodellist[index]
                                                    .image!)),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          ChallengeModel
                                              .homemodellist[index].name!,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8,
                                          top: 2,
                                          right: 8,
                                        ),
                                        child: Text(
                                          '${ChallengeModel.homemodellist[index].min} | intensity *',
                                          style: TextStyle(
                                              color: MyThemeData.onSurface),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )),
                    )
                  ],
                ),
        );
      }),
    );
  }
}
