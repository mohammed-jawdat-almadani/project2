import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/quote_part.dart';

class SendQuoteSheet extends StatefulWidget {
  final int orderId;
  final bool isAddon;
  final Function({
    required int orderId,
    required String laborCost,
    required int warrantyDays,
    required List<QuotePart> parts,
  }) onSendQuote;
  final Function({
    required int orderId,
    required String laborCost,
    required List<QuotePart> parts,
  })? onSendAddonQuote;

  const SendQuoteSheet({
    super.key,
    required this.orderId,
    this.isAddon = false,
    required this.onSendQuote,
    this.onSendAddonQuote,
  });

  @override
  State<SendQuoteSheet> createState() => _SendQuoteSheetState();
}

class _SendQuoteSheetState extends State<SendQuoteSheet> {
  final _formKey = GlobalKey<FormState>();
  final _laborCostController = TextEditingController(text: '80.00');
  int _selectedWarrantyDays = 30;
  final List<_EditablePart> _parts = [];
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _laborCostController.dispose();
    for (final p in _parts) {
      p.nameController.dispose();
      p.priceController.dispose();
    }
    super.dispose();
  }

  void _addPart() {
    setState(() {
      _parts.add(_EditablePart());
    });
  }

  void _removePart(int index) {
    setState(() {
      _parts[index].nameController.dispose();
      _parts[index].priceController.dispose();
      _parts.removeAt(index);
    });
  }

  Future<void> _pickImage(int index) async {
    final picked = await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    if (picked != null) {
      setState(() {
        _parts[index].image = File(picked.path);
      });
    }
  }

  double _calculateTotal() {
    final labor = double.tryParse(_laborCostController.text.trim()) ?? 0.0;
    double partsTotal = 0.0;
    for (final p in _parts) {
      partsTotal += double.tryParse(p.priceController.text.trim()) ?? 0.0;
    }
    return labor + partsTotal;
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final domainParts = _parts.map((p) {
        return QuotePart(
          name: p.nameController.text.trim(),
          price: p.priceController.text.trim(),
          classification: p.classification,
          localImage: p.image,
        );
      }).toList();

      if (widget.isAddon && widget.onSendAddonQuote != null) {
        widget.onSendAddonQuote!(
          orderId: widget.orderId,
          laborCost: _laborCostController.text.trim(),
          parts: domainParts,
        );
      } else {
        widget.onSendQuote(
          orderId: widget.orderId,
          laborCost: _laborCostController.text.trim(),
          warrantyDays: _selectedWarrantyDays,
          parts: domainParts,
        );
      }

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final total = _calculateTotal();
    final isDark = AppColors.isDark(context);

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
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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

              // Title & Badge
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: widget.isAddon
                              ? (isDark ? const Color(0xFF78350F).withValues(alpha: 0.3) : const Color(0xFFFEF3C7))
                              : (isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.3) : const Color(0xFFEEF2FF)),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          widget.isAddon ? Icons.add_circle_outline_rounded : Icons.request_quote_rounded,
                          color: widget.isAddon ? const Color(0xFFD97706) : AppColors.primary(context),
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.isAddon ? context.tr('send_addon_quote') : context.tr('send_quote_title'),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 12),
              Text(
                widget.isAddon
                    ? (context.isArabic
                        ? 'في حال اكتشاف عطل إضافي أثناء العمل، يمكنك إرسال هذا العرض وسينتظر التطبيق موافقة العميل عليه.'
                        : 'If an unexpected defect is discovered, submit this add-on quote for customer approval.')
                    : (context.isArabic
                        ? 'حدد أجور اليد وقطع الغيار المطلوبة، وسيتلقى العميل إشعاراً فورياً للموافقة والبدء بالعمل.'
                        : 'Specify labor costs and required parts. The customer will be prompted for immediate approval.'),
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary(context), height: 1.4),
              ),

              const SizedBox(height: 16),

              // Labor Cost
              Text(
                '${context.tr('labor_cost')} (${context.tr('currency')})',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.textPrimary(context)),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _laborCostController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (_) => setState(() {}),
                style: TextStyle(color: AppColors.textPrimary(context)),
                decoration: InputDecoration(
                  hintText: '80.00',
                  suffixText: context.tr('currency'),
                  prefixIcon: Icon(Icons.handyman_outlined, size: 20, color: AppColors.primary(context)),
                  filled: true,
                  fillColor: AppColors.inputFill(context),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: AppColors.border(context))),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: AppColors.border(context))),
                ),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) return context.tr('required_field');
                  final n = double.tryParse(val);
                  if (n == null || n < 0) return 'قيمة غير صالحة';
                  return null;
                },
              ),

              if (!widget.isAddon) ...[
                const SizedBox(height: 14),
                // Warranty Days
                Text(
                  context.tr('warranty_days'),
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.textPrimary(context)),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [15, 30, 60, 90].map((days) {
                    final isSelected = _selectedWarrantyDays == days;
                    return Padding(
                      padding: EdgeInsets.only(
                        right: context.isRtl ? 0 : 8.0,
                        left: context.isRtl ? 8.0 : 0,
                      ),
                      child: ChoiceChip(
                        label: Text('$days ${context.tr('day')}'),
                        selected: isSelected,
                        selectedColor: const Color(0xFF003882),
                        backgroundColor: AppColors.inputFill(context),
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : AppColors.textSecondary(context),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        onSelected: (_) => setState(() => _selectedWarrantyDays = days),
                      ),
                    );
                  }).toList(),
                ),
              ],

              const SizedBox(height: 16),
              Divider(color: AppColors.border(context)),
              const SizedBox(height: 10),

              // Parts Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.inventory_2_outlined, size: 18, color: AppColors.primary(context)),
                      const SizedBox(width: 6),
                      Text(
                        context.tr('spare_parts'),
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary(context)),
                      ),
                    ],
                  ),
                  TextButton.icon(
                    onPressed: _addPart,
                    icon: Icon(Icons.add_rounded, size: 16, color: AppColors.primary(context)),
                    label: Text(context.tr('add_part'), style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primary(context))),
                  ),
                ],
              ),

              if (_parts.isEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.inputFill(context),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.border(context)),
                  ),
                  child: Center(
                    child: Text(
                      context.isArabic ? 'لا توجد قطع غيار مضافة (أجور العمل فقط)' : 'No spare parts added (Labor cost only)',
                      style: TextStyle(fontSize: 12, color: AppColors.textSecondary(context)),
                    ),
                  ),
                )
              else
                ..._parts.asMap().entries.map((entry) {
                  final idx = entry.key;
                  final part = entry.value;
                  return _buildPartItem(idx, part);
                }),

              const SizedBox(height: 18),

              // Total Preview Box
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF064E3B).withValues(alpha: 0.3) : const Color(0xFFF0FDF4),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: isDark ? const Color(0xFF059669) : const Color(0xFFBBF7D0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${context.tr('total_quote')}:',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: isDark ? const Color(0xFF6EE7B7) : const Color(0xFF15803D)),
                    ),
                    Text(
                      '${total.toStringAsFixed(2)} ${context.tr('currency')}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? const Color(0xFF6EE7B7) : const Color(0xFF15803D)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _submit,
                  icon: const Icon(Icons.send_rounded, size: 18),
                  label: Text(
                    widget.isAddon ? '${context.tr('send_addon_quote')} 🚀' : '${context.tr('send_quote_btn')} 🚀',
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF003882),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPartItem(int idx, _EditablePart part) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.inputFill(context),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border(context)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: TextFormField(
                  controller: part.nameController,
                  style: TextStyle(color: AppColors.textPrimary(context)),
                  decoration: InputDecoration(
                    hintText: context.tr('part_name_hint'),
                    filled: true,
                    fillColor: AppColors.surface(context),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: AppColors.border(context))),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: AppColors.border(context))),
                  ),
                  validator: (val) => val == null || val.trim().isEmpty ? context.tr('required_field') : null,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: TextFormField(
                  controller: part.priceController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (_) => setState(() {}),
                  style: TextStyle(color: AppColors.textPrimary(context)),
                  decoration: InputDecoration(
                    hintText: context.tr('part_price_hint'),
                    suffixText: context.tr('currency'),
                    filled: true,
                    fillColor: AppColors.surface(context),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: AppColors.border(context))),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: AppColors.border(context))),
                  ),
                  validator: (val) => val == null || val.trim().isEmpty ? context.tr('required_field') : null,
                ),
              ),
              IconButton(
                onPressed: () => _removePart(idx),
                icon: const Icon(Icons.delete_outline_rounded, color: Color(0xFFDC2626), size: 20),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Classification Dropdown
              DropdownButton<String>(
                value: part.classification,
                underline: const SizedBox(),
                dropdownColor: AppColors.surface(context),
                items: [
                  DropdownMenuItem(value: 'standard', child: Text(context.tr('standard_part'), style: TextStyle(fontSize: 12, color: AppColors.textPrimary(context)))),
                  DropdownMenuItem(value: 'original', child: Text(context.tr('original_part'), style: TextStyle(fontSize: 12, color: AppColors.textPrimary(context)))),
                  DropdownMenuItem(value: 'commercial', child: Text(context.tr('commercial_part'), style: TextStyle(fontSize: 12, color: AppColors.textPrimary(context)))),
                ],
                onChanged: (val) {
                  if (val != null) setState(() => part.classification = val);
                },
              ),

              // Image Picker Button
              TextButton.icon(
                onPressed: () => _pickImage(idx),
                icon: Icon(part.image != null ? Icons.check_circle : Icons.camera_alt_outlined, size: 16, color: AppColors.primary(context)),
                label: Text(
                  part.image != null ? 'تم إرفاق صورة ✅' : 'صورة القطعة 📷',
                  style: TextStyle(fontSize: 12, color: AppColors.primary(context)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EditablePart {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  String classification = 'standard';
  File? image;
}
