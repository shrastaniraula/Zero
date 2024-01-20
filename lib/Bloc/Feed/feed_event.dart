part of 'feed_bloc.dart';

sealed class FeedEvent extends Equatable {
  const FeedEvent();

  @override
  List<Object> get props => [];
}

class FeedRequested extends FeedEvent {}

class CreatePost extends FeedEvent {}

class GetPostsByUserId extends FeedEvent {
  final String userId;
  const GetPostsByUserId({required this.userId});
  //  @override
  // List<Object?> get props => [userId];
}

class CreateCmt extends FeedEvent {}

class GetCmtOfPost extends FeedEvent {
  final int postId;
  const GetCmtOfPost({required this.postId});
}
