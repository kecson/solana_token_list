import 'package:solana_token_list/solana_token_list.dart';

void main() async {
  //Static Solana Tokens
  var staticTokens = staticTokenList.tokens;
  print('staticTokens size: ${staticTokens.length}');

  var tokenListStrategy = TokenListStrategy();

  // Fetch CDN Tokens
  final cdnTokens = await tokenListStrategy.fetchTokenList(Strategy.cdn);
  print('CDN solanaTokenList size: ${cdnTokens.length}');

  //Token list can exclude by a tag
  final noNftTokenList =
      (await tokenListStrategy.fetchTokenList(Strategy.static))
          .filterByChainEnv(ChainEnv.mainNetBeta)
          .excludeByTag('nft');

  //Filter by cluster name
  final list = cdnTokens.filterByClusterSlug('Mainnet-Beta');

  //Filter MainNet Beta tokens
  final mainNetList = cdnTokens.filterByChainEnv(ChainEnv.mainNetBeta);
}
