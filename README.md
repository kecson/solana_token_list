[Solana Token Registry](https://github.com/solana-labs/token-list) is a package that allows application to query for list of tokens. The JSON schema for the tokens includes: chainId, address, name, decimals, symbol, logoURI (optional), tags (optional), and custom extensions metadata.

[![pub package](https://img.shields.io/pub/v/solana_token_list.svg)](https://pub.dev/packages/solana_token_list)

## Using

Token list is filterable by a tag
```dart
import 'package:solana_token_list/solana_token_list.dart';

void main() async {
    final list = (await TokenListStrategy().fetchTokenList(Strategy.static))
        .filterByChainEnv(ChainEnv.mainNetBeta)
        .filterByTag('nft');}
```


Token list can exclude by a tag
```dart
   final list = (await TokenListStrategy().fetchTokenList(Strategy.static))
     .filterByChainEnv(ChainEnv.mainNetBeta)
     .excludeByTag('nft');
```


Token list can exclude by a chain
```dart
    final list = (await TokenListStrategy().fetchTokenList(Strategy.static))
        .excludeByChainEnv(ChainEnv.mainNetBeta);
```


Token list returns  object upon filter
```dart
    final list = await TokenListStrategy().fetchTokenList(Strategy.static);
    final filtered = list.filterByChainEnv(ChainEnv.mainNetBeta);
```


Token list is empty  when calling filterByClusterSlug with slug that does not exist
```dart
    final list = await TokenListStrategy().fetchTokenList(Strategy.static);
    final filtered = list.filterByClusterSlug('whoop');
```

