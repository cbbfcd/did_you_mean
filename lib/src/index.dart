import 'levenshtein.dart';

/// just like [didyoumean](https://www.npmjs.com/package/didyoumean) but via levenshtein algorithm.
///
/// example:
/// String instagram = didYouMean('insargrm', ['facebook', 'instagram', 'INSTAgram']);
///
String? didYouMean(String input, List<String> list) {
  String? matched;
  int? temp;

  for (var i = 0; i < list.length; i++) {
    String t = list[i]; // str to be compared
    var step = levenshtein(a: input, b: t);

    if (temp == null || step < temp) {
      temp = step;
      matched = t;
    }
  }

  return matched;
}
