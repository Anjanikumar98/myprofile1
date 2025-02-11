import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../Controllers/D1CM6_controllers/trainer_list_controller.dart';

class TrainerListContainer extends StatefulWidget {
  const TrainerListContainer({super.key});

  @override
  State<TrainerListContainer> createState() => _TrainerListContainerState();
}

class _TrainerListContainerState extends State<TrainerListContainer> {
  final _membershipJoiningController = Get.put(MembershipJoiningUpdates());

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: Container(
            width: (342 / 360) * deviceWidth,
            height: (354 / 800) *
                deviceHeight, // Increased height to fit SVG below list
            padding: EdgeInsets.symmetric(
              horizontal: (8 / 360) * deviceWidth,
              vertical: (8 / 800) * deviceHeight,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF55A6C4).withOpacity(0.3),
            ),
            child: Column(
              children: [
                // List of Trainer Tiles
                ...List.generate(3, (index) => _buildTrainerTile(index)),

                // SVG Image Below the List
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: (18 / 360) * deviceWidth,
                    //vertical: (8 / 800) *deviceHeight
                  ),
                  child: SvgPicture.asset(
                    'assets/images/Devider2.svg', // Change to your SVG path
                    height: (50 / 800) * deviceHeight, // Adjust size
                    width: (100 / 360) * deviceWidth,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTrainerTile(int index) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: (326 / 360) * deviceWidth,
      margin: EdgeInsets.symmetric(vertical: (4 / 800) * deviceHeight),
      padding: EdgeInsets.symmetric(vertical: (10 / 800) * deviceHeight),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF55A6C4), width: 1.5),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: (20 / 360) * deviceWidth),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SvgPicture.asset(
                _membershipJoiningController.images[index],
                height: 40,
                width: 40,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      _membershipJoiningController.Tname[index],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Barlow Semi Condensed',
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          _membershipJoiningController.designation[index],
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(width: 5),
                      SvgPicture.asset('assets/images/Devider.svg'),
                      const SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          _membershipJoiningController.Strength[index],
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                            color: Color(0xFFB8FE22),
                            decoration: TextDecoration.none,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
