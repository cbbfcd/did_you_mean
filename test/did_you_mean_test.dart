import 'package:did_you_mean/did_you_mean.dart';
import 'package:test/test.dart';

void main() {
  group('matching against a list of strings', () {
    test('matched correctly example one', () {
      var input = 'insargrm';
      var list = [
        'facebook',
        'INSTAgram',
        'in stagram',
        'baidu',
        'twitter',
        'wechat',
        'instagram',
        'linkedin'
      ];
      var ret = didYouMean(input, list);
      expect(ret, 'instagram');
    });

    test('matched correctly example two', () {
      var input = 'résumé';
      var list = ['resume', 'resumé'];
      var ret = didYouMean(input, list);
      expect(ret, 'resumé');
    });
  });
}
