
abstract class CommunityStates{}

class CommunityInitialState extends CommunityStates{}

class CommunityLoadingState extends CommunityStates{}

class CommunitySuccessState extends CommunityStates{}

class CommunityErrorState extends CommunityStates{
  final String error;
  CommunityErrorState(this.error);
}
class ChangeTabBarState extends CommunityStates{}


class DeletePostsInitialState extends CommunityStates{}

class DeletePostsLoadingState extends CommunityStates{}

class DeletePostsSuccessState extends CommunityStates{}

class DeletePostsErrorState extends CommunityStates{
  final String error;
  DeletePostsErrorState(this.error);
}

class EditPostsInitialState extends CommunityStates{}

class EditPostsLoadingState extends CommunityStates{}

class EditPostsSuccessState extends CommunityStates{}

class EditPostsErrorState extends CommunityStates{
  final String error;
  EditPostsErrorState(this.error);
}

///LIKE
class LikeLoadingState extends CommunityStates{}

class LikeSuccessState extends CommunityStates{}

class LikeErrorState extends CommunityStates{
  final String error;
  LikeErrorState(this.error);
}

class ChangeIsLikedState extends CommunityStates{}

class ShowLikesLoadingState extends CommunityStates{}

class ShowLikesSuccessState extends CommunityStates{}

class ShowLikesErrorState extends CommunityStates{
  final String error;
  ShowLikesErrorState(this.error);
}
///COMMENTS
class ShowCommentsLoadingState extends CommunityStates{}

class ShowCommentsSuccessState extends CommunityStates{}

class ShowCommentsErrorState extends CommunityStates{
  final String error;
  ShowCommentsErrorState(this.error);
}


class CreateCommentsLoadingState extends CommunityStates{}

class CreateCommentsSuccessState extends CommunityStates{
  // final CreateCommentModel createCommentModel;
  //
  // CreateCommentsSuccessState(this.createCommentModel);
}

class CreateCommentsErrorState extends CommunityStates{
  final String error;
  CreateCommentsErrorState(this.error);
}

class DeleteCommentInitialState extends CommunityStates{}

class DeleteCommentLoadingState extends CommunityStates{}

class DeleteCommentSuccessState extends CommunityStates{}

class DeleteCommentErrorState extends CommunityStates{
  final String error;
  DeleteCommentErrorState(this.error);
}

class EditCommentInitialState extends CommunityStates{}

class EditCommentLoadingState extends CommunityStates{}

class EditCommentSuccessState extends CommunityStates{}

class EditCommentErrorState extends CommunityStates{
  final String error;
  EditCommentErrorState(this.error);
}