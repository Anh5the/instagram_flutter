import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String notificationId;
  final String postId;
  final String username;
  final String notificationType;
  final bool read;
  final DateTime timestamp;

  NotificationModel({
    required this.notificationId,
    required this.postId,
    required this.username,
    required this.notificationType,
    required this.read,
    required this.timestamp,
  });

  factory NotificationModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return NotificationModel(
      notificationId: snapshot.id,
      postId: data['postId'],
      username: data['username'],
      notificationType: data['notificationType'],
      read: data['read'],
      timestamp: data['timestamp']?.toDate() ?? DateTime.now(),
    );
  }
}
