import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'DarkerGrotesque',
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final githubUrl = 'https://www.github.com/developerjamiu';
  final twitterUrl = 'https://www.twitter.com/developerjamiu';
  final instagramUrl = 'https://www.instagram.com/developerjamiu';

  void _goToGithub() async {
    if (await canLaunch(githubUrl)) {
      await launch(githubUrl);
    } else {
      throw 'Could not launch $githubUrl';
    }
  }

  void _goToTwitter() async {
    if (await canLaunch(twitterUrl)) {
      await launch(twitterUrl);
    } else {
      throw 'Could not launch $twitterUrl';
    }
  }

  void _goToInstagram() async {
    if (await canLaunch(instagramUrl)) {
      await launch(instagramUrl);
    } else {
      throw 'Could not launch $instagramUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.blueGrey,
              child: SvgPicture.asset(
                'assets/images/splash_arc.svg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AvatarGlow(
                      endRadius: 70,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade200,
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/me.jpg'),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      color: Colors.white.withOpacity(0.9),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'Jamiu Okanlawon'.toUpperCase(),
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Mobile Development Intern',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text('57, Marina Street, Lagos Island, Lagos'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Column(
                      children: [
                        Card(
                          elevation: 5,
                          child: ListTile(
                            onTap: _goToGithub,
                            title: Text('Github'),
                            subtitle: Text('@developerjamiu'),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                        Card(
                          elevation: 5,
                          child: ListTile(
                            onTap: _goToTwitter,
                            title: Text('Twitter'),
                            subtitle: Text('@developerjamiu'),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                        Card(
                          elevation: 5,
                          child: ListTile(
                            onTap: _goToInstagram,
                            title: Text('Instagram'),
                            subtitle: Text('@developerjamiu'),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
