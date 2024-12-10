import 'package:clean/features/mobx/data/models/comments.dart';
import 'package:clean/features/mobx/domain/entity/comments.dart';
import 'package:clean/features/mobx/domain/usecases/comments_usecases.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/resources/location/data_state.dart';

part 'comments_store.g.dart';

class CommentsStore = _CommentsStoreBase with $_CommentsStore;

abstract class _CommentsStoreBase with Store {
  final CommentsUseCases _commentsUseCases;

  _CommentsStoreBase(this._commentsUseCases);
  @observable
  ObservableList<CommentEntity> comments = ObservableList<CommentEntity>();

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> fetchComms() async {
    isLoading = true;
    errorMessage = null;

    try {
      final dataState = await _commentsUseCases();

      if (dataState is DataSuccess) {
        comments = ObservableList.of(dataState.data ?? []);
      } else if (dataState is DataFailed) {
        errorMessage = dataState.error?.toString() ?? 'Unknown error occurred';
      }
    } catch (e) {
      errorMessage = e.toString();
      if (kDebugMode) {
        print('Error fetching comments: $e');
      }
    } finally {
      isLoading = false;
    }
  }

  @computed
  bool get isCommentsEmpty => comments.isEmpty;

  @action
  void addComment(CommentEntity comment) {
    comments.add(comment);
  }

  @action
  void clearComments() {
    comments.clear();
  }
}
