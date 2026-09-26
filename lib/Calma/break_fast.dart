import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BreakFast extends StatefulWidget {
  const BreakFast({super.key});

  @override
  State<BreakFast> createState() => _BreakFastState();
}

class _BreakFastState extends State<BreakFast> {
  final Map<int, ScrollController> _controllers = {};

  int currentIndex = 0;

  // ================= SCROLL CONTROLLER =================

  ScrollController _getController(int index) {
    if (!_controllers.containsKey(index)) {
      final controller = ScrollController();

      controller.addListener(() {
        if (mounted) {
          setState(() {});
        }
      });

      _controllers[index] = controller;
    }

    return _controllers[index]!;
  }

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // ================= العناصر =================

    final items = [
      // اكتبي العناصر بتاعتك هنا
      // ["اسم العنصر", "السعر"],

      [ "كرواسون","40"],
      [ "كرواسون calma","85"],
      [ "كرواسون رومي تريكي مدخن","70"],
      [ "كرواسون رومي ساده","50"],
      [ "كرواسون رومي موتزاريلا","60"],
      [ "كرواسون ميكس جبن","55"],

    ];

    // ================= القسم =================

    final categories = [
      {
        "title": "Breakfast",
        "items": items,
        "size": false,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F1E9),

      // ================= APP BAR =================

      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F1E9),
        foregroundColor: const Color(0xFF795C4B),
        elevation: 0,
        toolbarHeight: 70,

        title: const Text(
          "CALMA",
          style: TextStyle(
            fontFamily: "Cinzel",
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
            color: Color(0xFF795C4B),
          ),
        ),

        centerTitle: true,

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Image.asset(
              "assets/calma/img_25.png",
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),

      // ================= BODY =================

      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/calma/img_18.png"),
            fit: BoxFit.fill,
          ),
        ),

        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),

              // ================= INDICATOR =================

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  categories.length,
                      (index) {
                    return AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 300,
                      ),

                      margin: const EdgeInsets.symmetric(
                        horizontal: 4,
                      ),

                      width: currentIndex == index ? 25 : 10,

                      height: 10,

                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? const Color(0xFF795C4B)
                            : const Color(0xFF795C4B)
                            .withValues(alpha: 0.35),

                        borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),

              // ================= CAROUSEL =================

              CarouselSlider.builder(
                itemCount: categories.length,

                itemBuilder: (
                    context,
                    index,
                    realIndex,
                    ) {
                  final category = categories[index];

                  final String title =
                  category["title"] as String;

                  final List items =
                  category["items"] as List;

                  final bool hasSize =
                  category["size"] as bool;

                  final controller =
                  _getController(index);

                  return Container(
                    width: double.infinity,

                    padding: const EdgeInsets.fromLTRB(
                      14,
                      18,
                      8,
                      10,
                    ),

                    decoration: BoxDecoration(
                      color: const Color(0xFF795C4B),

                      borderRadius:
                      BorderRadius.circular(20),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withValues(alpha: 0.15),

                          blurRadius: 8,

                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: Column(
                      children: [

                        // ================= TITLE =================

                        Text(
                          title,

                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 15),

                        // ================= LIST =================

                        Expanded(
                          child: Stack(
                            children: [

                              Scrollbar(
                                controller: controller,

                                thumbVisibility: true,

                                thickness: 4,

                                radius:
                                const Radius.circular(10),

                                child: SingleChildScrollView(
                                  controller: controller,

                                  padding:
                                  const EdgeInsets.only(
                                    right: 10,
                                    bottom: 25,
                                  ),

                                  child: Column(
                                    children: [

                                      // ================= PRODUCTS =================

                                      ...items.map(
                                            (item) {

                                          // ================= NORMAL =================

                                          if (!hasSize) {
                                            return Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                bottom: 18,
                                              ),

                                              child: Row(
                                                textDirection:
                                                TextDirection.ltr,

                                                children: [

                                                  // ================= PRICE =================

                                                  Text(
                                                    "${item[1]} EGP",

                                                    style:
                                                    const TextStyle(
                                                      color:
                                                      Colors.white,
                                                      fontSize: 13,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                    ),
                                                  ),

                                                  const SizedBox(
                                                    width: 10,
                                                  ),

                                                  // ================= LINE =================

                                                  Expanded(
                                                    child: Container(
                                                      height: 1,

                                                      color:
                                                      Colors.white70,
                                                    ),
                                                  ),

                                                  const SizedBox(
                                                    width: 10,
                                                  ),

                                                  // ================= NAME =================

                                                  Text(
                                                    item[0],

                                                    textAlign:
                                                    TextAlign.right,

                                                    textDirection:
                                                    TextDirection.rtl,

                                                    style:
                                                    const TextStyle(
                                                      color:
                                                      Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }

                                          return const SizedBox();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // ================= UP ARROW =================

                              if (controller.hasClients &&
                                  controller.offset > 5)
                                Positioned(
                                  top: 0,
                                  right: 0,

                                  child: Container(
                                    width: 25,
                                    height: 25,

                                    decoration: BoxDecoration(
                                      color: const Color(
                                        0xFF795C4B,
                                      ).withValues(alpha: 0.9),

                                      shape: BoxShape.circle,
                                    ),

                                    child: const Icon(
                                      Icons.keyboard_arrow_up,

                                      color: Colors.white,

                                      size: 20,
                                    ),
                                  ),
                                ),

                              // ================= DOWN ARROW =================

                              if (controller.hasClients &&
                                  controller.position.maxScrollExtent >
                                      5 &&
                                  controller.offset <
                                      controller.position.maxScrollExtent -
                                          5)
                                Positioned(
                                  bottom: 0,
                                  right: 0,

                                  child: Container(
                                    width: 25,
                                    height: 25,

                                    decoration: BoxDecoration(
                                      color: const Color(
                                        0xFF795C4B,
                                      ).withValues(alpha: 0.9),

                                      shape: BoxShape.circle,
                                    ),

                                    child: const Icon(
                                      Icons.keyboard_arrow_down,

                                      color: Colors.white,

                                      size: 20,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },

                // ================= OPTIONS =================

                options: CarouselOptions(
                  height: 600,

                  viewportFraction: 0.82,

                  initialPage: 0,

                  enableInfiniteScroll: false,

                  enlargeCenterPage: true,

                  enlargeFactor: 0.15,

                  autoPlay: false,

                  scrollDirection: Axis.horizontal,

                  scrollPhysics:
                  const BouncingScrollPhysics(),

                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}