import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:solana_token_list/src/resolution_strategy.dart';

void main() async {
  const strategy = CDNTokenListResolutionStrategy();
  final resp = await http.get(Uri.parse(strategy.repositories.first));
  final str = resp.body.replaceAll(r'$', r'\$');
  File('lib/src/static_tokens.dart').writeAsStringSync('''
import '../solana_token_list.dart' show TokenList;

TokenList? _staticTokenList;

/// solana static token list
TokenList get staticTokenList {
  _staticTokenList ??= TokenList.fromJson(_kSolanaTokens);
  return _staticTokenList!;
}

Map<String,dynamic> get _kSolanaTokens => $str;
 ''');
}
