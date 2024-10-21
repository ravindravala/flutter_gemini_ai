class Message {
  MessageType type;
  String? text;

  Message({required this.type, this.text});
}

enum MessageType { answer, question }
