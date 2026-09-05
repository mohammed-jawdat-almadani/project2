enum TicketStatus {
  open,
  answered,
  closed,
}

extension TicketStatusX on TicketStatus {
  String get value {
    switch (this) {
      case TicketStatus.open:
        return 'open';
      case TicketStatus.answered:
        return 'answered';
      case TicketStatus.closed:
        return 'closed';
    }
  }

  static TicketStatus? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'open':
        return TicketStatus.open;
      case 'answered':
        return TicketStatus.answered;
      case 'closed':
        return TicketStatus.closed;
      default:
        return null;
    }
  }
}
