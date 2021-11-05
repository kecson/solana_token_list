// Copyright (c) 2017, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

import 'chain_env.dart';

part 'token_list.g.dart';

@JsonSerializable(anyMap: true)
class TokenExtensions {
  String? website;
  String? bridgeContract;
  String? assetContract;
  String? address;
  String? explorer;
  String? twitter;
  String? github;
  String? medium;
  String? tgann;
  String? tggroup;
  String? discord;
  String? serumV3Usdt;
  String? serumV3Usdc;
  String? coingeckoId;
  String? imageUrl;
  String? description;

  TokenExtensions({
    this.website,
    this.bridgeContract,
    this.assetContract,
    this.address,
    this.explorer,
    this.twitter,
    this.github,
    this.medium,
    this.tgann,
    this.tggroup,
    this.discord,
    this.serumV3Usdt,
    this.serumV3Usdc,
    this.coingeckoId,
    this.imageUrl,
    this.description,
  });

  factory TokenExtensions.fromJson(Map json) => _$TokenExtensionsFromJson(json);

  Map<String, dynamic> toJson() => _$TokenExtensionsToJson(this);
}

@JsonSerializable(anyMap: true)
class TokenList {
  String name;

  String logoURI;

  dynamic tags;
  String timestamp;

  List<TokenInfo> tokens;

  TokenList({
    required this.name,
    required this.logoURI,
    this.tags,
    required this.timestamp,
    required this.tokens,
  });

  factory TokenList.fromJson(Map json) => _$TokenListFromJson(json);

  Map<String, dynamic> toJson() => _$TokenListToJson(this);
}

@JsonSerializable(anyMap: true)
class TokenInfo {
  int chainId;

  ChainEnv get chainEnv {
    final env = ChainEnv.values.firstWhere((c) => c.chainId == chainId,
        orElse: () => ChainEnv.mainNet);
    return env;
  }

  String address;

  @JsonKey(defaultValue: '')
  String name;

  int decimals;
  String symbol;
  String? logoURI;
  List<String>? tags;

  @JsonKey()
  TokenExtensions? extensions;

  TokenInfo({
    required this.chainId,
    required this.address,
    required this.name,
    required this.decimals,
    required this.symbol,
    this.logoURI,
    this.tags,
    this.extensions,
  });

  factory TokenInfo.fromJson(Map json) => _$TokenInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TokenInfoToJson(this);
}

extension TokenInfoExt on List<TokenInfo> {
  Iterable<TokenInfo> filterByTag(String tag) =>
      where((t) => (t.tags ?? []).contains(tag));

  Iterable<TokenInfo> excludeByTag(String tag) =>
      where((t) => !(t.tags ?? []).contains(tag));

  Iterable<TokenInfo> filterByChainEnv(ChainEnv env) =>
      where((t) => t.chainId == env.chainId);

  Iterable<TokenInfo> excludeByChainEnv(ChainEnv env) =>
      where((t) => t.chainId != env.chainId);

  Iterable<TokenInfo> filterByClusterSlug(String slug) {
    if (clusterSlugs.containsKey(slug)) {
      return filterByChainEnv(clusterSlugs[slug]!);
    } else {
      print('Unknown slug: $slug, please use one of ${clusterSlugs.keys}');
      return const Iterable<TokenInfo>.empty();
    }
  }
}
