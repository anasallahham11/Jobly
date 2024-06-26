
abstract class QuestionStates{}

class QuestionInitialState extends QuestionStates{}

class QuestionLoadingState extends QuestionStates{}

class QuestionSuccessState extends QuestionStates{}

class QuestionErrorState extends QuestionStates{
  final String error;
  QuestionErrorState(this.error);
}
class ChangeTabBarState extends QuestionStates{}


class DeletePostsInitialState extends QuestionStates{}

class DeletePostsLoadingState extends QuestionStates{}

class DeletePostsSuccessState extends QuestionStates{}

class DeletePostsErrorState extends QuestionStates{
  final String error;
  DeletePostsErrorState(this.error);
}

class EditPostsInitialState extends QuestionStates{}

class EditPostsLoadingState extends QuestionStates{}

class EditPostsSuccessState extends QuestionStates{}

class EditPostsErrorState extends QuestionStates{
  final String error;
  EditPostsErrorState(this.error);
}

///LIKE
class LikeLoadingState extends QuestionStates{}

class LikeSuccessState extends QuestionStates{}

class LikeErrorState extends QuestionStates{
  final String error;
  LikeErrorState(this.error);
}

class ChangeIsLikedState extends QuestionStates{}

class ShowLikesLoadingState extends QuestionStates{}

class ShowLikesSuccessState extends QuestionStates{}

class ShowLikesErrorState extends QuestionStates{
  final String error;
  ShowLikesErrorState(this.error);
}
///COMMENTS
class ShowCommentsLoadingState extends QuestionStates{}

class ShowCommentsSuccessState extends QuestionStates{}

class ShowCommentsErrorState extends QuestionStates{
  final String error;
  ShowCommentsErrorState(this.error);
}


class CreateCommentsLoadingState extends QuestionStates{}

class CreateCommentsSuccessState extends QuestionStates{
  // final CreateCommentModel createCommentModel;
  //
  // CreateCommentsSuccessState(this.createCommentModel);
}

class CreateCommentsErrorState extends QuestionStates{
  final String error;
  CreateCommentsErrorState(this.error);
}

class DeleteCommentInitialState extends QuestionStates{}

class DeleteCommentLoadingState extends QuestionStates{}

class DeleteCommentSuccessState extends QuestionStates{}

class DeleteCommentErrorState extends QuestionStates{
  final String error;
  DeleteCommentErrorState(this.error);
}

class EditCommentInitialState extends QuestionStates{}

class EditCommentLoadingState extends QuestionStates{}

class EditCommentSuccessState extends QuestionStates{}

class EditCommentErrorState extends QuestionStates{
  final String error;
  EditCommentErrorState(this.error);
}