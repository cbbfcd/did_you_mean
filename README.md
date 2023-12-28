# did_you_mean

> a dart port of [didyoumean](https://www.npmjs.com/package/didyoumean). but via levenshtein algorithm.

# Usage

```dart
import 'package:did_you_mean/did_you_mean.dart';

var input = 'résumé';
var list = ['resume', 'resumé'];
var matched = didYouMean(input, list);

print('the best matched is $matched'); // the best matched is resumé
```

# License

MIT License.
