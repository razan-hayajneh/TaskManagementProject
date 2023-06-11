import 'constants.dart';

class OnBoard {
  final int id;
  final String title;
  final String illustration;
  final String description;

  OnBoard({
    required this.id,
    required this.title,
    required this.illustration,
    required this.description,
  });
}

class StaticData {
  static List<OnBoard> getOnBoardingList() => [
    OnBoard(
      id: 0,
      title: 'Manage Your Tasks',
      illustration: Resources.on_board_1,
      description:
      '',
    ),
    OnBoard(
      id: 1,
      title: 'Do All The Tasks',
      illustration: Resources.on_board_2,
      description:
      '',
    ),
    OnBoard(
      id: 2,
      title: 'Complete Your Tasks',
      illustration: Resources.on_board_3,
      description:
      '',
    ),
  ];
}
