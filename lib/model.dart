
enum MatchLevel {
  unset,
  practice,
  qualification,
  playoff,
}

enum Alliance {
  unset,
  red,
  blue,
}

enum Preload {
  unset,
  none,
  coral,
  algae,
}

enum AutoStartPosition {
  unset,
  left,
  center,
  right,
}

enum AutoPathPoint{
  leftCoralStation,
  rightCoralStation,

  leftGroundCoral,
  centerGroundCoral,
  rightGroundCoral,

  leftGroundAlgae,
  centerGroundAlgae,
  rightGroundAlgae,

  reefAlgae,
  processor,
  net,

  l1ReefAB,
  l1ReefCD,
  l1ReefEF,
  l1ReefGH,
  l1ReefIJ,
  l1ReefKL,

  l2ReefAB,
  l2ReefCD,
  l2ReefEF,
  l2ReefGH,
  l2ReefIJ,
  l2ReefKL,

  l3ReefAB,
  l3ReefCD,
  l3ReefEF,
  l3ReefGH,
  l3ReefIJ,
  l3ReefKL,

  l4ReefAB,
  l4ReefCD,
  l4ReefEF,
  l4ReefGH,
  l4ReefIJ,
  l4ReefKL,
}

enum TelopPathPoint{
  leftCoralStation,
  rightCoralStation,

  groundCoral,
  groundAlgae,

  reefAlgae,
  processor,
  net,

  l1Reef,

  l2LeftReef,
  l3LeftReef,
  l4LeftReef,

  l3RightReef,
  l2RightReef,
  l4RightReef,
}

enum BargeAction {
  unset,
  none,
  park,
  deep,
  shallow,
}

enum HangType {
  none,
  deep,
  shallow,
}

enum BargePosition {
  unset,
  left,
  center,
  right,
}