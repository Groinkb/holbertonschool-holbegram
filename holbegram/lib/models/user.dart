import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String postId;
  final String uid;
  final String username;
  final String caption;
  final String postUrl;
  final String profImage;
  final DateTime datePublished;
  final List<dynamic> likes;
  final List<dynamic> comments;

  Post({
    required this.postId,
    required this.uid,
    required this.username,
    required this.caption,
    required this.postUrl,
    required this.profImage,
    required this.datePublished,
    required this.likes,
    required this.comments,
  });

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      postId: snapshot['postId'] ?? '',
      uid: snapshot['uid'] ?? '',
      username: snapshot['username'] ?? '',
      caption: snapshot['caption'] ?? '',
      postUrl: snapshot['postUrl'] ?? '',
      profImage: snapshot['profImage'] ?? '',
      datePublished: (snapshot['datePublished'] as Timestamp).toDate(),
      likes: snapshot['likes'] ?? [],
      comments: snapshot['comments'] ?? [],
    );
  }

  Map<String, dynamic> toJson() => {
        'postId': postId,
        'uid': uid,
        'username': username,
        'caption': caption,
        'postUrl': postUrl,
        'profImage': profImage,
        'datePublished': datePublished,
        'likes': likes,
        'comments': comments,
      };
}
