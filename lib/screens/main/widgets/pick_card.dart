import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickCard extends StatelessWidget {
  const PickCard({super.key});

  Widget _buildCard({required Color color}) {
    Widget child({required bool isFeedback}) => Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: color,
            border: isFeedback ? Border.all(width: 6) : null,
            borderRadius: BorderRadius.circular(4),
          ),
        );

    return Draggable(
      data: color,
      feedback: child(isFeedback: true),
      child: child(isFeedback: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Rxn<Color> rxColor = Rxn();

    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          Expanded(
            child: Obx(() {
              final color = rxColor.value;

              return DragTarget(
                onAcceptWithDetails: (details) {
                  final data = details.data;

                  if (data is Color) {
                    rxColor.value = data;
                  }
                },
                builder: (context, candidateData, rejectedData) {
                  String text = 'Drag & Drop';

                  if (candidateData.isNotEmpty) {
                    text = 'Drop the card!!!';
                  }

                  return Container(
                    decoration: BoxDecoration(
                      color: color,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      text,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCard(color: Colors.red),
                _buildCard(color: Colors.orange),
                _buildCard(color: Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
