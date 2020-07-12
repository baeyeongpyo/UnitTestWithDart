import 'data/friend_state_enum.dart';
import 'data/friend_vo.dart';

class FriendUtil {
  static const FRIEND_MAX_COUNT = 50;
  static const NOT_AUTH_FRIEND_MAX_COUNT = 3;

  bool isfriendApplyCheck(FriendVO myInfo, FriendVO userInfo) {
    bool stateCheck = userInfo.firendState == FriendStateEnum.NOTHING;
    bool myFriendCheck = friendMAXCount(myInfo.isAuth) > myInfo.firendCount;
    bool userFriendCheck =
        friendMAXCount(userInfo.isAuth) > userInfo.firendCount;
    return stateCheck && myFriendCheck && userFriendCheck;
  }

  int friendMAXCount(bool isAuth) =>
      isAuth ? FRIEND_MAX_COUNT : NOT_AUTH_FRIEND_MAX_COUNT;

  friendStateChange(FriendVO userInfo) {
    bool reuslt;
    Future<bool> waitResult;

    switch (userInfo.firendState) {
      case FriendStateEnum.NOTHING:
        waitResult = friendRequest();
        break;
      case FriendStateEnum.FRIENDS_REQUESTED:
        waitResult = friendRequestCancel();
        break;
      case FriendStateEnum.ALREADY_FRIENDS:
        waitResult = friendRemove();
        break;
      case FriendStateEnum.FRIENDS_REQUEST_RECEIVED:
        waitResult = friendApply();
        break;
      case FriendStateEnum.ME:
        waitResult = Future.value(false);
        break;
    }
  }

  friendRequest() async => Future.value(true);
  friendRequestCancel() async => Future.value(true);
  friendRemove() async => Future.value(true);
  friendApply() async => Future.value(true);
}
