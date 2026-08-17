import 'package:flutter/material.dart';
import '../../domain/entities/activation_center.dart';

class ActivationCenterCard extends StatelessWidget {
  final ActivationCenter center;

  const ActivationCenterCard({super.key, required this.center});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFEBEBF0), // Light grey/blue background from image
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            center.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  center.address,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.location_on_outlined,
                color: Color(0xFF002D84), // The dark blue color
                size: 24,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Text(
                  center.phone,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.phone_outlined,
                color: Color(0xFF002D84),
                size: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
