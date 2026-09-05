import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../di/injection.dart';

class AuthenticatedImage extends StatefulWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final bool enableZoomOnTap;

  const AuthenticatedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.enableZoomOnTap = true,
  });

  @override
  State<AuthenticatedImage> createState() => _AuthenticatedImageState();
}

class _AuthenticatedImageState extends State<AuthenticatedImage> {
  static final Map<String, Uint8List> _imageCache = {};

  Uint8List? _imageBytes;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  @override
  void didUpdateWidget(covariant AuthenticatedImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageUrl != widget.imageUrl) {
      _loadImage();
    }
  }

  Future<void> _loadImage() async {
    if (widget.imageUrl.isEmpty) {
      if (mounted) setState(() => _hasError = true);
      return;
    }

    if (_imageCache.containsKey(widget.imageUrl)) {
      if (mounted) {
        setState(() {
          _imageBytes = _imageCache[widget.imageUrl];
          _isLoading = false;
          _hasError = false;
        });
      }
      return;
    }

    try {
      final dio = getIt<Dio>();
      final response = await dio.get<List<int>>(
        widget.imageUrl,
        options: Options(
          responseType: ResponseType.bytes,
          headers: {'Accept': 'image/*'},
          followRedirects: true,
        ),
      );

      if (response.data != null && response.data!.isNotEmpty) {
        final bytes = Uint8List.fromList(response.data!);
        _imageCache[widget.imageUrl] = bytes;
        if (mounted) {
          setState(() {
            _imageBytes = bytes;
            _isLoading = false;
            _hasError = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _isLoading = false;
            _hasError = true;
          });
        }
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _hasError = true;
        });
      }
    }
  }

  void _showZoomDialog(BuildContext context) {
    if (_imageBytes == null) return;

    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.9),
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(12),
        child: Stack(
          alignment: Alignment.center,
          children: [
            InteractiveViewer(
              minScale: 0.5,
              maxScale: 4.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.memory(
                  _imageBytes!,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black45,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.close_rounded, color: Colors.white, size: 28),
                  onPressed: () => Navigator.of(ctx).pop(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (_isLoading) {
      content = Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F5F9),
          borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
        ),
        child: const Center(
          child: SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF003882)),
          ),
        ),
      );
    } else if (_hasError || _imageBytes == null) {
      content = Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F5F9),
          borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
        ),
        child: const Center(
          child: Icon(
            Icons.broken_image_rounded,
            size: 24,
            color: Color(0xFF94A3B8),
          ),
        ),
      );
    } else {
      content = Image.memory(
        _imageBytes!,
        width: widget.width,
        height: widget.height,
        fit: widget.fit,
      );
    }

    if (widget.borderRadius != null) {
      content = ClipRRect(
        borderRadius: widget.borderRadius!,
        child: content,
      );
    }

    if (widget.enableZoomOnTap && _imageBytes != null) {
      return GestureDetector(
        onTap: () => _showZoomDialog(context),
        child: content,
      );
    }

    return content;
  }
}
