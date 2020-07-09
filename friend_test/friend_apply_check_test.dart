import 'package:test/test.dart';

import '../friend/data/friend_vo.dart';
import '../friend/data/friend_state_enum.dart';
import '../friend/friend_util.dart';

main() {
  final FriendUtil friendUtil = FriendUtil();
  group("사용자에게 친구 보내기 가능 여부 테스트", () {
    test("나 ( 친구 0 , 인증 ㅇ ), 상대 ( 친구 0 , 인증 ㅇ )", () {
      final myInfo = new FriendVO(null, 0, FriendStateEnum.ME, false);
      final userInfo = new FriendVO(null, 0, FriendStateEnum.NOTHING, false);
      expect(friendUtil.isfriendApplyCheck(myInfo, userInfo), true);
    });
  });
}