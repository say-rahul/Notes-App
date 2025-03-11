class Smboxes {
  String name;
  String icon;

  Smboxes({required this.name, required this.icon});

  static List<Smboxes> getSmboxes() {
    return [
      Smboxes(name: 'All', icon: 'assets/icons/like.svg'),
      Smboxes(name: 'History', icon: 'assets/icons/watch_history.svg'),
      Smboxes(name: 'Done', icon: 'assets/icons/person_tick.svg'),
      Smboxes(name: 'Undone', icon: 'assets/icons/lines_horizontal_decrease_rectangle.svg'),
    ];
  }
}
