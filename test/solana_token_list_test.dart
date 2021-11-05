import 'package:solana_token_list/solana_token_list.dart';
import 'package:test/test.dart';

void main() {
  test('Token list is filterable by a tag', () async {
    final list = (await TokenListStrategy().fetchTokenList(Strategy.static))
        .filterByChainEnv(ChainEnv.mainNetBeta)
        .filterByTag('nft');

    assert(list.where((token) => token.symbol == 'SOL').isEmpty);
  });
  test('Token list can exclude by a tag', () async {
    final list = (await TokenListStrategy().fetchTokenList(Strategy.static))
        .filterByChainEnv(ChainEnv.mainNetBeta)
        .excludeByTag('nft');

    assert(list.where((token) => token.symbol == 'nft').isEmpty);
  });

  test('Token list can exclude by a chain', () async {
    final list = (await TokenListStrategy().fetchTokenList(Strategy.static))
        .excludeByChainEnv(ChainEnv.mainNetBeta);

    assert(list
        .where((token) => token.chainId == ChainEnv.mainNetBeta.chainId)
        .isEmpty);
  });

  test('Token list returns  object upon filter', () async {
    final list = await TokenListStrategy().fetchTokenList(Strategy.static);
    final filtered = list.filterByChainEnv(ChainEnv.mainNetBeta);
    assert(list.length != filtered.length);
  });

  test(
      'Token list is empty  when calling filterByClusterSlug with slug that does not exist',
      () async {
    final list = await TokenListStrategy().fetchTokenList(Strategy.static);
    final filtered = list.filterByClusterSlug('whoop');
    assert(filtered.isEmpty);
  });

  test('Token list does not have duplicate entries', () async {
    final list = await TokenListStrategy().fetchTokenList(Strategy.static);
    final map = <String, TokenInfo>{};
    list.filterByChainEnv(ChainEnv.mainNetBeta).forEach((token) {
      if (map.containsKey(token.address)) {
        print('Token Address: ${token.address}');
      }
      assert(!map.containsKey(token.address));
      map[token.address] = token;
    });
  });
}
