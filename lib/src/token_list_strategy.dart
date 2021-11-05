import '../solana_token_list.dart' show TokenInfo;
import 'resolution_strategy.dart';

class TokenListStrategy {
  static const strategies = {
    Strategy.github: GitHubTokenListResolutionStrategy(),
    Strategy.static: StaticTokenListResolutionStrategy(),
    // Strategy.solana: SolanaTokenListResolutionStrategy(),
    Strategy.cdn: CDNTokenListResolutionStrategy(),
  };

  /// fetch token list.
  Future<List<TokenInfo>> fetchTokenList(
      [Strategy strategy = Strategy.cdn]) async {
    var resolutionStrategy = TokenListStrategy.strategies[strategy] ??
        const StaticTokenListResolutionStrategy();
    final tokenList = await resolutionStrategy.fetchTokenList();
    return tokenList;
  }
}
