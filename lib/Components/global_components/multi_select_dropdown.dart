import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/global_controllers/multi_select_controller.dart';

class MultiSelectDropdown extends StatelessWidget {
  final MultiSelectController controller = Get.put(MultiSelectController());

   MultiSelectDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label with Selected Count
        Obx(() => Row(
              children: [
                Text(
                  "Key Features",
                  style: TextStyle(
                    fontSize: (14 / 800) * deviceHeight,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: (4 / 360) * deviceWidth),
                Text(
                  "${controller.selectedFeatures.length}",
                  style: TextStyle(
                    fontSize: (12 / 800) * deviceHeight,
                    color: Colors.white,
                  ),
                ),
              ],
            )),

        SizedBox(height: (5 / 800) * deviceHeight),

        // Dropdown Button
        Obx(
          () => GestureDetector(
            onTap: controller.toggleDropdown,
            child: Container(
              width: (332 / 360) * deviceWidth,
              height: (45 / 800) * deviceHeight,
              padding:
                  EdgeInsets.symmetric(horizontal: (10 / 360) * deviceWidth),
              decoration: BoxDecoration(
                color: Color(0xFF2F5B6C),
                borderRadius: BorderRadius.circular((8 / 800) * deviceHeight),
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      controller.selectedFeatures.isEmpty
                          ? "Select Add-ons"
                          : controller.selectedFeatures.join(", "),
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: (12 / 800) * deviceHeight,
                        color: Color(0xFFCCCCCC), // Light Gray
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  AnimatedRotation(
                    turns: controller.isDropdownOpen.value ? 0.5 : 0,
                    duration: Duration(milliseconds: 100),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: (18 / 800) * deviceHeight,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        SizedBox(height: (4 / 800) * deviceHeight),

        // Dropdown Menu
        Obx(
          () => controller.isDropdownOpen.value
              ? Container(
                  width: (332 / 360) * deviceWidth,
                  height: (190 / 800) * deviceHeight,
                  decoration: BoxDecoration(
                    color: Color(0xFF2F5B6C),
                    borderRadius:
                        BorderRadius.circular((6 / 800) * deviceHeight),
                  ),
                  child: Scrollbar(
                    thickness: (4 / 360) * deviceWidth,
                    radius: Radius.circular((4 / 800) * deviceHeight),
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                          vertical: (5 / 800) * deviceHeight),
                      itemCount: controller.availableFeatures.length,
                      separatorBuilder: (_, __) =>
                          SizedBox(height: (4 / 800) * deviceHeight),
                      itemBuilder: (context, index) {
                        String feature = controller.availableFeatures[index];
                        bool isSelected =
                            controller.selectedFeatures.contains(feature);

                        return GestureDetector(
                          onTap: () => controller.selectFeature(feature),
                          child: Container(
                            width: (308 / 360) * deviceWidth,
                            height: (45 / 800) * deviceHeight,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.blue.withOpacity(0.3)
                                  : Color(0xFF2F5B6C),
                              borderRadius: BorderRadius.circular(
                                  (6 / 800) * deviceHeight),
                            ),
                            child: Text(
                              feature,
                              style: TextStyle(
                                fontSize: (14 / 800) * deviceHeight,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              : SizedBox(),
        ),
      ],
    );
  }
}
