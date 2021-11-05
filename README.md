Solana Token Registry is a package that allows application to query for list of tokens. The JSON schema for the tokens includes: chainId, address, name, decimals, symbol, logoURI (optional), tags (optional), and custom extensions metadata.

[![pub package](https://img.shields.io/pub/v/solana_token_list.svg)](https://pub.dev/packages/solana_token_list)

## Usage

A simple usage example:

```dart
import 'package:solana_token_list/solana_token_list.dart';

main() async {
   var tokens = await TokenListStrategy().fetchTokenList(strategy: Strategy.CDN);
}
```

