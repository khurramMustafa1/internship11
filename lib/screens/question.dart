import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internshipproject11/screens/Questionseach1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:internshipproject11/models/question.dart';
import 'answer.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final List<QuestionModel> questions = [
    QuestionModel(
      name: "Fareeha Sadaqat",
      time: "30 mins ago",
      question: "I have an issue regarding this vehicle",
      avatarPath: 'assets/images/flutter1.jpg',
      imagePath: [
        'assets/images/trac.jpg',
        'assets/images/trac.jpg',
        'assets/images/trac.jpg',
      ],
    ),
    QuestionModel(
      name: "Muhammad Ali Nizami",
      time: "20 mins ago",
      question: "What is the process of purchasing Vehicle from hardware store?",
      avatarPath: 'assets/images/p2.jpg',
    ),
    QuestionModel(
      name: "Masab Mehmood",
      time: "20 mins ago",
      question: "What is the process of purchasing Vehicle from hardware store?",
      avatarPath: 'assets/images/p3.jpg',
    ),
  ];

  late List<PageController> _pageControllers;

  @override
  void initState() {
    super.initState();
    _pageControllers = List.generate(
      questions.length,
          (_) => PageController(),
    );
  }

  @override
  void dispose() {
    for (var controller in _pageControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "Questions",
            style: TextStyle(
              fontSize: 23.04,
              fontWeight: FontWeight.bold,
              fontFamily: 'Raleway',
              color: Colors.black,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> questionsearch1()));
                }, icon: Icon(Icons.search,color: Color(0xff339D44,),)),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TabBar(
                dividerColor: Colors.white,
                indicator: BoxDecoration(
                  color: Color(0xff339D44),
                  borderRadius: BorderRadius.circular(8),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(height: 38, child: Text("All")),
                  Tab(height: 38, child: Text("Pending")),
                  Tab(height: 38, child: Text("Answered")),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            // All Tab
            ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final q = questions[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    // User info row
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            q.avatarPath,
                            width: 25,
                            height: 25,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  q.name,
                                  style: const TextStyle(
                                    fontSize: 11.11,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Raleway',
                                    color: Color(0xFF292929),
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  q.time,
                                  style: const TextStyle(
                                    fontSize: 9.26,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Raleway',
                                    color: Color(0xFFB4B4B4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const answered(),
                                ),
                              );
                            },
                            child: const Text(
                              "Answer",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Raleway',
                                color: Color(0xFF339D44),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 15.5),

                    // Question text
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        q.question,
                        style: const TextStyle(
                          fontSize: 13.13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway',
                          color: Color(0xFF292929),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Image slider with dot indicator on top of the image
                    if (q.imagePath != null && q.imagePath!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            SizedBox(
                              height: 179,
                              width: double.infinity,
                              child: PageView.builder(
                                controller: _pageControllers[index],
                                itemCount: q.imagePath!.length,
                                itemBuilder: (context, imageIndex) {
                                  return ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      q.imagePath![imageIndex],
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: 179,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              bottom: 15,
                              child: SmoothPageIndicator(
                                controller: _pageControllers[index],
                                count: q.imagePath!.length,
                                effect: const WormEffect(
                                  dotHeight: 8,
                                  dotWidth: 8,
                                  spacing: 8,
                                  dotColor: Colors.white54,
                                  activeDotColor: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    const SizedBox(height: 24),
                  ],
                );
              },
            ),

            // Pending Tab
            const Center(
              child: Text(
                "Pending",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),

            // Answered Tab
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 53),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/answer111.jpg',
                      height: 206,
                      width: 190,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "No Data Found",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23.04,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Raleway",
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "You have not answered any \n questions yet",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Raleway",
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
