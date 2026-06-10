import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/config/env.dart';

/// Resuelve la URL de un adjunto: si es relativa (`/storage/...`) la antepone
/// al host del API; si ya es absoluta la deja igual.
String? resolveAttachmentUrl(String? url) {
  if (url == null || url.isEmpty) return null;
  if (url.startsWith('http://') || url.startsWith('https://')) return url;
  final base = Uri.parse(Env.baseUrl);
  final origin = '${base.scheme}://${base.authority}';
  return url.startsWith('/') ? '$origin$url' : '$origin/$url';
}

bool _isImage(TicketAttachment a) {
  final type = a.fileType?.toLowerCase() ?? '';
  if (type.startsWith('image')) return true;
  final name = a.originalName?.toLowerCase() ?? '';
  return name.endsWith('.jpg') ||
      name.endsWith('.jpeg') ||
      name.endsWith('.png') ||
      name.endsWith('.webp') ||
      name.endsWith('.gif');
}

/// Galería compacta de adjuntos: miniaturas para imágenes (tap → pantalla
/// completa) y chips para otros archivos.
class AttachmentGallery extends StatelessWidget {
  const AttachmentGallery({super.key, required this.attachments});

  final List<TicketAttachment> attachments;

  @override
  Widget build(BuildContext context) {
    if (attachments.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final a in attachments)
            _isImage(a)
                ? _Thumb(attachment: a)
                : _FileChip(attachment: a),
        ],
      ),
    );
  }
}

class _Thumb extends StatelessWidget {
  const _Thumb({required this.attachment});

  final TicketAttachment attachment;

  @override
  Widget build(BuildContext context) {
    final url = resolveAttachmentUrl(attachment.url);
    if (url == null) return const SizedBox.shrink();
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => _FullScreenImage(
            url: url,
            title: attachment.originalName,
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: url,
          width: 88,
          height: 88,
          fit: BoxFit.cover,
          placeholder: (_, _) => const SizedBox(
            width: 88,
            height: 88,
            child: Center(
              child: SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          ),
          errorWidget: (_, _, _) => Container(
            width: 88,
            height: 88,
            color: Colors.grey.shade300,
            child: const Icon(Icons.broken_image_outlined),
          ),
        ),
      ),
    );
  }
}

class _FileChip extends StatelessWidget {
  const _FileChip({required this.attachment});

  final TicketAttachment attachment;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: const Icon(Icons.insert_drive_file_outlined, size: 18),
      label: Text(
        attachment.originalName ?? 'Archivo',
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _FullScreenImage extends StatelessWidget {
  const _FullScreenImage({required this.url, this.title});

  final String url;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: title != null ? Text(title!) : null,
      ),
      body: Center(
        child: InteractiveViewer(
          maxScale: 4,
          child: CachedNetworkImage(
            imageUrl: url,
            fit: BoxFit.contain,
            placeholder: (_, _) =>
                const CircularProgressIndicator(color: Colors.white),
            errorWidget: (_, _, _) =>
                const Icon(Icons.broken_image_outlined, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
