import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DessertsPage extends StatefulWidget {
  const DessertsPage({super.key});

  @override
  State<DessertsPage> createState() => _DessertsPageState();
}

class _DessertsPageState extends State<DessertsPage> {
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
    // ================= الحلويات =================

    final desserts = [
      ["تشيز كيك", "85"],
      ["مولتن كيك", "85"],
      ["نوتيلا كيك", "85"],
      ["براوينز كيك", "75"],
      ["مانجو كيك", "85"],
      ["كوفي كيك", "85"],
      ["تويكس تارت", "75"],
      ["تيراميسو", "85"],
      ["سان سبمستيان", "85"],
      ["ريد فيلفت", "85"],
      ["ديسباسيتو", "85"],
      ["كوكيز كيك", "75"],
      ["كيندر كيك", "95"],
    ];

    // ================= أم علي =================

    final omAli = [
      ["أم علي سادة", "65"],
      ["أم علي مكسرات", "80"],
      ["أم علي نوتيلا", "80"],
      ["أم علي فواكة", "80"],
      ["أم علي لوتس", "80"],
      ["أم علي ايس", "75"],
    ];

    // ================= وافل =================

    final waffle = [
      ["وافل نوتيلا", "50", "80"],
      ["وافل وايت أوريو", "60", "100"],
      ["وافل لوتس", "50", "90"],
      ["وافل ميكس شوكليت", "60", "100"],
      ["وافل فواكة", "60", "100"],
      ["وافل ايس", "60", "95"],
      ["وافل فور سيزون", "60", "90"],
    ];

    // ================= ميني بان كيك =================

    final miniPancake = [
      ["سليكشن", "50", "75"],
      ["ميني بان كيك نوتيلا", "50", "70"],
      ["ميني بان كيك وايت اوريو", "50", "70"],
      ["ميني بان كيك لوتس", "50", "70"],
      ["ميني بان كيك بيستاشيو", "60", "90"],
      ["ميني بان كيك كيندر", "60", "90"],
      ["ميني بان كيك\n ميكس شوكليت", "60", "90"],
      ["24\n ميني بان كيك سليكشن", "_", "130"],
    ];
    // ================= الأقسام =================
    final categories = [
      {
        "title": "الحلويات",
        "items": desserts,
        "size": false,
      },
      {
        "title": "أم علي",
        "items": omAli,
        "size": false,
      },
      {
        "title": "وافل",
        "items": waffle,
        "size": true,
      },
      {
        "title": "ميني بان كيك",
        "items": miniPancake,
        "size": true,
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

              // ================= INDICATORS =================

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
                                      // ================= S / L =================

                                      if (hasSize) ...[
                                        Row(
                                          textDirection:
                                          TextDirection.ltr,

                                          children: [
                                            // ================= S =================

                                            SizedBox(
                                              width: 55,

                                              child: Center(
                                                child: Container(
                                                  width: 34,
                                                  height: 34,

                                                  decoration:
                                                  BoxDecoration(
                                                    color:
                                                    const Color(
                                                      0xFF795C4B,
                                                    ),

                                                    shape:
                                                    BoxShape.circle,

                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors
                                                            .black
                                                            .withValues(
                                                          alpha: 0.20,
                                                        ),

                                                        blurRadius: 4,

                                                        offset:
                                                        const Offset(
                                                          0,
                                                          2,
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  child:
                                                  const Center(
                                                    child: Text(
                                                      "S",

                                                      style:
                                                      TextStyle(
                                                        color:
                                                        Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            const SizedBox(
                                              width: 8,
                                            ),

                                            // ================= L =================

                                            SizedBox(
                                              width: 55,

                                              child: Center(
                                                child: Container(
                                                  width: 34,
                                                  height: 34,

                                                  decoration:
                                                  BoxDecoration(
                                                    color:
                                                    const Color(
                                                      0xFF795C4B,
                                                    ),

                                                    shape:
                                                    BoxShape.circle,

                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors
                                                            .black
                                                            .withValues(
                                                          alpha: 0.20,
                                                        ),

                                                        blurRadius: 4,

                                                        offset:
                                                        const Offset(
                                                          0,
                                                          2,
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  child:
                                                  const Center(
                                                    child: Text(
                                                      "L",

                                                      style:
                                                      TextStyle(
                                                        color:
                                                        Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        const SizedBox(
                                          height: 15,
                                        ),
                                      ],

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

                                          // ================= S / L =================

                                          return Padding(
                                            padding:
                                            const EdgeInsets.only(
                                              bottom: 18,
                                            ),

                                            child: Row(
                                              textDirection:
                                              TextDirection.ltr,

                                              children: [
                                                // ================= S PRICE =================

                                                SizedBox(
                                                  width: 55,

                                                  child: Text(
                                                    item[1],

                                                    textAlign:
                                                    TextAlign.center,

                                                    style:
                                                    const TextStyle(
                                                      color:
                                                      Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                    ),
                                                  ),
                                                ),

                                                const SizedBox(
                                                  width: 8,
                                                ),

                                                // ================= L PRICE =================

                                                SizedBox(
                                                  width: 55,

                                                  child: Text(
                                                    item[2].isEmpty
                                                        ? "-"
                                                        : item[2],

                                                    textAlign:
                                                    TextAlign.center,

                                                    style:
                                                    const TextStyle(
                                                      color:
                                                      Colors.white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                    ),
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