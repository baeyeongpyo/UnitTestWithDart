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
}
