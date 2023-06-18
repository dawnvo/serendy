import 'package:serendy/features/collection/domain/collection.dart';
import 'package:serendy/features/evaluation/domain/evaluation.dart';
import 'package:serendy/features/media/domain/media.dart';
import 'package:serendy/features/user/domain/user.dart';

// User

final userMock = User(id: 'uid', name: "Serendy");

// Media
final mediaMock = Media(
  type: MediaType.anime,
  status: MediaStatus.finished,
  title: "최애의 아이",
  image: "https://vo.la/oRm94",
  keywords: const ["코미디", "액션", "능력"],
);

// Evaluation
final evaluationMock = Evaluation(
  userId: userMock.id,
  emotion: Emotion.happyness,
  media: mediaMock,
);

// Collection
final collectionOwnerMock = CollectionOwner(
  id: userMock.id,
  name: userMock.name,
);
final collectionItemMock = CollectionItem(
  addedAt: DateTime.now(),
  media: mediaMock,
);
final collectionsMock = [
  Collection(
      id: 'cid1',
      private: false,
      owner: collectionOwnerMock,
      title: "M3",
      description: "특히 과학연구의 분야에서 실험 도중에 실패해서 얻은 결과에서 중대한 발견 또는 발명을 하는 것을 말한다",
      image: "https://vo.la/EKT5x",
      items: List.filled(8, collectionItemMock)),
  Collection(
      id: 'cid2',
      private: false,
      owner: collectionOwnerMock,
      title: "자바스크립트",
      image: "https://vo.la/hOQob",
      items: List.filled(8, collectionItemMock)),
  Collection(
    id: 'cid3',
    private: false,
    owner: collectionOwnerMock,
    title: "ES2023에서 도입된 자바스크립트의 새로운 배열 복사 메서드",
    image: "https://vo.la/M5xSg",
  ),
  Collection(
    id: 'cid4',
    owner: collectionOwnerMock,
    title: "소 잃고 뇌약간 고친 MSA 구현기",
    image: "https://vo.la/Zzy1u",
  ),
];
