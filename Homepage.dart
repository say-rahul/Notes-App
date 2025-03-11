import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes1/Models/smboxes.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Smboxes> smboxes = [];
  int? selectedIndex; // Track selected index

  @override
  void initState() {
    super.initState();
    smboxes = Smboxes.getSmboxes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Searchbar(),
          const SizedBox(height: 10),
          
          smboxes_(),
          const SizedBox(height: 10),
          tasks(),
          const SizedBox(height: 10),
          tbox(),
          const SizedBox(height: 10),
          tbox(),
          const SizedBox(height: 10),
          tbox(),
          const SizedBox(height: 10),
          tbox(),
          const SizedBox(height: 10),

          
        ],
      ),
    );
  }
  Widget tbox() {
  return Container(
    height: 50,
    width: 343,
    decoration: BoxDecoration(
      color: Color(0xFFD9D9D9),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Text(
            "Do home work!!",
            style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
        Positioned(
          left: 15,  // 10px from left
          bottom: 6, // 10px from bottom
          child: Text(
            "06:30",
            style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 10,
            ),
          ),
        ),
      ],
    ),
  );
}





  Widget tasks() {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Tasks",
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  SizedBox smboxes_() {
    return SizedBox(
                height: 40,
                width: double.infinity,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: smboxes.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 10 : 0),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 32,
                          width: 91,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.grey.shade600 : Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.grey.shade400),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                smboxes[index].icon,
                                width: 20,
                                height: 20,
                                fit: BoxFit.contain,
                                colorFilter: ColorFilter.mode(
                                  isSelected ? Colors.white : Colors.black,
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    smboxes[index].name,
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(width: 10),
                ),
              );
  }

  SafeArea Searchbar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 12, right: 12),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0XFFF5F5F5),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SvgPicture.asset(
                  'assets/icons/search.svg',
                  width: 20,
                  height: 20,
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
