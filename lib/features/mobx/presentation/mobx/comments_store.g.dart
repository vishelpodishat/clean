// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CommentsStore on _CommentsStoreBase, Store {
  Computed<bool>? _$isCommentsEmptyComputed;

  @override
  bool get isCommentsEmpty =>
      (_$isCommentsEmptyComputed ??= Computed<bool>(() => super.isCommentsEmpty,
              name: '_CommentsStoreBase.isCommentsEmpty'))
          .value;

  late final _$commentsAtom =
      Atom(name: '_CommentsStoreBase.comments', context: context);

  @override
  ObservableList<CommentEntity> get comments {
    _$commentsAtom.reportRead();
    return super.comments;
  }

  @override
  set comments(ObservableList<CommentEntity> value) {
    _$commentsAtom.reportWrite(value, super.comments, () {
      super.comments = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CommentsStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_CommentsStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$fetchCommsAsyncAction =
      AsyncAction('_CommentsStoreBase.fetchComms', context: context);

  @override
  Future<void> fetchComms() {
    return _$fetchCommsAsyncAction.run(() => super.fetchComms());
  }

  late final _$_CommentsStoreBaseActionController =
      ActionController(name: '_CommentsStoreBase', context: context);

  @override
  void addComment(CommentEntity comment) {
    final _$actionInfo = _$_CommentsStoreBaseActionController.startAction(
        name: '_CommentsStoreBase.addComment');
    try {
      return super.addComment(comment);
    } finally {
      _$_CommentsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearComments() {
    final _$actionInfo = _$_CommentsStoreBaseActionController.startAction(
        name: '_CommentsStoreBase.clearComments');
    try {
      return super.clearComments();
    } finally {
      _$_CommentsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
comments: ${comments},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
isCommentsEmpty: ${isCommentsEmpty}
    ''';
  }
}
