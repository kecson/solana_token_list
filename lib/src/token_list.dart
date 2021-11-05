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

/// token's info. chainId is one of [ChainEnv]. [address] is token's mint.
@JsonSerializable(anyMap: true)
class TokenInfo {
  int chainId;

  ChainEnv get chainEnv {
    final env = ChainEnv.values.firstWhere((c) => c.chainId == chainId,
        orElse: () => ChainEnv.mainNetBeta);
    return env;
  }

  String address;

  @JsonKey(defaultValue: '')
  String name;

  int decimals;
  String symbol;
  String? logoURI;
  @JsonKey(defaultValue: <String>[])
  List<String> tags;

  TokenExtensions? extensions;

  TokenInfo({
    required this.chainId,
    required this.address,
    required this.name,
    required this.decimals,
    required this.symbol,
    this.logoURI,
    this.tags = const <String>[],
    this.extensions,
  });

  factory TokenInfo.fromJson(Map json) => _$TokenInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TokenInfoToJson(this);
}

extension TokenInfoExt on Iterable<TokenInfo> {
  /// filter by token's [tag].
  Iterable<TokenInfo> filterByTag(String tag) =>
      where((t) => t.tags.contains(tag));

  /// include filter token exclude [tag].
  Iterable<TokenInfo> excludeByTag(String tag) =>
      where((t) => !t.tags.contains(tag));

  /// include filter token by [env]
  Iterable<TokenInfo> filterByChainEnv(ChainEnv env) =>
      where((t) => t.chainId == env.chainId);

  ///exclude filter token by [env]
  Iterable<TokenInfo> excludeByChainEnv(ChainEnv env) =>
      where((t) => t.chainId != env.chainId);

  /// filter token by cluster' name.
  ///
  /// * [slug] cluster' name
  Iterable<TokenInfo> filterByClusterSlug(String slug) {
    final clusterSlugs = ChainEnv.values.toList(growable: false);
    var where = clusterSlugs
        .where((c) => c.clusterName.toLowerCase() == slug.toLowerCase());
    if (where.isNotEmpty) {
      return filterByChainEnv(where.first);
    } else {
      final clusterNames =
          clusterSlugs.map((e) => e.clusterName).toList(growable: false);
      print('Unknown slug: $slug, please use one of $clusterNames');
      return const Iterable<TokenInfo>.empty();
    }
  }
}
