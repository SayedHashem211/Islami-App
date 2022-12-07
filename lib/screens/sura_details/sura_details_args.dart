// data class instead of sending map in arguments (passing data from quran tab screen to suraDetails screen )

class SuraDetailsScreenArgs {
  String name;
  int index;

  SuraDetailsScreenArgs({required this.name, required this.index});
}
