import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
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
    this.clientName = 'العميل',
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChatBloc>()..add(ChatEvent.init(orderId)),
      child: _ChatView(orderId: orderId, clientName: clientName),
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
      backgroundColor: AppColors.surface(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => SafeArea(
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
                  color: AppColors.border(context),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Text(
                context.isArabic ? 'إرسال صورة في المحادثة' : 'Send Photo in Chat',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary(context),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSourceButton(
                    icon: Icons.camera_alt_rounded,
                    label: context.isArabic ? 'الكاميرا' : 'Camera',
                    color: const Color(0xFF0045A5),
                    onTap: () {
                      Navigator.of(ctx).pop();
                      _pickImage(ImageSource.camera);
                    },
                  ),
                  _buildSourceButton(
                    icon: Icons.photo_library_rounded,
                    label: context.isArabic ? 'المعرض' : 'Gallery',
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
    final period = context.isArabic ? (isAm ? "ص" : "م") : (isAm ? "AM" : "PM");
    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    final isDark = AppColors.isDark(context);

    return Scaffold(
      backgroundColor: AppColors.background(context),
      appBar: AppBar(
        backgroundColor: AppColors.surface(context),
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  context.isRtl ? Icons.arrow_forward_rounded : Icons.arrow_back_rounded,
                  color: AppColors.textPrimary(context),
                  size: 24,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(width: 4),

              // Avatar
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.3) : const Color(0xFFEEF2FF),
                  border: Border.all(color: AppColors.border(context), width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.person_rounded,
                    color: AppColors.primary(context),
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
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary(context),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${context.tr('order_no')}${widget.orderId}',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary(context),
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
                  color: isDark ? const Color(0xFF1E293B) : const Color(0xFFE9EDF5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  context.isArabic ? 'اليوم' : 'Today',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary(context),
                  ),
                ),
              ),

              // Messages List
              Expanded(
                child: state.isLoading && state.messages.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(color: AppColors.primary(context)),
                      )
                    : RefreshIndicator(
                        color: AppColors.primary(context),
                        onRefresh: () async {
                          context.read<ChatBloc>().add(const ChatEvent.poll());
                        },
                        child: state.messages.isEmpty
                            ? _buildEmptyState(context)
                            : ListView.builder(
                                controller: _scrollController,
                                reverse: true,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                itemCount: state.messages.length,
                                itemBuilder: (context, index) {
                                  final message = state.messages[index];
                                  return _buildMessageItem(context, message);
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
                    color: AppColors.surface(context),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.border(context)),
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
                      Text(
                        context.isArabic ? 'صورة جاهزة للإرسال' : 'Image ready to send',
                        style: TextStyle(fontSize: 12, color: AppColors.textSecondary(context), fontWeight: FontWeight.w600),
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
              Container(
                margin: const EdgeInsets.fromLTRB(16, 6, 16, 16),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E293B) : const Color(0xFFECEFF6),
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(color: AppColors.border(context)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Row(
                    children: [
                      // Attachment Button (+)
                      IconButton(
                        icon: Icon(
                          Icons.add_circle_outline_rounded,
                          color: AppColors.primary(context),
                          size: 26,
                        ),
                        onPressed: state.isSending ? null : _showAttachmentSheet,
                      ),

                      // Camera Button
                      IconButton(
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          color: AppColors.textSecondary(context),
                          size: 24,
                        ),
                        onPressed: state.isSending ? null : () => _pickImage(ImageSource.camera),
                      ),

                      // Text Field
                      Expanded(
                        child: TextField(
                          controller: _textController,
                          maxLines: 4,
                          minLines: 1,
                          textInputAction: TextInputAction.send,
                          onSubmitted: (_) => _sendMessage(),
                          textAlign: context.isRtl ? TextAlign.right : TextAlign.left,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textPrimary(context),
                          ),
                          decoration: InputDecoration(
                            hintText: context.isArabic ? 'اكتب رسالة...' : 'Type a message...',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: AppColors.textMuted(context),
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          ),
                        ),
                      ),

                      // Send Action Button
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColors.primary(context),
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
                                  angle: context.isRtl ? math.pi : 0,
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
            ],
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final isDark = AppColors.isDark(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.3) : const Color(0xFFEEF2FF),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.chat_bubble_outline_rounded,
              size: 40,
              color: AppColors.primary(context),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            context.isArabic ? 'لا توجد رسائل سابقة' : 'No previous messages',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary(context),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            context.isArabic
                ? 'يمكنك بدء التواصل مع العميل الآن بخصوص هذا الطلب'
                : 'You can start communicating with the client now regarding this order',
            style: TextStyle(fontSize: 12, color: AppColors.textSecondary(context)),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(BuildContext context, ChatMessage message) {
    final isMine = message.isMine;
    final isDark = AppColors.isDark(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Align(
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
                  color: isMine
                      ? const Color(0xFF0045A5)
                      : (isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F3F9)),
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
                            textAlign: context.isRtl ? TextAlign.right : TextAlign.left,
                            style: TextStyle(
                              fontSize: 14,
                              color: isMine ? Colors.white : AppColors.textPrimary(context),
                              height: 1.4,
                            ),
                          ),
                        ),
                    ]
                    // Pure Text Message
                    else if (message.text != null && message.text!.isNotEmpty)
                      Text(
                        message.text!,
                        textAlign: context.isRtl ? TextAlign.right : TextAlign.left,
                        style: TextStyle(
                          fontSize: 14,
                          color: isMine ? Colors.white : AppColors.textPrimary(context),
                          height: 1.4,
                        ),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 4),

            // External Timestamp Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                _formatTime(message.createdAt),
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.textMuted(context),
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
