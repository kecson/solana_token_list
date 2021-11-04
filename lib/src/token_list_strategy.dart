import '../solana_token_list.dart' show TokenInfo;
import 'resolution_strategy.dart';

class TokenListStrategy {
  static const strategies = {
    Strategy.GitHub: GitHubTokenListResolutionStrategy(),
    Strategy.Static: StaticTokenListResolutionStrategy(),
    Strategy.Solana: SolanaTokenListResolutionStrategy(),
    Strategy.CDN: CDNTokenListResolutionStrategy(),
  };

  Future<List<TokenInfo>> fetchTokenList({
    Strategy strategy = Strategy.CDN,
  }) async {
    var resolutionStrategy = TokenListStrategy.strategies[strategy] ??
        const StaticTokenListResolutionStrategy();
    final tokenList = await resolutionStrategy.fetchTokenList();
    return tokenList;
  }
}
