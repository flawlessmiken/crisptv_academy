import 'package:flutter/material.dart';

class RoundedStatusContainer extends StatelessWidget {
  final String status;

  const RoundedStatusContainer({super.key, required this.status});

  Color getStatusColor() {
    switch (status.toLowerCase()) {
      case "upcoming":
        return Colors.orange;
      case "ongoing":
        return Colors.green;
      case "ended":
        return Colors.red;
      default:
        return Colors.grey; // Default color if status is not recognized
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: getStatusColor(),
      ),
      child: Text(
        status,
        maxLines: 1,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
