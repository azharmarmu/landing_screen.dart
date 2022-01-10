part of 'chat_cubit.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object?> get props => [];
}

class ChatLoadingState extends ChatState {}

class ChatSuccessState extends ChatState {}

class ChatErrorState extends ChatState {}
