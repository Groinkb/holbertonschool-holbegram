import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:holbegram/screens/auth/methods/user_storege.dart';
import 'package:uuid/uuid.dart';

class PostStorage {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final UserStorege _userStorege = UserStorege();

  Future<String> uploadPost(
    String caption,
    String uid,
    String username,
    String profImage,
    Uint8List image,
  ) async {
    String res = "Error";
    try {
      // Upload image to Cloudinary and get URL
      Map<String, dynamic> imageData =
          await _userStorege.uploadImageToCloudinary(image);

      // Get image URL and public ID
      String photoUrl = imageData['secure_url'];
      String publicId = imageData['public_id'];

      // Generate a unique post ID
      String postId = const Uuid().v1();

      // Create post document
      await _firestore.collection('posts').doc(postId).set({
        'caption': caption,
        'uid': uid,
        'username': username,
        'postId': postId,
        'datePublished': DateTime.now(),
        'postUrl': photoUrl,
        'profImage': profImage,
        'likes': [],
        'publicId': publicId,
      });

      res = "Ok";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<void> deletePost(String postId, String publicId) async {
    try {
      // Delete post document from Firestore
      await _firestore.collection('posts').doc(postId).delete();

      // Delete image from Cloudinary
      await _userStorege.deleteImageFromCloudinary(publicId);
    } catch (e) {
      throw Exception('Failed to delete post: $e');
    }
  }
}
