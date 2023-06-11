import 'package:serendy/src/models/models.dart';

// User
final userMock = User(name: "Serendy");

// Media
final mediaMock = Media(
  image:
      "https://i.pinimg.com/236x/2b/63/b4/2b63b4c741ffc742f42f321b5f4bd1ec.jpg",
  title: "최애의 아이",
  type: MediaType.anime,
  status: MediaStatus.finished,
  keywords: const ["코미디", "액션", "능력"],
);

// Evaluation
final evaluationMock = Evaluation(
  userId: userMock.id,
  emotion: Emotion.happyness,
  media: MediaInfo(
    id: mediaMock.id,
    image: mediaMock.image,
    title: mediaMock.title,
  ),
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
      private: false,
      owner: collectionOwnerMock,
      title: "M3",
      description: "특히 과학연구의 분야에서 실험 도중에 실패해서 얻은 결과에서 중대한 발견 또는 발명을 하는 것을 말한다",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6XwczmKGbetQaI2AqVBagWKSax0R4U-jdrQ&usqp=CAU",
      items: List.filled(8, collectionItemMock)),
  Collection(
      private: false,
      owner: collectionOwnerMock,
      title: "자바스크립트",
      image:
          "https://velog.velcdn.com/images/sehyunny/post/88174e81-911d-4120-baef-08fc8a581bde/image.png",
      items: List.filled(8, collectionItemMock)),
  Collection(
    private: false,
    owner: collectionOwnerMock,
    title: "ES2023에서 도입된 자바스크립트의 새로운 배열 복사 메서드",
    image:
        "https://velog.velcdn.com/images/eunbinn/post/1db97b15-37a6-4cda-8bae-f735c41166c7/image.webp",
  ),
  Collection(
    owner: collectionOwnerMock,
    title: "소 잃고 뇌약간 고친 MSA 구현기",
    image:
        "https://velog.velcdn.com/images/ingkoon/post/96140f7b-094b-49ac-8043-9cbc3d1613ee/image.png",
  ),
];
