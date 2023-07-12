import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zenzone/screens/audioscreen.dart';
import 'package:zenzone/utils/size_config.dart';
import 'package:zenzone/utils/song.dart';
import 'package:zenzone/utils/theme.dart';
import 'package:zenzone/utils/userdata.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);
    List<Song> songs = Song.songs; 

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: blacktheme, width: 0.5)),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hey ${userData.firstName}",
              style: regularTextStyle.copyWith(
                fontSize: getProportionateScreenHeight(20),
                color: blacktheme,
              ),
            ),
            Text(
              "Mindful Bliss Awaits",
              style: lightTextStyle.copyWith(
                fontSize: getProportionateScreenHeight(10),
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(10),
          horizontal: getProportionateScreenWidth(15),
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: getProportionateScreenWidth(200),
            childAspectRatio: 2.5/3,
            crossAxisSpacing: getProportionateScreenWidth(15),
            mainAxisSpacing: getProportionateScreenHeight(15)
          ),
          itemCount: songs.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AudioScreen(song: songs[index]))
                );
              },
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(songs[index].imagePath),
                        fit: BoxFit.fill
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: blacktheme.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: getProportionateScreenHeight(50),
                    margin: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(10),
                      getProportionateScreenHeight(0),
                      getProportionateScreenWidth(10),
                      getProportionateScreenHeight(10) 
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.8)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              songs[index].title,
                              style: semiboldTextStyle.copyWith(fontSize: getProportionateScreenHeight(12)),
                            ),
                          ),
                          Icon(Icons.play_circle, color: blacktheme.withOpacity(0.5),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        )
      ),
    );
  }
}