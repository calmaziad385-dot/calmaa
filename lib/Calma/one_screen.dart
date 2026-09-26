import 'package:calma/Calma/two_screen.dart';
import 'package:flutter/material.dart';

class OneScreen extends StatefulWidget {
const OneScreen({super.key});

@override
State<OneScreen> createState() => _OneScreenState();
}

class _OneScreenState extends State<OneScreen>
with SingleTickerProviderStateMixin {
late AnimationController _controller;
late Animation<double> _animation;

@override
void initState() {
super.initState();

// مدة حركة الصورة
_controller = AnimationController(
vsync: this,
duration: const Duration(seconds: 2),
);

_animation = Tween<double>(
begin: 100,
end: 0,
).animate(
CurvedAnimation(
parent: _controller,
curve: Curves.easeOut,
),
);

_controller.forward();

// الانتقال بعد 4 ثواني
Future.delayed(const Duration(seconds: 4), () {
if (mounted) {
Navigator.pushReplacement(
context,
MaterialPageRoute(
builder: (context) => const TwoScreen(),
),
);
}
});
}

@override
void dispose() {
_controller.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
return Scaffold(
body: Container(
width: double.infinity,
height: double.infinity,

decoration: const BoxDecoration(
image: DecorationImage(
image: AssetImage(
"assets/calma/img_22.png",
),
fit: BoxFit.fill,
),
),

child: Center(
child: AnimatedBuilder(
animation: _animation,
builder: (context, child) {
return Transform.translate(
offset: Offset(0, _animation.value),
child: child,
);
},

child: Image.asset(
"assets/calma/img_25.png",
width: 200,
height: 200,
fit: BoxFit.contain,
),

),
),
),
);
}
}
