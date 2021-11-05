enum ChainEnv {
  mainNet,
  testNet,
  devNet,
}

extension EnvExt on ChainEnv {
  int get chainId {
    int id;
    switch (this) {
      case ChainEnv.mainNet:
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
}

const clusterSlugs = <String, ChainEnv>{
  'mainnet-beta': ChainEnv.mainNet,
  'testnet': ChainEnv.testNet,
  'devnet': ChainEnv.devNet,
};
