import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final FirebaseFirestore _fireStore;
  final FirebaseAuth _auth;

  ChatCubit(this._auth, this._fireStore) : super(ChatLoadingState());

  Future<void> sendMessage(String message, String id) async {
    final userId = _auth.currentUser?.uid;
    await _fireStore.collection('messages').add({
      'userId': userId,
      'text': message,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> receiveChat() async* {
    final Stream<QuerySnapshot> query =
        _fireStore.collection('messages').orderBy('timestamp').snapshots();
    yield* query;
  }

  bool fromMe(String userId) => _auth.currentUser?.uid == userId;
}
