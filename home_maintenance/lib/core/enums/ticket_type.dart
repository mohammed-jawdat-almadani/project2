enum TicketType {
  appIssue,
  financial,
  other,
}

extension TicketTypeX on TicketType {
  String get value {
    switch (this) {
      case TicketType.appIssue:
        return 'app_issue';
      case TicketType.financial:
        return 'financial';
      case TicketType.other:
        return 'other';
    }
  }

  static TicketType? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'app_issue':
        return TicketType.appIssue;
      case 'financial':
        return TicketType.financial;
      case 'other':
        return TicketType.other;
      default:
        return null;
    }
  }
}
