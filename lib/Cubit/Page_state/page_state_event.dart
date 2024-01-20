part of 'page_state_cubit.dart';

abstract class PageStateEvent extends Equatable {
  const PageStateEvent();

  @override
  List<Object?> get props => [];
}

class PageStateInitialEvent extends PageStateEvent {}

class PageStatePostViewEvent extends PageStateEvent {}

class PageStateFeedViewEvent extends PageStateEvent {}

class SetLoginPage extends PageStateEvent {}

class SetRegisterPage extends PageStateEvent {}
