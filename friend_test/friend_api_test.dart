import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import '../friend/friend_util.dart';
import '../friend/data/friend_state_enum.dart';
import '../friend/data/friend_vo.dart';

main() {
  test("mocking test", () async {
    // FriendUtilMock friendUtil = FriendUtilMock();
    FriendUtil friendUtil = FriendUtil();
    FriendVO userInfo = FriendVO(null, 0, FriendStateEnum.NOTHING, false);

    // when(friendUtil.friendStateChange(userInfo)).thenAnswer((_)=>Future.value(false));
    var test1= await friendUtil.friendStateChange(userInfo);
    

  });
}

class FriendUtilMock extends Mock implements FriendUtil {}
