part of 'page_state_cubit.dart';

@immutable
sealed class PageStateState {}

final class PageStateInitial extends PageStateState {}

final class PageStatePostView extends PageStateState {
  Post? selectedPost;

  PageStatePostView({required this.selectedPost});
}

final class PageStateFeedView extends PageStateState {}
