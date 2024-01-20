import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zero/Model/comment.dart';
import 'package:zero/Model/post.dart';
import 'package:zero/Repository/Feed/feed_repository.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final FeedRepository feedRepository;

  FeedBloc(this.feedRepository) : super(FeedInitial()) {
    on<FeedRequested>(
      (event, emit) async {
        emit(FeedLoading());
        try {
          var res = await feedRepository.get10Posts();
          if (res != false) {
            emit(FeedLoaded(posts: res));
          }
        } catch (e) {
          emit(FeedError(message: e.toString()));
        }
      },
    );
    on<GetPostsByUserId>(
      (event, emit) async {
        emit(FeedLoading());
        try {
          var res = await feedRepository.getPostByUserId(event.userId);

          if (res != false) {
            emit(FeedLoaded(posts: res));
          }
        } catch (e) {
          emit(
            FeedError(
              message: e.toString(),
            ),
          );
        }
      },
    );
    on<GetCmtOfPost>((event, emit) async {
      emit(CmtInitial());
      try {
        var res = await feedRepository.getCmt(event.postId);
        if (res != false) {
          emit(CmtLoaded(cmts: res));
        }
      } catch (e) {
        emit(
          CmtError(
            message: e.toString(),
          ),
        );
      }
    });
  }
}
