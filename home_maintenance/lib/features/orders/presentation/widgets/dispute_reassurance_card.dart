import 'package:flutter/material.dart';

class DisputeReassuranceCard extends StatelessWidget {
  const DisputeReassuranceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF2F2),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: const Color(0xFFFECACA), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.shield_outlined, color: Color(0xFFDC2626), size: 22),
              SizedBox(width: 8),
              Text(
                'طلب اعتراض من العميل قيد المراجعة 🛡️',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF991B1B),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'قدم العميل طلب اعتراض عليك وهو الآن قيد المراجعة والتدقيق من قبل فريق الإدارة.\n\nكن على ثقة تامة أننا سنضمن حقك العادل؛ وفي حال كان الحق معك سيتم اعتماد الطلب تلقائياً وفك التجميد عن كامل مستحقاتك في المحفظة 🤝✨',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF7F1D1D),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
