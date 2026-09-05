import 'app_notification_type.dart';

class AppNotificationPayload {
  final String? id;
  final AppNotificationType? type;
  final String title;
  final String body;
  final int? orderId;
  final int? offerId;
  final int? appointmentId;
  final int? disputeId;
  final int? depositId;
  final int? withdrawalId;
  final Map<String, dynamic> rawData;
  final DateTime receivedAt;

  AppNotificationPayload({
    this.id,
    this.type,
    required this.title,
    required this.body,
    this.orderId,
    this.offerId,
    this.appointmentId,
    this.disputeId,
    this.depositId,
    this.withdrawalId,
    this.rawData = const {},
    DateTime? receivedAt,
  }) : receivedAt = receivedAt ?? DateTime.now();

  factory AppNotificationPayload.fromMap(Map<String, dynamic> data, {String? defaultTitle, String? defaultBody}) {
    final typeCode = data['type'] as String? ?? data['event'] as String?;
    final titleCandidate = data['title'] as String? ?? defaultTitle;
    final bodyCandidate = data['body'] as String? ?? defaultBody;

    final notificationType = AppNotificationType.fromCodeOrContent(
      typeCode,
      title: titleCandidate,
      body: bodyCandidate,
    );

    final title = titleCandidate ??
        notificationType?.title ??
        'إشعار جديد';

    final body = bodyCandidate ??
        notificationType?.body ??
        '';

    final orderId = _parseInt(data['order_id']);
    final offerId = _parseInt(data['offer_id']);
    final appointmentId = _parseInt(data['appointment_id']);
    final disputeId = _parseInt(data['dispute_id']);
    final depositId = _parseInt(data['topup_id'] ?? data['deposit_id']);
    final withdrawalId = _parseInt(data['withdrawal_id']);

    return AppNotificationPayload(
      id: data['id']?.toString(),
      type: notificationType,
      title: title,
      body: body,
      orderId: orderId,
      offerId: offerId,
      appointmentId: appointmentId,
      disputeId: disputeId,
      depositId: depositId,
      withdrawalId: withdrawalId,
      rawData: data,
    );
  }

  static int? _parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    return int.tryParse(value.toString());
  }
}
