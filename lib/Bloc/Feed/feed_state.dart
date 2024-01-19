part of 'feed_bloc.dart';

sealed class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

final class FeedInitial extends FeedState {}

class FeedLoading extends FeedState {}

class FeedLoaded extends FeedState {
  final List<Post> posts;
  const FeedLoaded({required this.posts});
  @override
  List<Object> get props => [posts];
}

class FeedError extends FeedState {
  final String message;
  const FeedError({required this.message});
  @override
  List<Object> get props => [message];
}

class PostError extends FeedState {
  final String message;
  const PostError({required this.message});
  @override
  List<Object> get props => [message];
}

class CmtError extends FeedState {
  final String message;
  const CmtError({required this.message});
  @override
  List<Object> get props => [message];
}

// class CmtLoaded extends FeedState {
//   final List<AvaterForCmt> avaterForCmts;
//   const CmtLoaded({required this.avaterForCmts});
//   @override
//   List<Object> get props => [avaterForCmts];
// }
