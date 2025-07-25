import 'package:flutter/material.dart';

import '../../../theme/theme_helper.dart';

class CustomStepper extends StatelessWidget {
  final int currentStep;

  const CustomStepper({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    List<String> steps = [
      'Company Info',
      'Certificates',
      'Signatory',
      'Location',
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(steps.length, (index) {
        bool isCompleted = index < currentStep;
        bool isCurrent = index == currentStep;

        return Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  if (index != 0)
                    Expanded(
                      child: Container(
                        height: 2,
                        color:
                            isCompleted ? Colors.green : Colors.grey.shade400,
                      ),
                    ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          isCompleted
                              ? Colors.green
                              : isCurrent
                              ? Colors.white
                              : Colors.grey.shade400,
                      border: Border.all(
                        color:
                            isCurrent
                                ? ThemeHelper().appColor
                                : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                  if (index != steps.length - 1)
                    Expanded(
                      child: Container(
                        height: 2,
                        color:
                            (index < currentStep - 1)
                                ? Colors.green
                                : Colors.grey.shade400,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                steps[index],
                style: TextStyle(
                  fontSize: 12,
                  color: isCompleted || isCurrent ? Colors.black : Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      }),
    );
  }
}
