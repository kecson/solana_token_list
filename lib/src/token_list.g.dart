// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenExtensions _$TokenExtensionsFromJson(Map json) => TokenExtensions(
      website: json['website'] as String?,
      bridgeContract: json['bridgeContract'] as String?,
      assetContract: json['assetContract'] as String?,
      address: json['address'] as String?,
      explorer: json['explorer'] as String?,
      twitter: json['twitter'] as String?,
      github: json['github'] as String?,
      medium: json['medium'] as String?,
      tgann: json['tgann'] as String?,
      tggroup: json['tggroup'] as String?,
      discord: json['discord'] as String?,
      serumV3Usdt: json['serumV3Usdt'] as String?,
      serumV3Usdc: json['serumV3Usdc'] as String?,
      coingeckoId: json['coingeckoId'] as String?,
      imageUrl: json['imageUrl'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TokenExtensionsToJson(TokenExtensions instance) =>
    <String, dynamic>{
      'website': instance.website,
      'bridgeContract': instance.bridgeContract,
      'assetContract': instance.assetContract,
      'address': instance.address,
      'explorer': instance.explorer,
      'twitter': instance.twitter,
      'github': instance.github,
      'medium': instance.medium,
      'tgann': instance.tgann,
      'tggroup': instance.tggroup,
      'discord': instance.discord,
      'serumV3Usdt': instance.serumV3Usdt,
      'serumV3Usdc': instance.serumV3Usdc,
      'coingeckoId': instance.coingeckoId,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
    };

TokenList _$TokenListFromJson(Map json) => TokenList(
      name: json['name'] as String,
      logoURI: json['logoURI'] as String,
      tags: json['tags'],
      timestamp: json['timestamp'] as String,
      tokens: (json['tokens'] as List<dynamic>)
          .map((e) => TokenInfo.fromJson(e as Map))
          .toList(),
    );

Map<String, dynamic> _$TokenListToJson(TokenList instance) => <String, dynamic>{
      'name': instance.name,
      'logoURI': instance.logoURI,
      'tags': instance.tags,
      'timestamp': instance.timestamp,
      'tokens': instance.tokens,
    };

TokenInfo _$TokenInfoFromJson(Map json) => TokenInfo(
      chainId: json['chainId'] as int,
      address: json['address'] as String,
      name: json['name'] as String? ?? '',
      decimals: json['decimals'] as int,
      symbol: json['symbol'] as String,
      logoURI: json['logoURI'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      extensions: json['extensions'] == null
          ? null
          : TokenExtensions.fromJson(json['extensions'] as Map),
    );

Map<String, dynamic> _$TokenInfoToJson(TokenInfo instance) => <String, dynamic>{
      'chainId': instance.chainId,
      'address': instance.address,
      'name': instance.name,
      'decimals': instance.decimals,
      'symbol': instance.symbol,
      'logoURI': instance.logoURI,
      'tags': instance.tags,
      'extensions': instance.extensions,
    };
