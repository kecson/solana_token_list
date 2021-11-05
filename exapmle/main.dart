import 'package:solana_token_list/solana_token_list.dart';

void main() async {
  //Static Solana Tokens
  var staticTokens = staticTokenList.tokens;
  print('staticTokens size: ${staticTokens.length}');

  // fetch CDN Tokens
  var cdnTokens = await TokenListStrategy().fetchTokenList(strategy: Strategy.cdn);
  print('CDN solanaTokenList size: ${cdnTokens.length}');
}
