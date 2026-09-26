import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HotDrinksPage extends StatefulWidget {
  const HotDrinksPage({super.key});

  @override
  State<HotDrinksPage> createState() => _HotDrinksPageState();
}

class _HotDrinksPageState extends State<HotDrinksPage> {
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
    // ================= المشروبات الساخنة =================

    final hotDrinks = [
      ["شاي", "20"],
      ["شاي لاتيه", "55"],
      ["نسكافية", "60"],
      ["نسكافية بلاك", "60"],
      ["نسكافية لوتس", "60"],
      ["هوت سيدر", "60"],
      ["هوت شوكليت", "60"],
      ["سحلب سادة", "50"],
      ["سحلب مكسرات", "60"],
      ["أعشاب", "30"],
    ];

    // ================= القهوة =================

    final coffee = [
      ["قهوة تركي سنجل", "35"],
      ["قهوة تركي دبل", "45"],
      ["قهوة فرنساوي", "55"],
      ["قهوة بندق", "55"],
      ["قهوة فانيليا", "55"],
      ["قهوة كراميل", "55"],
      ["قهوة نوتيلا", "55"],
    ];

    // ================= الإسبريسو =================

    final espresso = [
      ["أسبريسو سنجل", "50"],
      ["أسبريسو دبل", "60"],
      ["أمريكان كوفي", "70"],
      ["كابتشينو", "85ٍ"],
      ["كافية لاتيه", "85ٍ"],
      ["كافية موكا", "85ٍ"],
    ];

    // ================= الأقسام =================

    final categories = [
      {
        "title": "المشروبات الساخنة",
        "items": hotDrinks,
      },
      {
        "title": "القهوة",
        "items": coffee,
      },
      {
        "title": "إسبريسو",
        "items": espresso,
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

        // ================= PAGE SCROLL =================

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

                      width: currentIndex == index
                          ? 25
                          : 10,

                      height: 10,

                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? const Color(0xFF795C4B)
                            : const Color(0xFF795C4B)
                            .withValues(alpha: 0.35),

                        borderRadius:
                        BorderRadius.circular(5),
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

                  final controller =
                  _getController(index);

                  return Container(
                    width: double.infinity,

                    padding:
                    const EdgeInsets.fromLTRB(
                      14,
                      18,
                      8,
                      10,
                    ),

                    decoration: BoxDecoration(
                      color:
                      const Color(0xFF795C4B),

                      borderRadius:
                      BorderRadius.circular(20),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withValues(alpha: 0.15),

                          blurRadius: 8,

                          offset:
                          const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: Column(
                      children: [
                        // ================= TITLE =================

                        Text(
                          title,
                          textAlign: TextAlign.center,

                          style:
                          const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 15),

                        // ================= ITEMS =================

                        SizedBox(
                          height: 500,

                          child: Stack(
                            children: [
                              Scrollbar(
                                controller:
                                controller,

                                thumbVisibility: true,

                                thickness: 4,

                                radius:
                                const Radius.circular(
                                  10,
                                ),

                                child:
                                SingleChildScrollView(
                                  controller:
                                  controller,

                                  padding:
                                  const EdgeInsets
                                      .only(
                                    right: 10,
                                    bottom: 25,
                                  ),

                                  child: Column(
                                    children: [
                                      ...items.map(
                                            (item) {
                                          return Padding(
                                            padding:
                                            const EdgeInsets
                                                .only(
                                              bottom: 18,
                                            ),

                                            child: Row(
                                              textDirection:
                                              TextDirection
                                                  .ltr,

                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .center,

                                              children: [
                                                // ================= PRICE =================

                                                Text(
                                                  "${item[1]} EGP",

                                                  style:
                                                  const TextStyle(
                                                    color:
                                                    Colors.white,
                                                    fontSize:
                                                    13,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                  ),
                                                ),

                                                const SizedBox(
                                                  width: 10,
                                                ),

                                                // ================= LINE =================

                                                Expanded(
                                                  child:
                                                  Container(
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
                                                    fontSize:
                                                    14,
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

                                    decoration:
                                    BoxDecoration(
                                      color:
                                      const Color(
                                        0xFF795C4B,
                                      ).withValues(
                                        alpha: 0.9,
                                      ),

                                      shape:
                                      BoxShape.circle,
                                    ),

                                    child: const Icon(
                                      Icons
                                          .keyboard_arrow_up,

                                      color:
                                      Colors.white,

                                      size: 20,
                                    ),
                                  ),
                                ),

                              // ================= DOWN ARROW =================

                              if (controller.hasClients &&
                                  controller.position
                                      .maxScrollExtent >
                                      5 &&
                                  controller.offset <
                                      controller.position
                                          .maxScrollExtent -
                                          5)
                                Positioned(
                                  bottom: 0,
                                  right: 0,

                                  child: Container(
                                    width: 25,
                                    height: 25,

                                    decoration:
                                    BoxDecoration(
                                      color:
                                      const Color(
                                        0xFF795C4B,
                                      ).withValues(
                                        alpha: 0.9,
                                      ),

                                      shape:
                                      BoxShape.circle,
                                    ),

                                    child: const Icon(
                                      Icons
                                          .keyboard_arrow_down,

                                      color:
                                      Colors.white,

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

                // ================= CAROUSEL OPTIONS =================

                options: CarouselOptions(
                  height: 600,

                  viewportFraction: 0.82,

                  initialPage: 0,

                  enableInfiniteScroll: false,

                  enlargeCenterPage: true,

                  enlargeFactor: 0.15,

                  autoPlay: false,

                  scrollDirection:
                  Axis.horizontal,

                  scrollPhysics:
                  const BouncingScrollPhysics(),

                  onPageChanged:
                      (index, reason) {
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