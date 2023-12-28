/// [understanding-the-levenshtein-distance]https://medium.com/@ethannam/understanding-the-levenshtein-distance-equation-for-beginners-c4285a5604f0
///
/// # usage
///
/// a is user input string, b is str to be compared.
/// int step = levenshtein(a: 'ins', b: 'in');
int levenshtein({required String a, required String b}) {
  if (a == b) return 0;

  // swap
  if (a.length > b.length) {
    var temp = a;
    a = b;
    b = temp;
  }

  var la = a.length;
  var lb = b.length;

  if (la == 0) return lb;

  // trim common suffix, that's the reason why we need swap the params according to it's length
  while (la > 0 && a.codeUnitAt(la - 1) == b.codeUnitAt(lb - 1)) {
    la--;
    lb--;
  }

  if (la == 0) return lb;

  // trim prefix
  var start = 0;
  while (start < la && a.codeUnitAt(start) == b.codeUnitAt(start)) {
    start++;
  }

  la -= start;
  lb -= start;

  if (la == 0) return lb;

  var i = 0;
  final List<int> V = [];
  final List<int> C = [];

  /// metrics
  /// left, right, diagonally left, dl = if char equal, diagonally left + 0 else + 1
  /// Math.min(left + 1, right + 1, dl)
  ///
  /**
   *   *   *   a   b   c
   *   |   |   |   |   |
   *   * - 0 - 1 - 2 - 3
   *   |   |   |   |   |
   *   a - 1 - 0 - 1 - 2
   *   |   |   |   |   |
   *   b - 2 - 1 - 0 - 1
   *   |   |   |   |   |
   *   d - 3 - 2 - 1 - 1 <- result
   */
  while (i < lb) {
    C.add(b.codeUnitAt(start + i));
    V.add(++i);
  }

  var current = 0;
  int j;
  int left;
  int above;
  int chr;

  for (i = 0; i < la; i++) {
    left = i;
    current = i + 1;
    chr = a.codeUnitAt(start + i);

    for (j = 0; j < lb; j++) {
      above = current;
      current = left;
      left = V[j];

      if (chr != C[j]) {
        if (left < current) current = left;
        if (above < current) current = above;
        current++;
      }

      V[j] = current;
    }
  }

  return current;
}
