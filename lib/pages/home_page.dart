import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final days = 30;
    final String name = "Abhi";
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Center(
            child: Text(
              "ABCD App",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(
                20.0), //mobile ko 4 kuna ma tassekothiyo,side side ko hatako ani
            child: Column(
              children: [
                Image.asset("assets/abhi1.png"),
                Stack(
                  children: [
                    Image.asset("assets/back_image.jpg"),
                    Container(
                      child: Text(
                        "My name is Abhisekh Khanal, and I am currently in the seventh semester of my Bachelor's in Electronics Communication and Information Engineering. I wanted to share a bit more about myself and my passions.First and foremost, I must say that I absolutely love studying. The world of electronics and communication has always fascinated me. From the very beginning of my academic journey, I knew that this field was the right fit for me. I find joy in exploring the intricacies of electronic circuits, understanding communication protocols, and delving into the realm of information technology. Every new concept I learn feels like unraveling a fascinating mystery, and this excitement drives me to keep learning more.Throughout my time in college, I have actively engaged in my studies. I participate in class discussions, collaborate with classmates on projects, and seek guidance from my professors whenever I face challenges.I believe that asking questions and seeking clarification is crucial to deepening one's knowledge, and I am never hesitant to do so. It fills me with satisfaction to see my hard work pay off in the form of good grades and positive feedback from my instructors.But as much as I love my studies, cricket is my ultimate source of entertainment and joy. I can't imagine a life without the sport. Cricket has been a part of my life for as long as I can remember.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Text(
                    "I believe that asking questions and seeking clarification is crucial to deepening one's knowledge, and I am never hesitant to do so. It fills me with satisfaction to see my hard work pay off in the form of good grades and positive feedback from my instructors.But as much as I love my studies, cricket is my ultimate source of entertainment and joy. I can't imagine a life without the sport. Cricket has been a part of my life for as long as I can remember.",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Text(
                    "From watching nail-biting international matches to cheering for my favorite teams in domestic leagues, cricket has given me countless memorable moments. I find myself immersed in the world of cricket statistics, analyzing player performances, and discussing match strategies with my friends.Beyond being a mere spectator, I have actively played cricket in various settings. Whether it's a friendly match in my neighborhood or representing my college team, being on the cricket field gives me an adrenaline rush like nothing else. ",
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: Text(
                    "The camaraderie with fellow players and the thrill of competition make these experiences unforgettable.Cricket serves as a perfect counterbalance to my academic pursuits. After long hours of studying complex engineering concepts, I find solace in the simplicity and excitement of cricket. It refreshes my mind, recharges my energy, and helps me stay focused and motivated.In conclusion, I take pride in being a dedicated student of Electronics Communication and Information Engineering, and I am immensely passionate about cricket. These two aspects of my life complement each other, making me a more well-rounded individual. I believe that my enthusiasm for learning and my love for cricket define a significant part of who I am, shaping my aspirations for the future and the way I approach life's challenges with determination.",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: MyDrawer(),
      //  appbar ma aaune tripleline wala drawer vaneko
    );
  }
}
