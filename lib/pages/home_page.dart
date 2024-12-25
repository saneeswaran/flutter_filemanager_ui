import 'package:flutter/material.dart';
import '../constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    List<Color> randomColors = [
      Colors.red,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.pink,
      Colors.orange,
      Colors.purple,
      Colors.teal
    ];

    List<String> filenames = [
      "My Files",
      "Projects",
      "Documents",
      "Designs",
      "Downloads",
      "Photos",
      "Videos",
      "Sundal"
    ];
    List<int> fileSize = [190, 150, 234, 165, 345, 532, 689, 244];

    return Scaffold(
      backgroundColor: scaffoldbackgroundColor,
      appBar: AppBar(
        backgroundColor: scaffoldbackgroundColor,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_outlined,
                color: Colors.white,
              ))
        ],
        centerTitle: true,
        title: const Text("Documents",
            style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: deviceWidth * 0.025, vertical: deviceHeight * 0.025),
          child: Column(
            children: [
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: filenames.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(20),
                      height: deviceHeight * 0.025,
                      width: deviceWidth * 0.35,
                      decoration: BoxDecoration(
                          color: innerColor,
                          border: Border(
                              left: BorderSide(color: randomColors[index]),
                              top: BorderSide(color: randomColors[index]),
                              right: BorderSide(color: randomColors[index])),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.file_download,
                            color: randomColors[index],
                            size: 30,
                          ),
                          SizedBox(
                            height: deviceHeight * 0.050,
                          ),
                          Text(
                            filenames[index],
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "${fileSize[index]} files",
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
