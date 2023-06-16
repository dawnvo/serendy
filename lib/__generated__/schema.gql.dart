enum Enum$MediaType { anime, movie, manga, novel, $unknown }

String toJson$Enum$MediaType(Enum$MediaType e) {
  switch (e) {
    case Enum$MediaType.anime:
      return r'anime';
    case Enum$MediaType.movie:
      return r'movie';
    case Enum$MediaType.manga:
      return r'manga';
    case Enum$MediaType.novel:
      return r'novel';
    case Enum$MediaType.$unknown:
      return r'$unknown';
  }
}

Enum$MediaType fromJson$Enum$MediaType(String value) {
  switch (value) {
    case r'anime':
      return Enum$MediaType.anime;
    case r'movie':
      return Enum$MediaType.movie;
    case r'manga':
      return Enum$MediaType.manga;
    case r'novel':
      return Enum$MediaType.novel;
    default:
      return Enum$MediaType.$unknown;
  }
}

enum Enum$MediaStatus { finished, releasing, unreleased, cancelled, $unknown }

String toJson$Enum$MediaStatus(Enum$MediaStatus e) {
  switch (e) {
    case Enum$MediaStatus.finished:
      return r'finished';
    case Enum$MediaStatus.releasing:
      return r'releasing';
    case Enum$MediaStatus.unreleased:
      return r'unreleased';
    case Enum$MediaStatus.cancelled:
      return r'cancelled';
    case Enum$MediaStatus.$unknown:
      return r'$unknown';
  }
}

Enum$MediaStatus fromJson$Enum$MediaStatus(String value) {
  switch (value) {
    case r'finished':
      return Enum$MediaStatus.finished;
    case r'releasing':
      return Enum$MediaStatus.releasing;
    case r'unreleased':
      return Enum$MediaStatus.unreleased;
    case r'cancelled':
      return Enum$MediaStatus.cancelled;
    default:
      return Enum$MediaStatus.$unknown;
  }
}

enum Enum$Emotion {
  anger,
  surprise,
  sadness,
  disgust,
  normal,
  joy,
  fear,
  happyness,
  nice,
  $unknown
}

String toJson$Enum$Emotion(Enum$Emotion e) {
  switch (e) {
    case Enum$Emotion.anger:
      return r'anger';
    case Enum$Emotion.surprise:
      return r'surprise';
    case Enum$Emotion.sadness:
      return r'sadness';
    case Enum$Emotion.disgust:
      return r'disgust';
    case Enum$Emotion.normal:
      return r'normal';
    case Enum$Emotion.joy:
      return r'joy';
    case Enum$Emotion.fear:
      return r'fear';
    case Enum$Emotion.happyness:
      return r'happyness';
    case Enum$Emotion.nice:
      return r'nice';
    case Enum$Emotion.$unknown:
      return r'$unknown';
  }
}

Enum$Emotion fromJson$Enum$Emotion(String value) {
  switch (value) {
    case r'anger':
      return Enum$Emotion.anger;
    case r'surprise':
      return Enum$Emotion.surprise;
    case r'sadness':
      return Enum$Emotion.sadness;
    case r'disgust':
      return Enum$Emotion.disgust;
    case r'normal':
      return Enum$Emotion.normal;
    case r'joy':
      return Enum$Emotion.joy;
    case r'fear':
      return Enum$Emotion.fear;
    case r'happyness':
      return Enum$Emotion.happyness;
    case r'nice':
      return Enum$Emotion.nice;
    default:
      return Enum$Emotion.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{};
