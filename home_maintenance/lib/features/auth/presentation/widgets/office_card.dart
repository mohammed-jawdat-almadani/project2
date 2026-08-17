import 'package:flutter/material.dart';
import '../../domain/entities/office.dart';

class OfficeCard extends StatelessWidget {
  final Office office;

  const OfficeCard({
    super.key,
    required this.office,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFFDFE5F2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Office Name
          Text(
            office.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 12),
          // Address Row
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Color(0xFF003882),
                size: 22,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  office.address,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF475569),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Phone Row
          Row(
            children: [
              const Icon(
                Icons.phone_outlined,
                color: Color(0xFF003882),
                size: 20,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  office.phone,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF475569),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
