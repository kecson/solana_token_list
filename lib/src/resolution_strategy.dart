import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;

import '../solana_token_list.dart';

enum Strategy {
  github,
  static,
  // solana,
  cdn,
}

extension StrategyExt on Strategy {
  String get name => switch (this) {
        Strategy.github => 'GitHub',
        Strategy.static => 'Static',
        // Strategy.solana => 'Solana',
        Strategy.cdn => 'CDN',
      };
}

/// Resolution for fetch token list
abstract class ResolutionStrategy {
  const ResolutionStrategy(this.repositories);

  final List<String> repositories;

  /// fetch token list. if catch Error, return [staticTokenList]
  Future<List<TokenInfo>> fetchTokenList() async {
    final responses = await Future.wait<TokenList>(
      repositories.map((url) async {
        try {
          final resp = await http.get(Uri.parse(url));
          final tokenList = TokenList.fromJson(json.decode(resp.body) as Map);
          return tokenList;
        } catch (e) {
          print(e);
          return staticTokenList;
        }
      }),
    );
    final tokenInfoList = responses
        .map((e) => e.tokens)
        .where((e) => e.isNotEmpty)
        .reduce((value, element) => value + element);
    return tokenInfoList.toList();
  }
}

/// static token list from json.
class StaticTokenListResolutionStrategy extends ResolutionStrategy {
  const StaticTokenListResolutionStrategy() : super(const <String>[]);

  @override
  Future<List<TokenInfo>> fetchTokenList() =>
      Future.value(staticTokenList.tokens);
}

class CDNTokenListResolutionStrategy extends ResolutionStrategy {
  const CDNTokenListResolutionStrategy()
      : super(const <String>[
          'https://cdn.jsdelivr.net/gh/solana-labs/token-list@main/src/tokens/solana.tokenlist.json',
        ]);
}

// class SolanaTokenListResolutionStrategy extends ResolutionStrategy {
//   const SolanaTokenListResolutionStrategy()
//       : super(const <String>[
//     'https://token-list.solana.com/solana.tokenlist.json'
//   ]);
// }

class GitHubTokenListResolutionStrategy extends ResolutionStrategy {
  const GitHubTokenListResolutionStrategy()
      : super(const <String>[
          'https://raw.githubusercontent.com/solana-labs/token-list/main/src/tokens/solana.tokenlist.json',
        ]);
}
