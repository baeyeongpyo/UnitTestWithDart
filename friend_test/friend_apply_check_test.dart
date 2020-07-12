import 'package:test/test.dart';

import '../friend/data/friend_vo.dart';
import '../friend/data/friend_state_enum.dart';
import '../friend/friend_util.dart';

main() {

  final FriendUtil friendUtil = FriendUtil();
  group("사용자에게 친구 보내기 가능 여부 테스트", () {
    friendTestHelper(FriendStateEnum.NOTHING, 0, false, 0, false, true);
    friendTestHelper(FriendStateEnum.NOTHING, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, false, 0, false, false);
    friendTestHelper(FriendStateEnum.NOTHING, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, true, 0, false, true);
    friendTestHelper(FriendStateEnum.NOTHING, FriendUtil.FRIEND_MAX_COUNT, true, 0, false, false);

    friendTestHelper(FriendStateEnum.NOTHING, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, false, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, false, false);
    friendTestHelper(FriendStateEnum.NOTHING, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, false, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, true, false);
    friendTestHelper(FriendStateEnum.NOTHING, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, true, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, true, true);

    friendTestHelper(FriendStateEnum.NOTHING, FriendUtil.FRIEND_MAX_COUNT, true, FriendUtil.FRIEND_MAX_COUNT, false, false);
    friendTestHelper(FriendStateEnum.NOTHING, FriendUtil.FRIEND_MAX_COUNT, true, FriendUtil.FRIEND_MAX_COUNT, true, false);
    friendTestHelper(FriendStateEnum.NOTHING, FriendUtil.FRIEND_MAX_COUNT, true, FriendUtil.FRIEND_MAX_COUNT, true, false);

    friendTestHelper(FriendStateEnum.FRIENDS_REQUESTED, 0, false, 0, false, false);
    friendTestHelper(FriendStateEnum.FRIENDS_REQUESTED, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, false, 0, false, false);
    friendTestHelper(FriendStateEnum.FRIENDS_REQUESTED, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, true, 0, false, false);
    friendTestHelper(FriendStateEnum.FRIENDS_REQUESTED, FriendUtil.FRIEND_MAX_COUNT, true, 0, false, false);

    friendTestHelper(FriendStateEnum.FRIENDS_REQUESTED, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, false, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, false, false);
    friendTestHelper(FriendStateEnum.FRIENDS_REQUESTED, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, false, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, true, false);
    friendTestHelper(FriendStateEnum.FRIENDS_REQUESTED, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, true, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, true, false);

    friendTestHelper(FriendStateEnum.FRIENDS_REQUESTED, FriendUtil.FRIEND_MAX_COUNT, true, FriendUtil.FRIEND_MAX_COUNT, false, false);
    friendTestHelper(FriendStateEnum.FRIENDS_REQUESTED, FriendUtil.FRIEND_MAX_COUNT, true, FriendUtil.FRIEND_MAX_COUNT, true, false);
    friendTestHelper(FriendStateEnum.FRIENDS_REQUESTED, FriendUtil.FRIEND_MAX_COUNT, true, FriendUtil.FRIEND_MAX_COUNT, true, false);
    
    friendTestHelper(FriendStateEnum.ALREADY_FRIENDS, 0, false, 0, false, false);
    friendTestHelper(FriendStateEnum.ALREADY_FRIENDS, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, false, 0, false, false);
    friendTestHelper(FriendStateEnum.ALREADY_FRIENDS, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, true, 0, false, false);
    friendTestHelper(FriendStateEnum.ALREADY_FRIENDS, FriendUtil.FRIEND_MAX_COUNT, true, 0, false, false);

    friendTestHelper(FriendStateEnum.ALREADY_FRIENDS, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, false, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, false, false);
    friendTestHelper(FriendStateEnum.ALREADY_FRIENDS, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, false, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, true, false);
    friendTestHelper(FriendStateEnum.ALREADY_FRIENDS, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, true, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, true, false);

    friendTestHelper(FriendStateEnum.ALREADY_FRIENDS, FriendUtil.FRIEND_MAX_COUNT, true, FriendUtil.FRIEND_MAX_COUNT, false, false);
    friendTestHelper(FriendStateEnum.ALREADY_FRIENDS, FriendUtil.FRIEND_MAX_COUNT, true, FriendUtil.FRIEND_MAX_COUNT, true, false);
    friendTestHelper(FriendStateEnum.ALREADY_FRIENDS, FriendUtil.FRIEND_MAX_COUNT, true, FriendUtil.FRIEND_MAX_COUNT, true, false);
    
    friendTestHelper(FriendStateEnum.FRIENDS_REQUEST_RECEIVED, 0, false, 0, false, false);
    friendTestHelper(FriendStateEnum.FRIENDS_REQUEST_RECEIVED, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, false, 0, false, false);
    friendTestHelper(FriendStateEnum.FRIENDS_REQUEST_RECEIVED, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, true, 0, false, false);
    friendTestHelper(FriendStateEnum.FRIENDS_REQUEST_RECEIVED, FriendUtil.FRIEND_MAX_COUNT, true, 0, false, false);

    friendTestHelper(FriendStateEnum.FRIENDS_REQUEST_RECEIVED, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, false, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, false, false);
    friendTestHelper(FriendStateEnum.FRIENDS_REQUEST_RECEIVED, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, false, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, true, false);
    friendTestHelper(FriendStateEnum.FRIENDS_REQUEST_RECEIVED, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, true, FriendUtil.NOT_AUTH_FRIEND_MAX_COUNT, true, false);

    friendTestHelper(FriendStateEnum.FRIENDS_REQUEST_RECEIVED, FriendUtil.FRIEND_MAX_COUNT, true, FriendUtil.FRIEND_MAX_COUNT, false, false);
    friendTestHelper(FriendStateEnum.FRIENDS_REQUEST_RECEIVED, FriendUtil.FRIEND_MAX_COUNT, true, FriendUtil.FRIEND_MAX_COUNT, true, false);
    friendTestHelper(FriendStateEnum.FRIENDS_REQUEST_RECEIVED, FriendUtil.FRIEND_MAX_COUNT, true, FriendUtil.FRIEND_MAX_COUNT, true, false);
  });
}

friendTestHelper(FriendStateEnum firendStatus, int myFriendCount, bool myAuth,
    int userFriendCount, bool userAuth, bool check) {
  FriendUtil friendUtil = FriendUtil();
  String message =
      "나 ( 친구 $myFriendCount, ${authCheck(myAuth)} ) , 상대 ( 친구 $userFriendCount ${authCheck(userAuth)} ) $firendStatus";
  test(message, () {
    final myInfo =
        new FriendVO(null, myFriendCount, FriendStateEnum.ME, myAuth);
    final userInfo =
        new FriendVO(null, userFriendCount, firendStatus, userAuth);
    expect(friendUtil.isfriendApplyCheck(myInfo, userInfo), check);
  });
}

String authCheck(bool isAuth) => "인증 ${isAuth ? "o" : "x"}";
