import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';

class ClosureRequestSheet extends StatefulWidget {
  final int orderId;
  final Function(int orderId, List<File> photos)? onSubmit;
  final Function(int orderId, List<File> photos)? onSubmitPhotos;

  const ClosureRequestSheet({
    super.key,
    required this.orderId,
    this.onSubmit,
    this.onSubmitPhotos,
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
        SnackBar(content: Text(context.isArabic ? 'الحد الأقصى هو 3 صور لإثبات إنجاز العمل' : 'Maximum 3 photos allowed')),
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
        SnackBar(content: Text(context.isArabic ? 'يرجى التقاط صورة واحدة على الأقل لإثبات إتمام الصيانة 📷' : 'Please capture at least one photo 📷')),
      );
      return;
    }
    if (widget.onSubmitPhotos != null) {
      widget.onSubmitPhotos!(widget.orderId, _photos);
    } else if (widget.onSubmit != null) {
      widget.onSubmit!(widget.orderId, _photos);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28.0)),
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
                color: AppColors.border(context),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Title
          Row(
            children: [
              const Icon(Icons.task_alt_rounded, color: Color(0xFF16A34A), size: 24),
              const SizedBox(width: 8),
              Text(
                '${context.tr('finish_and_closure')} 🏁',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary(context),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),
          Text(
            context.isArabic
                ? 'قم بالتقاط (1 إلى 3 صور) لإثبات اكتمال الصيانة بنجاح. سيتم إرسال كود الإغلاق الرقمي للعميل فوراً لتقديمه لك لتأكيد إنهاء الطلب.'
                : 'Take 1 to 3 photos to verify task completion. A closure code will be issued to the client.',
            style: TextStyle(fontSize: 12, color: AppColors.textSecondary(context), height: 1.4),
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
                      margin: EdgeInsets.only(
                        left: context.isRtl ? 10 : 0,
                        right: context.isRtl ? 0 : 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(image: FileImage(file), fit: BoxFit.cover),
                        border: Border.all(color: AppColors.border(context)),
                      ),
                    ),
                    Positioned(
                      top: 2,
                      right: context.isRtl ? 12 : 2,
                      left: context.isRtl ? null : 12,
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
                      color: AppColors.inputFill(context),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.border(context), style: BorderStyle.solid),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_a_photo_outlined, color: AppColors.primary(context), size: 24),
                        const SizedBox(height: 4),
                        Text(
                          context.isArabic ? 'إضافة صورة' : 'Add Photo',
                          style: TextStyle(fontSize: 10, color: AppColors.primary(context), fontWeight: FontWeight.bold),
                        ),
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
              label: Text(
                context.isArabic ? 'إرسال وإصدار كود الإغلاق للعميل 🔐' : 'Submit & Issue Closure Code 🔐',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
