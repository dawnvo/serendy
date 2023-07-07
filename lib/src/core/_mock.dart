import 'package:serendy/src/core/enums.dart';
import 'package:serendy/src/features/theme/theme.dart';
import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';

// User
final userMock = User(
  id: 'uid',
  name: "Serendy",
  email: 'serendy@email.com',
);

// Media
final mediaMock = Media(
  type: MediaType.anime,
  status: MediaStatus.finished,
  title: "최애의 아이",
  image: "https://vo.la/oRm94",
  keywords: const ["코미디", "액션", "능력"],
  images: MediaImages.empty(),
);

// Evaluation
final evaluationMock = Evaluation(
  userId: userMock.id,
  emotion: Emotion.happyness,
  media: MediaInfo(
    id: mediaMock.id,
    title: mediaMock.title,
    image: mediaMock.image,
  ),
);

// Theme
final themeOwnerMock = ThemeOwner(
  id: userMock.id,
  name: userMock.name,
);
final themeItemMock = ThemeItem(
  addedAt: DateTime.now(),
  media: mediaMock,
);
final themesMock = [
  Theme(
      id: 'cid1',
      private: false,
      owner: themeOwnerMock,
      title: "M3",
      description: "특히 과학연구의 분야에서 실험 도중에 실패해서 얻은 결과에서 중대한 발견 또는 발명을 하는 것을 말한다",
      image: "https://vo.la/EKT5x",
      items: List.filled(8, themeItemMock)),
  Theme(
      id: 'cid2',
      private: false,
      owner: themeOwnerMock,
      title: "자바스크립트",
      image: "https://vo.la/hOQob",
      items: List.filled(8, themeItemMock)),
  Theme(
    id: 'cid3',
    private: false,
    owner: themeOwnerMock,
    title: "ES2023에서 도입된 자바스크립트의 새로운 배열 복사 메서드",
    image: "https://vo.la/M5xSg",
  ),
  Theme(
    id: 'cid4',
    owner: themeOwnerMock,
    title: "소 잃고 뇌약간 고친 MSA 구현기",
    image: "https://vo.la/Zzy1u",
  ),
];
