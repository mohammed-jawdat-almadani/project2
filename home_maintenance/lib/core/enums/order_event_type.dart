enum OrderEventType {
  created,
  dispatched,
  offerAccepted,
  offerRejected,
  offerExpired,
  appointmentBooked,
  appointmentConfirmed,
  appointmentActivated,
  arrived,
  quoteSent,
  quoteApproved,
  quoteRejected,
  quoteExpired,
  workStarted,
  waitingForParts,
  closureGenerated,
  closureVerified,
  closureAutoCompleted,
  completed,
  disputed,
  disputeResolved,
  fundsHeld,
  fundsReleased,
  refunded,
  canceled,
  expired,
  noShowReported,
  clientNoShowReported,
  noShow,
  technicianWithdrew,
  warrantyClaimed,
  warrantyReassigned,
  substitutePaid,
  substitutePayoutPending,
}

extension OrderEventTypeX on OrderEventType {
  String get value {
    switch (this) {
      case OrderEventType.created:
        return 'created';
      case OrderEventType.dispatched:
        return 'dispatched';
      case OrderEventType.offerAccepted:
        return 'offer_accepted';
      case OrderEventType.offerRejected:
        return 'offer_rejected';
      case OrderEventType.offerExpired:
        return 'offer_expired';
      case OrderEventType.appointmentBooked:
        return 'appointment_booked';
      case OrderEventType.appointmentConfirmed:
        return 'appointment_confirmed';
      case OrderEventType.appointmentActivated:
        return 'appointment_activated';
      case OrderEventType.arrived:
        return 'arrived';
      case OrderEventType.quoteSent:
        return 'quote_sent';
      case OrderEventType.quoteApproved:
        return 'quote_approved';
      case OrderEventType.quoteRejected:
        return 'quote_rejected';
      case OrderEventType.quoteExpired:
        return 'quote_expired';
      case OrderEventType.workStarted:
        return 'work_started';
      case OrderEventType.waitingForParts:
        return 'waiting_for_parts';
      case OrderEventType.closureGenerated:
        return 'closure_generated';
      case OrderEventType.closureVerified:
        return 'closure_verified';
      case OrderEventType.closureAutoCompleted:
        return 'closure_auto_completed';
      case OrderEventType.completed:
        return 'completed';
      case OrderEventType.disputed:
        return 'disputed';
      case OrderEventType.disputeResolved:
        return 'dispute_resolved';
      case OrderEventType.fundsHeld:
        return 'funds_held';
      case OrderEventType.fundsReleased:
        return 'funds_released';
      case OrderEventType.refunded:
        return 'refunded';
      case OrderEventType.canceled:
        return 'canceled';
      case OrderEventType.expired:
        return 'expired';
      case OrderEventType.noShowReported:
        return 'no_show_reported';
      case OrderEventType.clientNoShowReported:
        return 'client_no_show_reported';
      case OrderEventType.noShow:
        return 'no_show';
      case OrderEventType.technicianWithdrew:
        return 'technician_withdrew';
      case OrderEventType.warrantyClaimed:
        return 'warranty_claimed';
      case OrderEventType.warrantyReassigned:
        return 'warranty_reassigned';
      case OrderEventType.substitutePaid:
        return 'substitute_paid';
      case OrderEventType.substitutePayoutPending:
        return 'substitute_payout_pending';
    }
  }

  static OrderEventType? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'created':
        return OrderEventType.created;
      case 'dispatched':
        return OrderEventType.dispatched;
      case 'offer_accepted':
        return OrderEventType.offerAccepted;
      case 'offer_rejected':
        return OrderEventType.offerRejected;
      case 'offer_expired':
        return OrderEventType.offerExpired;
      case 'appointment_booked':
        return OrderEventType.appointmentBooked;
      case 'appointment_confirmed':
        return OrderEventType.appointmentConfirmed;
      case 'appointment_activated':
        return OrderEventType.appointmentActivated;
      case 'arrived':
        return OrderEventType.arrived;
      case 'quote_sent':
        return OrderEventType.quoteSent;
      case 'quote_approved':
        return OrderEventType.quoteApproved;
      case 'quote_rejected':
        return OrderEventType.quoteRejected;
      case 'quote_expired':
        return OrderEventType.quoteExpired;
      case 'work_started':
        return OrderEventType.workStarted;
      case 'waiting_for_parts':
        return OrderEventType.waitingForParts;
      case 'closure_generated':
        return OrderEventType.closureGenerated;
      case 'closure_verified':
        return OrderEventType.closureVerified;
      case 'closure_auto_completed':
        return OrderEventType.closureAutoCompleted;
      case 'completed':
        return OrderEventType.completed;
      case 'disputed':
        return OrderEventType.disputed;
      case 'dispute_resolved':
        return OrderEventType.disputeResolved;
      case 'funds_held':
        return OrderEventType.fundsHeld;
      case 'funds_released':
        return OrderEventType.fundsReleased;
      case 'refunded':
        return OrderEventType.refunded;
      case 'canceled':
        return OrderEventType.canceled;
      case 'expired':
        return OrderEventType.expired;
      case 'no_show_reported':
        return OrderEventType.noShowReported;
      case 'client_no_show_reported':
        return OrderEventType.clientNoShowReported;
      case 'no_show':
        return OrderEventType.noShow;
      case 'technician_withdrew':
        return OrderEventType.technicianWithdrew;
      case 'warranty_claimed':
        return OrderEventType.warrantyClaimed;
      case 'warranty_reassigned':
        return OrderEventType.warrantyReassigned;
      case 'substitute_paid':
        return OrderEventType.substitutePaid;
      case 'substitute_payout_pending':
        return OrderEventType.substitutePayoutPending;
      default:
        return null;
    }
  }
}
