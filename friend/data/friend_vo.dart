import 'friend_state_enum.dart';

class FriendVO {
  int userUniqKey;
  int firendCount;
  FriendStateEnum firendState;
  bool isAuth;
  FriendVO(this.userUniqKey, this.firendCount, this.firendState, this.isAuth);
}
