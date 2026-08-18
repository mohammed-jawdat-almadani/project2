import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/widgets/authenticated_image.dart';
import '../../domain/entities/chat_message.dart';
import '../bloc/chat_bloc.dart';
import '../bloc/chat_event.dart';
import '../bloc/chat_state.dart';

class ChatPage extends StatelessWidget {
  final int orderId;
  final String clientName;

  const ChatPage({
    super.key,
    required this.orderId,
    this.clientName = 'أحمد محمود',
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChatBloc>()..add(ChatEvent.init(orderId)),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: _ChatView(orderId: orderId, clientName: clientName),
      ),
    );
  }
}

class _ChatView extends StatefulWidget {
  final int orderId;
  final String clientName;

  const _ChatView({
    required this.orderId,
    required this.clientName,
  });

  @override
  State<_ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<_ChatView> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ImagePicker _picker = ImagePicker();
  String? _selectedImagePath;

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final picked = await _picker.pickImage(
        source: source,
        imageQuality: 80,
      );
      if (picked != null) {
        setState(() {
          _selectedImagePath = picked.path;
        });
      }
    } catch (_) {}
  }

  void _showAttachmentSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2E8F0),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const Text(
                  'إرسال صورة في المحادثة',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSourceButton(
                      icon: Icons.camera_alt_rounded,
                      label: 'الكاميرا',
                      color: const Color(0xFF0045A5),
                      onTap: () {
                        Navigator.of(ctx).pop();
                        _pickImage(ImageSource.camera);
                      },
                    ),
                    _buildSourceButton(
                      icon: Icons.photo_library_rounded,
                      label: 'المعرض',
                      color: const Color(0xFF16A34A),
                      onTap: () {
                        Navigator.of(ctx).pop();
                        _pickImage(ImageSource.gallery);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSourceButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 110,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Column(
          children: [
            Icon(icon, size: 30, color: color),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    final text = _textController.text.trim();
    final image = _selectedImagePath;

    if (text.isEmpty && image == null) return;

    context.read<ChatBloc>().add(ChatEvent.sendMessage(
          messageText: text.isNotEmpty ? text : null,
          imagePath: image,
        ));

    _textController.clear();
    setState(() {
      _selectedImagePath = null;
    });
  }

  String _formatTime(DateTime? date) {
    if (date == null) return '';
    final local = date.toLocal();
    int hour = local.hour;
    final minute = local.minute.toString().padLeft(2, '0');
    final isAm = hour < 12;
    if (hour == 0) {
      hour = 12;
    } else if (hour > 12) {
      hour -= 12;
    }
    return '$hour:$minute ${isAm ? "ص" : "م"}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              // Back Button (In RTL points to the right)
              IconButton(
                icon: const Icon(Icons.arrow_forward_rounded, color: Color(0xFF1E293B), size: 24),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(width: 4),

              // Avatar
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFEEF2FF),
                  border: Border.all(color: const Color(0xFFE2E8F0), width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.person_rounded,
                    color: Color(0xFF0045A5),
                    size: 26,
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // User Info (Name & Subtitle)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.clientName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF003882),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'طلب صيانة #${widget.orderId}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocConsumer<ChatBloc, ChatState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.redAccent,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              // Date Pill Header
              Container(
                margin: const EdgeInsets.only(top: 14, bottom: 6),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9EDF5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'اليوم',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF64748B),
                  ),
                ),
              ),

              // Messages List
              Expanded(
                child: state.isLoading && state.messages.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(color: Color(0xFF0045A5)),
                      )
                    : RefreshIndicator(
                        color: const Color(0xFF0045A5),
                        onRefresh: () async {
                          context.read<ChatBloc>().add(const ChatEvent.poll());
                        },
                        child: state.messages.isEmpty
                            ? _buildEmptyState()
                            : ListView.builder(
                                controller: _scrollController,
                                reverse: true, // newest messages at bottom
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                itemCount: state.messages.length,
                                itemBuilder: (context, index) {
                                  final message = state.messages[index];
                                  return _buildMessageItem(message);
                                },
                              ),
                      ),
              ),

              // Image Attachment Preview Bar
              if (_selectedImagePath != null)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(_selectedImagePath!),
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'صورة جاهزة للإرسال',
                        style: TextStyle(fontSize: 12, color: Color(0xFF64748B), fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.cancel_rounded, color: Colors.redAccent),
                        onPressed: () {
                          setState(() {
                            _selectedImagePath = null;
                          });
                        },
                      ),
                    ],
                  ),
                ),

              // Bottom Floating Capsule Input Bar
              // Structured with Left buttons (+, camera), Middle text field, Right send button
              Container(
                margin: const EdgeInsets.fromLTRB(16, 6, 16, 16),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFECEFF6),
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      children: [
                        // Left Attachment Button (+)
                        IconButton(
                          icon: const Icon(
                            Icons.add_circle_outline_rounded,
                            color: Color(0xFF0045A5),
                            size: 26,
                          ),
                          onPressed: state.isSending ? null : _showAttachmentSheet,
                        ),

                        // Left Camera Button (📷)
                        IconButton(
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            color: Color(0xFF475569),
                            size: 24,
                          ),
                          onPressed: state.isSending ? null : () => _pickImage(ImageSource.camera),
                        ),

                        // Middle Arabic Text Field
                        Expanded(
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextField(
                              controller: _textController,
                              maxLines: 4,
                              minLines: 1,
                              textInputAction: TextInputAction.send,
                              onSubmitted: (_) => _sendMessage(),
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF1E293B),
                              ),
                              decoration: const InputDecoration(
                                hintText: 'اكتب رسالة...',
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF94A3B8),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                              ),
                            ),
                          ),
                        ),

                        // Right Send Action Button (Blue Circle)
                        Container(
                          width: 44,
                          height: 44,
                          decoration: const BoxDecoration(
                            color: Color(0xFF0045A5),
                            shape: BoxShape.circle,
                          ),
                          child: state.isSending
                              ? const Center(
                                  child: SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : IconButton(
                                  icon: Transform.rotate(
                                    angle: math.pi, // Rotates send airplane to point forward in Arabic RTL
                                    child: const Icon(
                                      Icons.send_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  onPressed: _sendMessage,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFFEEF2FF),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.chat_bubble_outline_rounded,
              size: 40,
              color: Color(0xFF0045A5),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'لا توجد رسائل سابقة',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'يمكنك بدء التواصل مع العميل الآن بخصوص هذا الطلب',
            style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(ChatMessage message) {
    final isMine = message.isMine;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Align(
        // isMine (Technician / Blue) is aligned to the RIGHT
        // other (Client / Gray) is aligned to the LEFT
        alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Bubble Body
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width * 0.78,
              ),
              child: Container(
                padding: message.hasImage
                    ? const EdgeInsets.all(4)
                    : const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isMine ? const Color(0xFF0045A5) : const Color(0xFFF1F3F9),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(18),
                    topRight: const Radius.circular(18),
                    bottomLeft: Radius.circular(isMine ? 18 : 4),
                    bottomRight: Radius.circular(isMine ? 4 : 18),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    // Image Message
                    if (message.hasImage) ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: AuthenticatedImage(
                          imageUrl: 'https://home-maintenance.me/api/messages/${message.id}/image',
                          width: MediaQuery.sizeOf(context).width * 0.75,
                          height: 200,
                          fit: BoxFit.cover,
                          enableZoomOnTap: true,
                        ),
                      ),
                      if (message.text != null && message.text!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 12, 6),
                          child: Text(
                            message.text!,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 14,
                              color: isMine ? Colors.white : const Color(0xFF1E293B),
                              height: 1.4,
                            ),
                          ),
                        ),
                    ]
                    // Pure Text Message
                    else if (message.text != null && message.text!.isNotEmpty)
                      Text(
                        message.text!,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 14,
                          color: isMine ? Colors.white : const Color(0xFF1E293B),
                          height: 1.4,
                        ),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 4),

            // External Timestamp Row (Right for mine, Left for other)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                _formatTime(message.createdAt),
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF94A3B8),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
