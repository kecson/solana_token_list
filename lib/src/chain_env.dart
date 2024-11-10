/// solana cluster env
enum ChainEnv {
  mainNetBeta,
  testNet,
  devNet,
}

extension EnvExt on ChainEnv {
  int get chainId => switch (this) {
        ChainEnv.mainNetBeta => 101,
        ChainEnv.testNet => 102,
        ChainEnv.devNet => 103,
      };

  String get clusterName => switch (this) {
        ChainEnv.mainNetBeta => 'Mainnet-Beta',
        ChainEnv.testNet => 'Testnet',
        ChainEnv.devNet => 'DevNet',
      };
}
