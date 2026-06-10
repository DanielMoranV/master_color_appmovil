import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

/// Helpers de presentación compartidos por la lista y el detalle de unidades:
/// etiquetas/colores legibles para los enums y formateo de fechas.

final _dateFormat = DateFormat('dd MMM yyyy', 'es');

String formatDate(DateTime? date) =>
    date == null ? '—' : _dateFormat.format(date.toLocal());

extension SoldUnitStatusUi on SoldUnitStatus {
  String get label => switch (this) {
        SoldUnitStatus.activa => 'Activa',
        SoldUnitStatus.enServicio => 'En servicio',
        SoldUnitStatus.baja => 'De baja',
      };

  Color get color => switch (this) {
        SoldUnitStatus.activa => Colors.green,
        SoldUnitStatus.enServicio => Colors.orange,
        SoldUnitStatus.baja => Colors.grey,
      };
}

extension WarrantyStatusUi on WarrantyStatusEnum {
  String get label => switch (this) {
        WarrantyStatusEnum.vigente => 'Garantía vigente',
        WarrantyStatusEnum.vencida => 'Garantía vencida',
        WarrantyStatusEnum.sinGarantia => 'Sin garantía',
      };

  Color get color => switch (this) {
        WarrantyStatusEnum.vigente => Colors.green,
        WarrantyStatusEnum.vencida => Colors.red,
        WarrantyStatusEnum.sinGarantia => Colors.grey,
      };

  IconData get icon => switch (this) {
        WarrantyStatusEnum.vigente => Icons.verified_outlined,
        WarrantyStatusEnum.vencida => Icons.gpp_bad_outlined,
        WarrantyStatusEnum.sinGarantia => Icons.shield_outlined,
      };
}

/// Miniatura del producto con placeholder cuando no hay imagen o falla la
/// carga. La URL viene absoluta del backend (`image_url`, host S3).
class ProductThumb extends StatelessWidget {
  const ProductThumb({
    super.key,
    required this.imageUrl,
    this.size = 56,
    this.radius = 8,
  });

  final String? imageUrl;
  final double size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    final placeholder = Container(
      width: size,
      height: size,
      color: Colors.grey.shade200,
      child: Icon(Icons.inventory_2_outlined,
          color: Colors.grey, size: size * 0.5),
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: (url == null || url.isEmpty)
          ? placeholder
          : CachedNetworkImage(
              imageUrl: url,
              width: size,
              height: size,
              fit: BoxFit.cover,
              placeholder: (_, _) => placeholder,
              errorWidget: (_, _, _) => placeholder,
            ),
    );
  }
}

/// Pastilla de color con texto, usada para estados y garantía.
class StatusChip extends StatelessWidget {
  const StatusChip({super.key, required this.label, required this.color, this.icon});

  final String label;
  final Color color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
