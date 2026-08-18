import '../enums/notification_category.dart';
import '../enums/user_role.dart';

/// Comprehensive Enum representing all possible notifications across the entire platform.
enum AppNotificationType {
  // ===================== ORDERS (طلبات الصيانة) =====================
  
  /// (tech · new dispatch offer) طلب صيانة جديد — لديك عرض طلب جديد — أمامك مهلة قصيرة للرد.
  newDispatchOffer(
    code: 'tech.new_dispatch_offer',
    title: 'طلب صيانة جديد',
    body: 'لديك عرض طلب جديد — أمامك مهلة قصيرة للرد.',
    category: NotificationCategory.orders,
    targetRole: UserRole.technician,
    defaultRoute: '/',
  ),

  /// (client · tech accepts offer) تم قبول طلبك — الفني في طريقه إليك الآن.
  techAcceptsOffer(
    code: 'client.tech_accepts_offer',
    title: 'تم قبول طلبك',
    body: 'الفني في طريقه إليك الآن.',
    category: NotificationCategory.orders,
    targetRole: UserRole.client,
    defaultRoute: '/orders',
  ),

  /// (client · arrival marked) وصل الفني — وصل الفني إلى موقعك.
  arrivalMarked(
    code: 'client.arrival_marked',
    title: 'وصل الفني',
    body: 'وصل الفني إلى موقعك.',
    category: NotificationCategory.orders,
    targetRole: UserRole.client,
    defaultRoute: '/orders',
  ),

  /// (client · quote sent) وصل عرض السعر — أرسل الفني عرض سعر لطلبك — راجعه للموافقة أو الرفض.
  quoteSent(
    code: 'client.quote_sent',
    title: 'وصل عرض السعر',
    body: 'أرسل الفني عرض سعر لطلبك — راجعه للموافقة أو الرفض.',
    category: NotificationCategory.orders,
    targetRole: UserRole.client,
    defaultRoute: '/orders',
  ),

  /// (tech · quote approved) تمت الموافقة على العرض — وافق العميل على عرض السعر — يمكنك بدء العمل.
  quoteApproved(
    code: 'tech.quote_approved',
    title: 'تمت الموافقة على العرض',
    body: 'وافق العميل على عرض السعر — يمكنك بدء العمل.',
    category: NotificationCategory.orders,
    targetRole: UserRole.technician,
    defaultRoute: '/orders',
  ),

  /// (tech · quote rejected) تم رفض العرض — رفض العميل عرض السعر.
  quoteRejected(
    code: 'tech.quote_rejected',
    title: 'تم رفض العرض',
    body: 'رفض العميل عرض السعر.',
    category: NotificationCategory.orders,
    targetRole: UserRole.technician,
    defaultRoute: '/orders',
  ),

  /// (client · quote expired) انتهت صلاحية العرض — انتهت مهلة عرض السعر — أصبح الطلب كشفاً فقط.
  quoteExpiredClient(
    code: 'client.quote_expired',
    title: 'انتهت صلاحية العرض',
    body: 'انتهت مهلة عرض السعر — أصبح الطلب كشفاً فقط.',
    category: NotificationCategory.orders,
    targetRole: UserRole.client,
    defaultRoute: '/orders',
  ),

  /// (tech · quote expired) انتهت صلاحية عرضك — لم يوافق العميل على عرض السعر ضمن المهلة.
  quoteExpiredTech(
    code: 'tech.quote_expired',
    title: 'انتهت صلاحية عرضك',
    body: 'لم يوافق العميل على عرض السعر ضمن المهلة.',
    category: NotificationCategory.orders,
    targetRole: UserRole.technician,
    defaultRoute: '/orders',
  ),

  /// (client · waiting for parts) بانتظار قطعة غيار — أوقف الفني العمل مؤقتاً لتأمين قطعة غيار.
  waitingForParts(
    code: 'client.waiting_for_parts',
    title: 'بانتظار قطعة غيار',
    body: 'أوقف الفني العمل مؤقتاً لتأمين قطعة غيار.',
    category: NotificationCategory.orders,
    targetRole: UserRole.client,
    defaultRoute: '/orders',
  ),

  /// (client · resume from parts) استئناف العمل — عاد الفني لاستكمال طلبك.
  resumeFromParts(
    code: 'client.resume_from_parts',
    title: 'استئناف العمل',
    body: 'عاد الفني لاستكمال طلبك.',
    category: NotificationCategory.orders,
    targetRole: UserRole.client,
    defaultRoute: '/orders',
  ),

  /// (client · closure requested) الطلب جاهز للإغلاق — أنهى الفني العمل — شارك رمز الإغلاق معه لإتمام الدفع.
  closureRequested(
    code: 'client.closure_requested',
    title: 'الطلب جاهز للإغلاق',
    body: 'أنهى الفني العمل — شارك رمز الإغلاق معه لإتمام الدفع.',
    category: NotificationCategory.orders,
    targetRole: UserRole.client,
    defaultRoute: '/orders',
  ),

  /// (client · closure verified) اكتمل طلبك — تم إغلاق الطلب بنجاح.
  closureVerified(
    code: 'client.closure_verified',
    title: 'اكتمل طلبك',
    body: 'تم إغلاق الطلب بنجاح.',
    category: NotificationCategory.orders,
    targetRole: UserRole.client,
    defaultRoute: '/orders',
  ),

  /// (tech · order completed) اكتمل الطلب — تم إغلاق الطلب — ستُحرّر مستحقاتك بعد انتهاء فترة الاعتراض.
  orderCompletedTech(
    code: 'tech.order_completed',
    title: 'اكتمل الطلب',
    body: 'تم إغلاق الطلب — ستُحرّر مستحقاتك بعد انتهاء فترة الاعتراض.',
    category: NotificationCategory.orders,
    targetRole: UserRole.technician,
    defaultRoute: '/orders',
  ),

  /// (client · auto-complete) اكتمل طلبك — تم إغلاق الطلب تلقائياً بعد انتهاء مهلة التأكيد.
  autoCompleteClient(
    code: 'client.auto_complete',
    title: 'اكتمل طلبك',
    body: 'تم إغلاق الطلب تلقائياً بعد انتهاء مهلة التأكيد.',
    category: NotificationCategory.orders,
    targetRole: UserRole.client,
    defaultRoute: '/orders',
  ),

  /// (tech · client cancels) أُلغي الطلب — ألغى العميل الطلب.
  clientCancels(
    code: 'tech.client_cancels',
    title: 'أُلغي الطلب',
    body: 'ألغى العميل الطلب.',
    category: NotificationCategory.orders,
    targetRole: UserRole.technician,
    defaultRoute: '/orders',
  ),

  /// (client · tech withdraws) تغيّر الفني — انسحب الفني من طلبك، ونبحث لك عن فني بديل الآن.
  techWithdraws(
    code: 'client.tech_withdraws',
    title: 'تغيّر الفني',
    body: 'انسحب الفني من طلبك، ونبحث لك عن فني بديل الآن.',
    category: NotificationCategory.orders,
    targetRole: UserRole.client,
    defaultRoute: '/orders',
  ),

  /// (tech · dispute opened) نزاع على طلبك — فتح العميل نزاعاً على أحد طلباتك — قيد مراجعة الإدارة.
  disputeOpened(
    code: 'tech.dispute_opened',
    title: 'نزاع على طلبك',
    body: 'فتح العميل نزاعاً على أحد طلباتك — قيد مراجعة الإدارة.',
    category: NotificationCategory.orders,
    targetRole: UserRole.technician,
    defaultRoute: '/orders',
  ),

  /// (client · dispute resolved) تم حسم النزاع — اتخذ المشرف قراراً بشأن النزاع على طلبك.
  disputeResolvedClient(
    code: 'client.dispute_resolved',
    title: 'تم حسم النزاع',
    body: 'اتخذ المشرف قراراً بشأن النزاع على طلبك.',
    category: NotificationCategory.orders,
    targetRole: UserRole.client,
    defaultRoute: '/orders',
  ),

  /// (tech · dispute resolved) تم حسم النزاع — اتخذ المشرف قراراً بشأن النزاع على أحد طلباتك.
  disputeResolvedTech(
    code: 'tech.dispute_resolved',
    title: 'تم حسم النزاع',
    body: 'اتخذ المشرف قراراً بشأن النزاع على أحد طلباتك.',
    category: NotificationCategory.orders,
    targetRole: UserRole.technician,
    defaultRoute: '/orders',
  ),

  /// (client + tech · no-show resolved) تم حسم بلاغ عدم الحضور — راجع المشرف بلاغ عدم الحضور على طلبك وحسمه.
  noShowResolved(
    code: 'common.no_show_resolved',
    title: 'تم حسم بلاغ عدم الحضور',
    body: 'راجع المشرف بلاغ عدم الحضور على طلبك وحسمه.',
    category: NotificationCategory.orders,
    targetRole: UserRole.client,
    defaultRoute: '/orders',
  ),

  /// (client · appointment activated) موعد الصيانة الآن — حان موعد الصيانة المجدول — الفني في طريقه إليك.
  appointmentActivatedClient(
    code: 'client.appointment_activated',
    title: 'موعد الصيانة الآن',
    body: 'حان موعد الصيانة المجدول — الفني في طريقه إليك.',
    category: NotificationCategory.orders,
    targetRole: UserRole.client,
    defaultRoute: '/orders',
  ),

  /// (tech · appointment activated) موعدك الآن — حان موعد طلب مجدول — توجّه إلى موقع العميل.
  appointmentActivatedTech(
    code: 'tech.appointment_activated',
    title: 'موعدك الآن',
    body: 'حان موعد طلب مجدول — توجّه إلى موقع العميل.',
    category: NotificationCategory.orders,
    targetRole: UserRole.technician,
    defaultRoute: '/orders',
  ),

  /// (client · appointment reminder) تذكير بموعد الصيانة — لديك موعد صيانة مجدول قريباً.
  appointmentReminderClient(
    code: 'client.appointment_reminder',
    title: 'تذكير بموعد الصيانة',
    body: 'لديك موعد صيانة مجدول قريباً.',
    category: NotificationCategory.orders,
    targetRole: UserRole.client,
    defaultRoute: '/orders',
  ),

  /// (tech · appointment reminder) تذكير بموعد — لديك موعد طلب مجدول قريباً.
  appointmentReminderTech(
    code: 'tech.appointment_reminder',
    title: 'تذكير بموعد',
    body: 'لديك موعد طلب مجدول قريباً.',
    category: NotificationCategory.orders,
    targetRole: UserRole.technician,
    defaultRoute: '/orders',
  ),

  /// (client · pending order expired) انتهت صلاحية طلبك — تعذّر إيجاد فني متاح، وتم إلغاء الطلب وإعادة رسم الكشف إلى محفظتك.
  pendingOrderExpired(
    code: 'client.pending_order_expired',
    title: 'انتهت صلاحية طلبك',
    body: 'تعذّر إيجاد فني متاح، وتم إلغاء الطلب وإعادة رسم الكشف إلى محفظتك.',
    category: NotificationCategory.orders,
    targetRole: UserRole.client,
    defaultRoute: '/orders',
  ),

  /// (tech · warranty visit booked) زيارة ضمان مجدولة — تمت جدولة زيارة ضمان على أحد طلباتك — يُرجى الالتزام بالموعد.
  warrantyVisitBooked(
    code: 'tech.warranty_visit_booked',
    title: 'زيارة ضمان مجدولة',
    body: 'تمت جدولة زيارة ضمان على أحد طلباتك — يُرجى الالتزام بالموعد.',
    category: NotificationCategory.orders,
    targetRole: UserRole.technician,
    defaultRoute: '/orders',
  ),

  /// (client · warranty reassigned to pool) جارٍ إيجاد فني بديل — تعذّر حضور الفني الأصلي لزيارة الضمان — نبحث لك عن فني بديل دون أي تكلفة إضافية عليك.
  warrantyReassignedToPool(
    code: 'client.warranty_reassigned_to_pool',
    title: 'جارٍ إيجاد فني بديل',
    body: 'تعذّر حضور الفني الأصلي لزيارة الضمان — نبحث لك عن فني بديل دون أي تكلفة إضافية عليك.',
    category: NotificationCategory.orders,
    targetRole: UserRole.client,
    defaultRoute: '/orders',
  ),

  // ===================== FINANCIAL (المعاملات المالية) =====================

  /// (tech · escrow funds released) تم استلام دفعة — تم تحرير مستحقاتك عن الطلب إلى محفظتك.
  escrowFundsReleased(
    code: 'tech.escrow_funds_released',
    title: 'تم استلام دفعة',
    body: 'تم تحرير مستحقاتك عن الطلب إلى محفظتك.',
    category: NotificationCategory.financial,
    targetRole: UserRole.technician,
    defaultRoute: '/wallet',
  ),

  /// (substitute tech · warranty payout) تم استلام دفعة — تم تحرير مستحقاتك عن زيارة الضمان إلى محفظتك.
  warrantyPayout(
    code: 'tech.warranty_payout',
    title: 'تم استلام دفعة',
    body: 'تم تحرير مستحقاتك عن زيارة الضمان إلى محفظتك.',
    category: NotificationCategory.financial,
    targetRole: UserRole.technician,
    defaultRoute: '/wallet',
  ),

  /// (client · deposit approved) تم شحن محفظتك — تمت الموافقة على طلب الشحن وإضافة المبلغ إلى محفظتك.
  depositApproved(
    code: 'client.deposit_approved',
    title: 'تم شحن محفظتك',
    body: 'تمت الموافقة على طلب الشحن وإضافة المبلغ إلى محفظتك.',
    category: NotificationCategory.financial,
    targetRole: UserRole.client,
    defaultRoute: '/wallet',
  ),

  /// (client · deposit rejected) تم رفض طلب الشحن — تعذّر التحقق من إيصال الشحن ولم تتم إضافة أي مبلغ. يُرجى المحاولة مجدداً.
  depositRejected(
    code: 'client.deposit_rejected',
    title: 'تم رفض طلب الشحن',
    body: 'تعذّر التحقق من إيصال الشحن ولم تتم إضافة أي مبلغ. يُرجى المحاولة مجدداً.',
    category: NotificationCategory.financial,
    targetRole: UserRole.client,
    defaultRoute: '/wallet',
  ),

  /// (tech · withdrawal completed) تم تحويل مستحقاتك — تمت معالجة طلب السحب وتحويل المبلغ إليك.
  withdrawalCompleted(
    code: 'tech.withdrawal_completed',
    title: 'تم تحويل مستحقاتك',
    body: 'تمت معالجة طلب السحب وتحويل المبلغ إليك.',
    category: NotificationCategory.financial,
    targetRole: UserRole.technician,
    defaultRoute: '/wallet',
  ),

  /// (tech · withdrawal rejected) تم رفض طلب السحب — تعذّر تنفيذ طلب السحب وتمت إعادة المبلغ إلى رصيدك المتاح.
  withdrawalRejected(
    code: 'tech.withdrawal_rejected',
    title: 'تم رفض طلب السحب',
    body: 'تعذّر تنفيذ طلب السحب وتمت إعادة المبلغ إلى رصيدك المتاح.',
    category: NotificationCategory.financial,
    targetRole: UserRole.technician,
    defaultRoute: '/wallet',
  ),

  // ===================== ADMIN / ACCOUNT (الحساب والإدارة) =====================

  /// (tech · approved) تم اعتماد حسابك — تمت الموافقة على حسابك كفني — يمكنك الآن استقبال الطلبات.
  techApproved(
    code: 'tech.approved',
    title: 'تم اعتماد حسابك',
    body: 'تمت الموافقة على حسابك كفني — يمكنك الآن استقبال الطلبات.',
    category: NotificationCategory.admin,
    targetRole: UserRole.technician,
    defaultRoute: '/',
  ),

  /// (tech · suspended) تم إيقاف حسابك — تم إيقاف حسابك مؤقتاً — تواصل مع الإدارة.
  techSuspended(
    code: 'tech.suspended',
    title: 'تم إيقاف حسابك',
    body: 'تم إيقاف حسابك مؤقتاً — تواصل مع الإدارة.',
    category: NotificationCategory.admin,
    targetRole: UserRole.technician,
    defaultRoute: '/activation',
  ),

  /// (tech · banned) تم حظر حسابك — تم حظر حسابك على المنصة.
  techBanned(
    code: 'tech.banned',
    title: 'تم حظر حسابك',
    body: 'تم حظر حسابك على المنصة.',
    category: NotificationCategory.admin,
    targetRole: UserRole.technician,
    defaultRoute: '/login',
  ),

  /// (tech · promoted from probation) تمت ترقيتك — تمت ترقية حسابك إلى فني نشط — لا قيود على عدد الطلبات اليومية.
  promotedFromProbation(
    code: 'tech.promoted_from_probation',
    title: 'تمت ترقيتك',
    body: 'تمت ترقية حسابك إلى فني نشط — لا قيود على عدد الطلبات اليومية.',
    category: NotificationCategory.admin,
    targetRole: UserRole.technician,
    defaultRoute: '/',
  ),

  /// (platform admin · substitute payout pending, wallet short) محفظة المنصة بحاجة إلى تعبئة
  platformWalletShort(
    code: 'admin.platform_wallet_short',
    title: 'محفظة المنصة بحاجة إلى تعبئة',
    body: 'يوجد مستحق لفني بديل عن زيارة ضمان يتعذّر دفعه — يُرجى تعبئة محفظة المنصة.',
    category: NotificationCategory.admin,
    targetRole: UserRole.client, // or admin
    defaultRoute: '/wallet',
  );

  final String code;
  final String title;
  final String body;
  final NotificationCategory category;
  final UserRole targetRole;
  final String defaultRoute;

  const AppNotificationType({
    required this.code,
    required this.title,
    required this.body,
    required this.category,
    required this.targetRole,
    required this.defaultRoute,
  });

  static AppNotificationType? fromCode(String? code) {
    if (code == null || code.isEmpty) return null;
    final normalized = code.trim().toLowerCase();
    for (final type in AppNotificationType.values) {
      if (type.code.toLowerCase() == normalized) return type;
    }
    return null;
  }

  static AppNotificationType? fromCodeOrContent(String? code, {String? title, String? body}) {
    if (code != null && code.isNotEmpty) {
      final direct = fromCode(code);
      if (direct != null) return direct;

      final normalizedCode = code.trim().toLowerCase();
      for (final type in AppNotificationType.values) {
        if (normalizedCode.contains(type.code.toLowerCase()) ||
            type.code.toLowerCase().contains(normalizedCode)) {
          return type;
        }
      }
    }

    if (title != null && title.isNotEmpty) {
      final cleanTitle = title.trim();
      for (final type in AppNotificationType.values) {
        if (cleanTitle == type.title ||
            cleanTitle.contains(type.title) ||
            type.title.contains(cleanTitle)) {
          return type;
        }
      }
      if (cleanTitle.contains('طلب جديد') ||
          cleanTitle.contains('طلب صيانة') ||
          cleanTitle.contains('عرض طلب')) {
        return AppNotificationType.newDispatchOffer;
      }
    }

    if (body != null && body.isNotEmpty) {
      final cleanBody = body.trim();
      if (cleanBody.contains('عرض طلب جديد') ||
          cleanBody.contains('مهلة قصيرة') ||
          cleanBody.contains('طلب جديد')) {
        return AppNotificationType.newDispatchOffer;
      }
    }

    return null;
  }
}
