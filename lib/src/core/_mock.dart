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
// Media
final mediasMock = [
  Media(
    id: 'm1',
    type: MediaType.anime,
    status: MediaStatus.finished,
    title: "Apple",
    image:
        "https://media.disquiet.io/images/makerlog/c4585be0838c322b320e86cbbc3779d24ff7c07eeadcdc1011ef5282c57285b8",
    keywords: const ["코미디", "액션", "능력"],
    youtubeId: const ['gKWEUJ4r5do'],
  ),
  Media(
    id: 'm2',
    type: MediaType.anime,
    status: MediaStatus.finished,
    title: "강철의 연금술사 BROTHERHOOD",
    image: "https://cdn.myanimelist.net/images/anime/1208/94745.jpg",
    keywords: const ["코미디", "액션", "능력"],
    youtubeId: const ['gKWEUJ4r5do'],
  ),
  Media(
    id: 'm3',
    type: MediaType.anime,
    status: MediaStatus.finished,
    title: "데스노트",
    image: "https://cdn.myanimelist.net/images/anime/9/9453.jpg",
    keywords: const ["코미디", "액션", "능력"],
    youtubeId: const ['gKWEUJ4r5do'],
  ),
  Media(
    id: 'm4',
    type: MediaType.anime,
    status: MediaStatus.finished,
    title: "슈타인즈 게이트",
    image: "https://cdn.myanimelist.net/images/anime/1935/127974.jpg",
    keywords: const ["코미디", "액션", "능력"],
    youtubeId: const ['gKWEUJ4r5do'],
  ),
  Media(
    id: 'm5',
    type: MediaType.anime,
    status: MediaStatus.finished,
    title: "진격의 거인",
    image: "https://cdn.myanimelist.net/images/anime/10/47347.jpg",
    keywords: const ["코미디", "액션", "능력"],
    youtubeId: const ['gKWEUJ4r5do'],
  ),
  Media(
    id: 'm6',
    type: MediaType.anime,
    status: MediaStatus.finished,
    title: "주술회전",
    image: "https://cdn.myanimelist.net/images/anime/1171/109222.jpg",
    keywords: const ["코미디", "액션", "능력"],
    youtubeId: const ['gKWEUJ4r5do'],
  ),
];

// Evaluation
final evaluationMock = Evaluation(
  userId: userMock.id,
  emotion: Emotion.happyness,
  media: EvaluationMedia(
    id: mediasMock[0].id,
    title: mediasMock[0].title,
    image: mediasMock[0].image,
  ),
);

// Theme
final themeOwnerMock = ThemeOwner(
  id: userMock.id,
  name: userMock.name,
);
final themeItemMock = ThemeItem(
  addedAt: DateTime.now(),
  media: mediasMock[0],
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
