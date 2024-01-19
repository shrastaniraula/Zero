import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:zero/Model/post.dart';
part 'page_state_state.dart';
part 'page_state_event.dart';

class PageStateCubit extends Cubit<PageStateState> {
  PageStateCubit() : super(PageStateInitial());
  void setFeedView() {
    emit(PageStateFeedView());
  }

  void setPostView(selectedPost) {
    emit(PageStatePostView(selectedPost: selectedPost));
  }

  void setLoginPage() {
    emit(PageStateLogin());
  }

  void setRegisterPage() {
    emit(PageStateRegister());
  }
}
