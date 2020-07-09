import 'data/friend_state_enum.dart';
import 'data/friend_vo.dart';
import 'friend_config_value.dart';

class FriendUtil {
  bool isfriendApplyCheck(FriendVO myInfo, FriendVO userInfo) {
    int myFriendLimit = _friendLimitCount(myInfo);
    int userFriendLimit = _friendLimitCount(userInfo);
    return userInfo.firendState == FriendStateEnum.NOTHING ||
        myFriendLimit <= myInfo.firendCount ||
        userFriendLimit <= userInfo.firendCount;
  }

  int _friendLimitCount(FriendVO vo) {
    int firendLimit;
    if (vo.isAuth) {
      firendLimit = FriendConfigVaule.AUTH_USER_MAX_FRIDED_COUNT;
    } else {
      firendLimit = FriendConfigVaule.AUTH_NOT_USER_MAX_FRIDED_COUNT;
    }
    return firendLimit;
  }
}
