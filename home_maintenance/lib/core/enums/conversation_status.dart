enum ConversationStatus {
  open,
  readOnly,
  closed,
}

extension ConversationStatusX on ConversationStatus {
  String get value {
    switch (this) {
      case ConversationStatus.open:
        return 'open';
      case ConversationStatus.readOnly:
        return 'read_only';
      case ConversationStatus.closed:
        return 'closed';
    }
  }

  static ConversationStatus? fromValue(String? value) {
    if (value == null) return null;
    switch (value) {
      case 'open':
        return ConversationStatus.open;
      case 'read_only':
        return ConversationStatus.readOnly;
      case 'closed':
        return ConversationStatus.closed;
      default:
        return null;
    }
  }
}
