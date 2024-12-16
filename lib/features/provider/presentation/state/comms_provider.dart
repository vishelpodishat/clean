import 'package:clean/core/resources/location/data_state.dart';
import 'package:clean/features/provider/domain/entity/comms_entity.dart';
import 'package:clean/features/provider/domain/usecases/comms_usecases.dart';
import 'package:flutter/material.dart';

class CommentsProvider extends ChangeNotifier {
  final CommsUsecases getCommentUseCases;

  CommentsProvider({required this.getCommentUseCases});

  List<CommentEntity> _comments = [];
  List<CommentEntity> get comments => _comments;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  FlutterError? _errorMessage;
  FlutterError? get errorMessage => _errorMessage;

  Future<void> fetchComms() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final result = await getCommentUseCases(params: null);

    if (result is DataSuccess) {
      _comments = result.data ?? [];
      _isLoading = false;
      _errorMessage = null;
    } else if (result is DataFailed) {
      _comments = [];
      _isLoading = false;
      _errorMessage = result.error;
    }

    notifyListeners();
  }

  void updateUseCase(CommsUsecases useCase) {
    // implementation
  }
}
