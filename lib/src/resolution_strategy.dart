import 'dart:convert';

import 'package:http/http.dart' as http;

import '../solana_token_list.dart';
import 'solana_tokens.dart';

enum Strategy {
  GitHub,
  Static,
  Solana,
  CDN,
}

extension StrategyExt on Strategy {
  String get name {
    String _name;
    switch (this) {
      case Strategy.GitHub:
        _name = 'GitHub';
        break;
      case Strategy.Static:
        _name = 'Static';
        break;
      case Strategy.Solana:
        _name = 'Solana';
        break;
      case Strategy.CDN:
        _name = 'CDN';
        break;
    }
    return _name;
  }
}

abstract class ResolutionStrategy {
  const ResolutionStrategy(this.repositories);

  final List<String> repositories;

  Future<List<TokenInfo>> fetchTokenList() async {
    final responses = await Future.wait<TokenList>(
      repositories.map((url) async {
        try {
          final resp = await http.get(Uri.parse(url));
          final tokenList = TokenList.fromJson(json.decode(resp.body));
          return tokenList;
        } catch (e) {
          print(e);
          return solanaTokenList;
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

class StaticTokenListResolutionStrategy extends ResolutionStrategy {
  const StaticTokenListResolutionStrategy() : super(const <String>[]);

  @override
  Future<List<TokenInfo>> fetchTokenList() {
    return Future.value(solanaTokenList.tokens);
  }
}

class CDNTokenListResolutionStrategy extends ResolutionStrategy {
  const CDNTokenListResolutionStrategy()
      : super(const <String>[
          'https://cdn.jsdelivr.net/gh/solana-labs/token-list@main/src/tokens/solana.tokenlist.json',
        ]);
}

class SolanaTokenListResolutionStrategy extends ResolutionStrategy {
  const SolanaTokenListResolutionStrategy()
      : super(const <String>[
          // Not Implemented Yet.;
        ]);
}

class GitHubTokenListResolutionStrategy extends ResolutionStrategy {
  const GitHubTokenListResolutionStrategy()
      : super(const <String>[
          'https://raw.githubusercontent.com/solana-labs/token-list/main/src/tokens/solana.tokenlist.json',
        ]);
}
