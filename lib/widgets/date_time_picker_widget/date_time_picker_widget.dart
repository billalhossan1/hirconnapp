import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_colors.dart';

class DayTimePickerWidget extends StatelessWidget {
  final String dayName;
  final RxBool isSelected;
  final RxString fromTime;
  final RxString toTime;

  const DayTimePickerWidget({
    super.key,
    required this.dayName,
    required this.isSelected,
    required this.fromTime,
    required this.toTime,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.instance.boxBg,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Day checkbox
                Row(
                  children: [
                    // smaller checkbox: scale down and shrink tap target
                    Transform.scale(
                      scale: 0.88,
                      child: Checkbox(
                        value: isSelected.value,
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        // remove visible border by making side transparent
                        side: BorderSide(color: AppColors.instance.subTextColor, width: 0),
                        // Set fillColor dynamically based on isSelected value
                        fillColor: WidgetStateProperty.all(
                          isSelected.value ? AppColors.instance.primary : Colors.white, // Conditional color based on selection
                        ),
                        activeColor: AppColors.instance.primary,
                        checkColor: Colors.white,
                        onChanged: (value) {
                          isSelected.value = value ?? false;
                        },
                      ),
                    ),

                    CommonText(
                      text: dayName,
                      fontSize: 15.h,
                      textColor: isSelected.value?AppColors.instance.primary:AppColors.instance.subTextColor,
                    ),
                  ],
                ),
                // Time pickers if the day is selected
                if (isSelected.value) ...[
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        CommonText(text: 'From:', fontSize: 15.h),
                        8.width,
                        // Allow dropdown to flex and prevent overflow, but keep its height small
                        Expanded(
                          child: CommonDropDown(
                            backgroundColor: Colors.white,
                            hint: 'select time',
                            items: [
                              '09:00 AM',
                              '10:00 AM',
                              '11:00 AM',
                              '12:00 PM'
                            ],
                            onChanged: (val) {
                              // update the reactive fromTime so UI/state reacts immediately
                              try {
                                fromTime.value = val?.toString() ?? '';
                              } catch (_) {}
                            },
                            nameBuilder: (item) {
                              return item.toString();
                            },
                          ),
                        ),
                        8.width,
                        CommonText(text: 'To:', fontSize: 15.h),
                        8.width,
                        Expanded(
                          child: CommonDropDown(
                            backgroundColor: Colors.white,
                            hint: 'select time',
                            items: [
                              '09:00 AM',
                              '10:00 AM',
                              '11:00 AM',
                              '12:00 PM'
                            ],
                            onChanged: (val) {
                              // update the reactive toTime so UI/state reacts immediately
                              try {
                                toTime.value = val?.toString() ?? '';
                              } catch (_) {}
                            },
                            nameBuilder: (item) {
                              return item.toString();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
    });
  }
}
