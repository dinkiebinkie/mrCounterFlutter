// data object for counter
class CounterClass {
  int id; // unique id
  int count; // what's this counters value?
  String title; // title of counter
  bool selected; // whether or not counter should be shown
  int incrementAmount; // how much the counter should increment

  // String color; // color to make counter

  // constructor
  // with curly brackets we need to name them
  // without you have to make sure is in order
  CounterClass({this.count, this.title, this.id, this.selected, this.incrementAmount});
}

// to make a new counter do the following:
// Counter( ${all properties} )
