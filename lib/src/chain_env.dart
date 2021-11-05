/// solana cluster env
enum ChainEnv {
  mainNetBeta,
  testNet,
  devNet,
}

extension EnvExt on ChainEnv {
  int get chainId {
    int id;
    switch (this) {
      case ChainEnv.mainNetBeta:
        id = 101;
        break;
      case ChainEnv.testNet:
        id = 102;
        break;
      case ChainEnv.devNet:
        id = 103;
        break;
    }
    return id;
  }

  String get clusterName {
    String name;
    switch (this) {
      case ChainEnv.mainNetBeta:
        name = 'Mainnet-Beta';
        break;
      case ChainEnv.testNet:
        name = 'Testnet';
        break;
      case ChainEnv.devNet:
        name = 'DevNet';
        break;
    }
    return name;
  }
}
