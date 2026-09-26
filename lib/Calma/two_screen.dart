import 'package:animate_do/animate_do.dart';
import 'package:calma/Calma/break_fast.dart';
import 'package:calma/Calma/desserts.dart';
import 'package:flutter/material.dart';

import 'cold.dart';
import 'hot.dart';

class TwoScreen extends StatefulWidget {
const TwoScreen({super.key});

@override
State<TwoScreen> createState() => _TwoScreenState();
}

class _TwoScreenState extends State<TwoScreen> {

@override
Widget build(BuildContext context) {
final screenHeight = MediaQuery.of(context).size.height;
final screenWidth = MediaQuery.of(context).size.width;

// حجم الكونتينرات
final cardWidth = screenWidth * 0.43;

// حجم الصور
final imageSize = cardWidth * 0.65;

return Scaffold(
backgroundColor: const Color(0xFFF8F1E9),
body: Stack(
children: [

// =================================================
// BACKGROUND
// =================================================
Positioned.fill(
child: Image.asset(
"assets/calma/img_28.png",
fit: BoxFit.fill,
),
),

// =================================================
// CONTENT
// =================================================
SafeArea(
child: Column(
children: [

// المسافة فوق الكونتينرات
SizedBox(
height: screenHeight * 0.35,
),

// =================================================
// HOT + COLD
// =================================================
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [

// =================================================
// bereak fast
// =================================================
  InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
            const BreakFast()
        ),
      );
    },

    child: ZoomIn(
      child: Container(
        width: cardWidth,
        height: cardWidth,
        constraints: const BoxConstraints(
          minHeight: 130,
          maxHeight: 170,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF795C4B),
          borderRadius:
          BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [

            Image.asset(
              "assets/calma/img_33.png",
              width: imageSize,
              height: imageSize,
              fit: BoxFit.contain,
            ),

            SizedBox(
              height: screenHeight * 0.008,
            ),

            const Text(
              "BreakFast",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight:
                FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),

  ),


SizedBox(
width: screenWidth * 0.04,
),

// ================= COLD DRINKS =================
InkWell(
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => const Cold(),
),
);
},

child: ZoomIn(
  child: Container(
  width: cardWidth,
  height: cardWidth,
  constraints: const BoxConstraints(
  minHeight: 130,
  maxHeight: 170,
  ),
  decoration: BoxDecoration(
  color: const Color(0xFF795C4B),
  borderRadius:
  BorderRadius.circular(20),
  ),
  child: Column(
  mainAxisAlignment:
  MainAxisAlignment.center,
  children: [
  
  Image.asset(
  "assets/calma/img_31.png",
  width: imageSize,
  height: imageSize,
  fit: BoxFit.contain,
  ),
  
  SizedBox(
  height: screenHeight * 0.008,
  ),
  
  const Text(
  "Ice Drinks",
  style: TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontWeight:
  FontWeight.bold,
  ),
  ),
  ],
  ),
  ),
),
),
],
),

// المسافة بين الصف الأول والحلويات
SizedBox(
height: screenHeight * 0.025,
),

// =================================================
// DESSERTS
// =================================================
Row(
  mainAxisAlignment: MainAxisAlignment.center,

  children: [
    // ================= HOT DRINKS =================


    InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
            const HotDrinksPage(),
          ),
        );
      },

      child: ZoomIn(
        child: Container(
          width: cardWidth,
          height: cardWidth,
          constraints: const BoxConstraints(
            minHeight: 130,
            maxHeight: 170,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF795C4B),
            borderRadius:
            BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [

              Image.asset(
                "assets/calma/img_29.png",
                width: 90,
                height: 90,
                fit: BoxFit.contain,
              ),

              SizedBox(
                height: screenHeight * 0.008,
              ),

              const Text(
                "Hot Drinks",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ),

    SizedBox(
      width: screenWidth * 0.04,
    ),

InkWell(
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) =>
const DessertsPage(),
),
);
},

child: ZoomIn(
  child: Container(
  width: cardWidth,
  height: cardWidth,
  constraints: const BoxConstraints(
  minHeight: 130,
  maxHeight: 170,
  ),
  decoration: BoxDecoration(
  color: const Color(0xFF795C4B),
  borderRadius:
  BorderRadius.circular(20),
  ),
  child: Column(
  mainAxisAlignment:
  MainAxisAlignment.center,
  children: [

  Image.asset(
  "assets/calma/img_32.png",
  width: imageSize,
  height: imageSize,
  fit: BoxFit.contain,
  ),

  SizedBox(
  height: screenHeight * 0.008,
  ),

  const Text(
  "Desserts",
  style: TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontWeight:
  FontWeight.bold,
  ),
  ),
  ],
  ),
  ),
),

),




  ],
)
],
),
),
],
),
);
}
}
