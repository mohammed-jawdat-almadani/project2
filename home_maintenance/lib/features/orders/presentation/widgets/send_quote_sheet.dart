import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

  const SendQuoteSheet({
    super.key,
    required this.orderId,
    this.isAddon = false,
    required this.onSendQuote,
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

      widget.onSendQuote(
        orderId: widget.orderId,
        laborCost: _laborCostController.text.trim(),
        warrantyDays: _selectedWarrantyDays,
        parts: domainParts,
      );

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final total = _calculateTotal();

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
                    color: const Color(0xFFE2E8F0),
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
                          color: widget.isAddon ? const Color(0xFFFEF3C7) : const Color(0xFFEEF2FF),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          widget.isAddon ? Icons.add_circle_outline_rounded : Icons.request_quote_rounded,
                          color: widget.isAddon ? const Color(0xFFD97706) : const Color(0xFF003882),
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.isAddon ? 'إرسال عرض إضافي (عطل غير متوقع)' : 'إرسال عرض السعر للعميل',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 12),
              Text(
                widget.isAddon
                    ? 'في حال اكتشاف عطل إضافي أثناء العمل، يمكنك إرسال هذا العرض وسينتظر التطبيق موافقة العميل عليه.'
                    : 'حدد أجور اليد وقطع الغيار المطلوبة، وسيتلقى العميل إشعاراً فورياً للموافقة والبدء بالعمل.',
                style: const TextStyle(fontSize: 12, color: Color(0xFF64748B), height: 1.4),
              ),

              const SizedBox(height: 16),

              // Labor Cost
              const Text(
                'أجور اليد / العمل (ل.س)',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF334155)),
              ),
              const SizedBox(height: 6),
              TextFormField(
                controller: _laborCostController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: '80.00',
                  suffixText: 'ل.س',
                  prefixIcon: const Icon(Icons.handyman_outlined, size: 20, color: Color(0xFF003882)),
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                ),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) return 'يرجى إدخال أجور العمل';
                  final n = double.tryParse(val);
                  if (n == null || n < 0) return 'قيمة غير صالحة';
                  return null;
                },
              ),

              if (!widget.isAddon) ...[
                const SizedBox(height: 14),
                // Warranty Days
                const Text(
                  'مدة الضمان (أيام)',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF334155)),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [15, 30, 60, 90].map((days) {
                    final isSelected = _selectedWarrantyDays == days;
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ChoiceChip(
                        label: Text('$days يوم'),
                        selected: isSelected,
                        selectedColor: const Color(0xFF003882),
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : const Color(0xFF475569),
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
              const Divider(color: Color(0xFFF1F5F9)),
              const SizedBox(height: 10),

              // Parts Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.inventory_2_outlined, size: 18, color: Color(0xFF003882)),
                      SizedBox(width: 6),
                      Text(
                        'قطع الغيار المطلوبة',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                      ),
                    ],
                  ),
                  TextButton.icon(
                    onPressed: _addPart,
                    icon: const Icon(Icons.add_rounded, size: 16, color: Color(0xFF003882)),
                    label: const Text('إضافة قطعة', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF003882))),
                  ),
                ],
              ),

              if (_parts.isEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: const Center(
                    child: Text(
                      'لا توجد قطع غيار مضافة (أجور العمل فقط)',
                      style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
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
                  color: const Color(0xFFF0FDF4),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFBBF7D0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'إجمالي العرض للعميل:',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF15803D)),
                    ),
                    Text(
                      '${total.toStringAsFixed(2)} ل.س',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF15803D)),
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
                    widget.isAddon ? 'إرسال العرض الإضافي للعميل 🚀' : 'إرسال العرض للعميل 🚀',
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
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: TextFormField(
                  controller: part.nameController,
                  decoration: InputDecoration(
                    hintText: 'اسم القطعة (مثال: صمام)',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                  ),
                  validator: (val) => val == null || val.trim().isEmpty ? 'مطلوب' : null,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: TextFormField(
                  controller: part.priceController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: 'السعر',
                    suffixText: 'ل.س',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                  ),
                  validator: (val) => val == null || val.trim().isEmpty ? 'مطلوب' : null,
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
                items: const [
                  DropdownMenuItem(value: 'standard', child: Text('عادي (Standard)', style: TextStyle(fontSize: 12))),
                  DropdownMenuItem(value: 'original', child: Text('أصلي (Original)', style: TextStyle(fontSize: 12))),
                  DropdownMenuItem(value: 'commercial', child: Text('تجاري (Commercial)', style: TextStyle(fontSize: 12))),
                ],
                onChanged: (val) {
                  if (val != null) setState(() => part.classification = val);
                },
              ),

              // Image Picker Button
              TextButton.icon(
                onPressed: () => _pickImage(idx),
                icon: Icon(part.image != null ? Icons.check_circle : Icons.camera_alt_outlined, size: 16, color: const Color(0xFF003882)),
                label: Text(
                  part.image != null ? 'تم إرفاق صورة ✅' : 'صورة القطعة 📷',
                  style: const TextStyle(fontSize: 12, color: Color(0xFF003882)),
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
