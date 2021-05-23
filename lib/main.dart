import 'package:flutter/material.dart';
import 'package:flutter_provider/gender_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GenderProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<GenderProvider>(
                  builder: (context, genderProvider, _) => Text(
                    "Gender Picker",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: genderProvider.color),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Consumer<GenderProvider>(
                        builder: (context, genderProvider, _) =>
                            GestureDetector(
                          onTap: () {
                            genderProvider.isMale = true;
                          },
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: genderProvider.colorMale),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icon_male.png',
                                  height: 80,
                                  color: genderProvider.colorMale,
                                ),
                                Text(
                                  "Male",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: genderProvider.colorMale),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Consumer<GenderProvider>(
                        builder: (context, genderProvider, _) =>
                            GestureDetector(
                          onTap: () {
                            genderProvider.isMale = false;
                          },
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: genderProvider.colorFemale),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icon_female.png',
                                  height: 80,
                                  color: genderProvider.colorFemale,
                                ),
                                Text(
                                  "Female",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: genderProvider.colorFemale),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
