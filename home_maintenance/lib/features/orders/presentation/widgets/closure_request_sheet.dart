import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ClosureRequestSheet extends StatefulWidget {
  final int orderId;
  final Function(int orderId, List<File> photos) onSubmit;

  const ClosureRequestSheet({
    super.key,
    required this.orderId,
    required this.onSubmit,
  });

  @override
  State<ClosureRequestSheet> createState() => _ClosureRequestSheetState();
}

class _ClosureRequestSheetState extends State<ClosureRequestSheet> {
  final List<File> _photos = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickPhoto() async {
    if (_photos.length >= 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الحد الأقصى هو 3 صور لإثبات إنجاز العمل')),
      );
      return;
    }
    final picked = await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    if (picked != null) {
      setState(() {
        _photos.add(File(picked.path));
      });
    }
  }

  void _removePhoto(int index) {
    setState(() {
      _photos.removeAt(index);
    });
  }

  void _submit() {
    if (_photos.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى التقاط صورة واحدة على الأقل لإثبات إتمام الصيانة 📷')),
      );
      return;
    }
    widget.onSubmit(widget.orderId, _photos);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.0)),
      ),
      padding: EdgeInsets.fromLTRB(
        20,
        14,
        20,
        MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag Handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFE2E8F0),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Title
          const Row(
            children: [
              Icon(Icons.task_alt_rounded, color: Color(0xFF16A34A), size: 24),
              SizedBox(width: 8),
              Text(
                'إنهاء العمل وطلب كود الإغلاق 🏁',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),
          const Text(
            'قم بالتقاط (1 إلى 3 صور) لإثبات اكتمال الصيانة بنجاح. سيتم إرسال كود الإغلاق الرقمي للعميل فوراً لتقديمه لك لتأكيد إنهاء الطلب.',
            style: TextStyle(fontSize: 12, color: Color(0xFF64748B), height: 1.4),
          ),

          const SizedBox(height: 16),

          // Photo Thumbnails Row
          Row(
            children: [
              ..._photos.asMap().entries.map((entry) {
                final idx = entry.key;
                final file = entry.value;
                return Stack(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(image: FileImage(file), fit: BoxFit.cover),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                      ),
                    ),
                    Positioned(
                      top: 2,
                      right: 12,
                      child: GestureDetector(
                        onTap: () => _removePhoto(idx),
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            color: Color(0xFFDC2626),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.close, size: 14, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                );
              }),

              if (_photos.length < 3)
                GestureDetector(
                  onTap: _pickPhoto,
                  child: Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFCBD5E1), style: BorderStyle.solid),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_a_photo_outlined, color: Color(0xFF003882), size: 24),
                        SizedBox(height: 4),
                        Text('إضافة صورة', style: TextStyle(fontSize: 10, color: Color(0xFF003882), fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 22),

          // Submit Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _submit,
              icon: const Icon(Icons.send_rounded, size: 18),
              label: const Text(
                'إرسال وإصدار كود الإغلاق للعميل 🔐',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF16A34A),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
