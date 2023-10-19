import 'package:serendy/src/features/evaluation/evaluation.dart';
import 'package:serendy/src/features/media/media.dart';
import 'package:serendy/src/features/user/user.dart';
import 'package:serendy/src/features/theme/theme.dart';

//user
final userMock = User(
  id: 'uid',
  email: 'serendy@email.com',
  username: "serendy",
);

//media
final mediasMock = [
  Media(
    type: MediaType.anime,
    status: MediaStatus.finished,
    title: "강철의 연금술사 BROTHERHOOD",
    image: "https://cdn.myanimelist.net/images/anime/1208/94745.jpg",
    keywords: const ["코미디", "액션", "능력"],
    youtubeId: const ['gKWEUJ4r5do'],
  ),
  Media(
    type: MediaType.anime,
    status: MediaStatus.finished,
    title: "슈타인즈 게이트",
    image: "https://cdn.myanimelist.net/images/anime/1935/127974.jpg",
    keywords: const ["코미디", "액션", "능력"],
    youtubeId: const ['gKWEUJ4r5do'],
  ),
  Media(
    type: MediaType.anime,
    status: MediaStatus.finished,
    title: "진격의 거인",
    image: "https://cdn.myanimelist.net/images/anime/10/47347.jpg",
    keywords: const ["코미디", "액션", "능력"],
    youtubeId: const ['gKWEUJ4r5do'],
  ),
  Media(
    type: MediaType.anime,
    status: MediaStatus.finished,
    title: "주술회전",
    image: "https://cdn.myanimelist.net/images/anime/1171/109222.jpg",
    keywords: const ["코미디", "액션", "능력"],
    youtubeId: const ['gKWEUJ4r5do'],
  ),
];

//evaluation
final evaluationsMock = List.generate(
  4,
  (i) => Evaluation(
    userId: userMock.id,
    emotion: Emotion.values[i],
    media: EvaluationMedia(
      id: mediasMock[0].id,
      title: mediasMock[0].title,
      image: mediasMock[0].image,
    ),
  ),
);

//theme
final themeOwnerMock = ThemeOwner(
  id: userMock.id,
  username: userMock.username,
);
final themeItemsMock = mediasMock
    .map((media) => ThemeItem(
          addedAt: DateTime.now(),
          mediaId: media.id,
          title: media.title,
          image: media.image,
        ))
    .toList();
final themesMock = [
  Theme(
    owner: themeOwnerMock,
    title: "M3",
    image: "https://vo.la/EKT5x",
    description: "특히 과학연구의 분야에서 실험 도중에 실패해서 얻은 결과에서 중대한 발견 또는 발명을 하는 것을 말한다",
    items: themeItemsMock,
  ),
  Theme(
    owner: themeOwnerMock,
    title: "자바스크립트",
    image: "https://vo.la/hOQob",
    items: themeItemsMock,
  ),
  Theme(
    owner: themeOwnerMock,
    title: "ES2023에서 도입된 자바스크립트의 새로운 배열 복사 메서드",
    image: "https://vo.la/M5xSg",
  ),
  Theme(
    owner: themeOwnerMock,
    title: "소 잃고 뇌약간 고친 MSA 구현기",
    image: "https://vo.la/Zzy1u",
  ),
];
