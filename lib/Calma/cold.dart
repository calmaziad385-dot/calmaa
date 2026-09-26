import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Cold extends StatefulWidget {
  const Cold({super.key});

  @override
  State<Cold> createState() => _ColdState();
}

class _ColdState extends State<Cold> {
  int currentIndex = 0;

  final Map<int, ScrollController> _controllers = {};

  final List<Map<String, dynamic>> categories = [
    {
      "title": "قهوة باردة",
      "items": [
        ["أيس أمريكان", "80"],
        ["أيس لاتيه", "80"],
        ["أيس سبانش لاتيه", "90"],
        ["أيس كراميل", "85"],
        ["أيس موكا", "80"],
        ["أيس بندق لاتيه", "85"],
        ["أيس فانيليا لاتيه", "85"],
      ],
    },

    // ================= زيادة =================

    {
      "title": "زبادو",
      "items": [
        ["عسل", "70"],
        ["موز", "70"],
        ["فراولة", "70"],
        ["كيوي", "70"],
        ["مانجو", "70"],
        ["بلوبيري", "70"],
        ["كريز", "70"],
      ],
    },

    // ================= فرابيتشينو =================

    {
      "title": "فرابيتشينو",
      "items": [
        ["فرابيتشينو شوكليت", "90"],
        ["فرابيتشينو فانيليا", "90"],
        ["فرابيتشينو كراميل", "90"],
        ["فرابيتشينو بندق", "90"],
      ],
    },

    // ================= فرابيه =================

    {
      "title": "فرابيه",
      "items": [
        ["فرابيه نوتيلا", "80"],
        ["فرابيه لوتس", "80"],
        ["فرابيه كراميل", "80"],
        ["فرابيه فراولة", "80"],
        ["فرابيه فانيليا", "80"],
        ["فرابيه كريز", "80"],
        ["فرابيه بلوبيري", "80"],
        ["فرابيه بندق", "80"],
      ],
    },

    // ================= عصائر فريش =================

    {
      "title": "عصائر فريش",
      "items": [
        ["مانجو", "65"],
        ["فراولة", "65"],
        ["جوافة", "65"],
        ["برتقال", "60"],
        ["بطيخ", "75"],
        ["بلح بلبن", "75"],
        ["كنتالوب", "70"],
        ["موز بلبن", "70"],
        ["ليمون", "50"],
        ["ليمون نعناع", "55"],
      ],
    },

    // ================= ميكس صودا =================

    {
      "title": "ميكس صودا",
      "items": [
        ["سكوتش منت", "75"],
        ["صن شاين", "75"],
        ["شيري كولا", "75"],
        ["موهيتو", "75"],
        ["ليمونادا استروبري", "75"],
        ["أيس بيري", "75"],
        ["بلو صودا", "75"],
        ["باينابل بيتش (أناناس + مانجو)", "85"],
        ["أيس شيري", "90"],
        ["ريد بول بلوبيري", "100"],
        ["ريد بول موهيتو", "100"],
        ["بلو أورنج", "80"],
        ["بلو لانجري", "80"],
      ],
    },

    // ================= سموزي =================

    {
      "title": "سموزي",
      "items": [
        ["مانجو", "80"],
        ["فراولة", "80"],
        ["ليمون نعناع", "80"],
        ["بطيخ", "80"],
        ["بلوبيري", "80"],
        ["ريد بيري", "80"],
        ["ميكس بيري", "80"],
        ["كولا", "80"],
        ["أناناس", "80"],
        ["تفاح أخضر", "80"],
      ],
    },

    // ================= ميلك شيك =================

    {
      "title": "ميلك شيك",
      "items": [
        ["ميلك شيك شوكليت", "85"],
        ["ميلك شيك فانيليا", "85"],
        ["ميلك شيك كراميل", "85"],
        ["ميلك شيك فراولة", "85"],
        ["ميلك شيك مانجو", "85"],
        ["ميلك شيك أوريو", "90"],
        ["ميلك شيك لوتس", "85"],
        ["ميلك شيك نوتيلا", "85"],
        ["ميلك شيك توينكيز", "90"],
        ["ميلك شيك كريز", "85"],
        ["ميلك شيك كوفي", "85"],
        ["ميلك شيك كوكيز", "90"],
        ["ميلك شيك كيوي", "85"],
        ["ميلك شيك بلوبيري", "85"],
        ["ميلك شيك راسبيري", "85"],
        ["ميلك شيك ميكس بيري", "85"],
        ["ميلك شيك جوز هند", "85"],
      ],
    },

    // ================= سوفت درينك =================

    {
      "title": "سوفت درينك",
      "items": [
        ["مياه معدنية", "10"],
        ["بيبسي", "35"],
        ["سفن أب", "35"],
        ["ميرندا", "35"],
        ["بريل", "50"],
        ["فيروز", "50"],
        ["شويبس", "40"],
        ["ريد بول", "80"],
      ],
    },
  ];

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
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),

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

              const SizedBox(height: 15),

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

                    decoration: BoxDecoration(
                      color: const Color(0xFF795C4B),
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Stack(
                      children: [
                        // ================= CONTENT =================

                        SingleChildScrollView(
                          controller: controller,

                          padding: const EdgeInsets.all(20),

                          child: Column(
                            children: [
                              // ================= TITLE =================

                              Text(
                                title,
                                textAlign: TextAlign.center,

                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 20),

                              // ================= ITEMS =================

                              ...List.generate(
                                items.length,
                                    (itemIndex) {
                                  final item = items[itemIndex];

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),

                                    child: Row(
                                      textDirection: TextDirection.ltr,

                                      children: [
                                        // ================= PRICE =================

                                        Text(
                                          "${item[1]} EGP",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        const SizedBox(width: 10),

                                        // ================= LINE =================

                                        Expanded(
                                          child: Container(
                                            height: 1,
                                            color: Colors.white54,
                                          ),
                                        ),

                                        const SizedBox(width: 12),

                                        // ================= NAME =================

                                        Text(
                                          item[0],
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                        // ================= UP ARROW =================

                        if (controller.hasClients &&
                            controller.offset > 5)
                          Positioned(
                            top: 8,
                            left: 0,
                            right: 0,

                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.all(5),

                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius:
                                  BorderRadius.circular(20),
                                ),

                                child: const Icon(
                                  Icons.keyboard_arrow_up,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),

                        // ================= DOWN ARROW =================

                        if (controller.hasClients &&
                            controller.position.maxScrollExtent >
                                controller.offset + 5)
                          Positioned(
                            bottom: 8,
                            left: 0,
                            right: 0,

                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.all(5),

                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius:
                                  BorderRadius.circular(20),
                                ),

                                child: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
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