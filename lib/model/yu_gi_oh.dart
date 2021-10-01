import 'dart:convert';

class YuGiOh {
  YuGiOh({
    this.data = const <Datum>[],
    this.meta,
  });

  List<Datum> data;
  Meta? meta;

  factory YuGiOh.fromJson(String str) {
    return YuGiOh.fromMap(json.decode(str));
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory YuGiOh.fromMap(Map<String, dynamic> json) {
    return YuGiOh(
      data: List<Datum>.from(json["data"].map((x) {
        return Datum.fromMap(x);
      })),
      meta: Meta.fromMap(json["meta"]),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "data": List<dynamic>.from(data.map((x) => x.toMap())),
      "meta": meta?.toMap(),
    };
  }
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.type,
    this.desc,
    this.race,
    this.archetype,
    this.cardSets,
    this.cardImages,
    this.cardPrices,
    this.atk,
    this.def,
    this.level,
    this.attribute,
    this.banlistInfo,
  });

  int? id;
  String? name;
  String? type;
  String? desc;
  String? race;
  String? archetype;
  List<CardSet>? cardSets;
  List<CardImage>? cardImages;
  List<CardPrice>? cardPrices;
  int? atk;
  int? def;
  int? level;
  String? attribute;
  BanlistInfo? banlistInfo;

  factory Datum.fromJson(String str) {
    return Datum.fromMap(json.decode(str));
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory Datum.fromMap(Map<String, dynamic> json) {
    return Datum(
      id: json["id"],
      name: json["name"],
      type: json["type"],
      desc: json["desc"],
      race: json["race"],
      archetype: json["archetype"],
      cardSets: json["card_sets"] == null
          ? null
          : List<CardSet>.from(
              json["card_sets"].map((x) => CardSet.fromMap(x)),
            ),
      cardImages: json["card_images"] == null
          ? null
          : List<CardImage>.from(
              json["card_images"].map((x) => CardImage.fromMap(x)),
            ),
      cardPrices: json["card_prices"] == null
          ? null
          : List<CardPrice>.from(
              json["card_prices"].map((x) => CardPrice.fromMap(x)),
            ),
      atk: json["atk"],
      def: json["def"],
      level: json["level"],
      attribute: json["attribute"],
      banlistInfo: json["banlist_info"] == null
          ? null
          : BanlistInfo.fromMap(json["banlist_info"]),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "type": type,
      "desc": desc,
      "race": race,
      "archetype": archetype,
      "card_sets": cardSets == null
          ? null
          : List<dynamic>.from(cardSets!.map((x) => x.toMap())),
      "card_images": cardImages == null
          ? null
          : List<dynamic>.from(cardImages!.map((x) => x.toMap())),
      "card_prices": cardPrices == null
          ? null
          : List<dynamic>.from(cardPrices!.map((x) => x.toMap())),
      "atk": atk,
      "def": def,
      "level": level,
      "attribute": attribute,
      "banlist_info": banlistInfo == null ? null : banlistInfo!.toMap(),
    };
  }
}

class BanlistInfo {
  BanlistInfo({
    this.banTcg,
    this.banOcg,
  });

  String? banTcg;
  String? banOcg;

  factory BanlistInfo.fromJson(String str) {
    return BanlistInfo.fromMap(json.decode(str));
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory BanlistInfo.fromMap(Map<String, dynamic> json) {
    return BanlistInfo(
      banTcg: json["ban_tcg"],
      banOcg: json["ban_ocg"],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "ban_tcg": banTcg,
      "ban_ocg": banOcg,
    };
  }
}

class CardImage {
  CardImage({
    this.id,
    this.imageUrl,
    this.imageUrlSmall,
  });

  int? id;
  String? imageUrl;
  String? imageUrlSmall;

  factory CardImage.fromJson(String str) {
    return CardImage.fromMap(json.decode(str));
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory CardImage.fromMap(Map<String, dynamic> json) {
    return CardImage(
      id: json["id"],
      imageUrl: json["image_url"],
      imageUrlSmall: json["image_url_small"],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "image_url": imageUrl,
      "image_url_small": imageUrlSmall,
    };
  }
}

class CardPrice {
  CardPrice({
    this.cardmarketPrice,
    this.tcgplayerPrice,
    this.ebayPrice,
    this.amazonPrice,
    this.coolstuffincPrice,
  });

  String? cardmarketPrice;
  String? tcgplayerPrice;
  String? ebayPrice;
  String? amazonPrice;
  String? coolstuffincPrice;

  factory CardPrice.fromJson(String str) {
    return CardPrice.fromMap(json.decode(str));
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory CardPrice.fromMap(Map<String, dynamic> json) {
    return CardPrice(
      cardmarketPrice: json["cardmarket_price"],
      tcgplayerPrice: json["tcgplayer_price"],
      ebayPrice: json["ebay_price"],
      amazonPrice: json["amazon_price"],
      coolstuffincPrice: json["coolstuffinc_price"],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "cardmarket_price": cardmarketPrice,
      "tcgplayer_price": tcgplayerPrice,
      "ebay_price": ebayPrice,
      "amazon_price": amazonPrice,
      "coolstuffinc_price": coolstuffincPrice,
    };
  }
}

class CardSet {
  CardSet({
    this.setName,
    this.setCode,
    this.setRarity,
    this.setRarityCode,
    this.setPrice,
  });

  String? setName;
  String? setCode;
  String? setRarity;
  String? setRarityCode;
  String? setPrice;

  factory CardSet.fromJson(String str) {
    return CardSet.fromMap(json.decode(str));
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory CardSet.fromMap(Map<String, dynamic> json) {
    return CardSet(
      setName: json["set_name"],
      setCode: json["set_code"],
      setRarity: json["set_rarity"],
      setRarityCode: json["set_rarity_code"],
      setPrice: json["set_price"],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "set_name": setName,
      "set_code": setCode,
      "set_rarity": setRarity,
      "set_rarity_code": setRarityCode,
      "set_price": setPrice,
    };
  }
}

class Meta {
  Meta({
    this.currentRows,
    this.totalRows,
    this.rowsRemaining,
    this.totalPages,
    this.pagesRemaining,
    this.nextPage,
    this.nextPageOffset,
  });

  int? currentRows;
  int? totalRows;
  int? rowsRemaining;
  int? totalPages;
  int? pagesRemaining;
  String? nextPage;
  int? nextPageOffset;

  factory Meta.fromJson(String str) {
    return Meta.fromMap(json.decode(str));
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory Meta.fromMap(Map<String, dynamic> json) {
    return Meta(
      currentRows: json["current_rows"],
      totalRows: json["total_rows"],
      rowsRemaining: json["rows_remaining"],
      totalPages: json["total_pages"],
      pagesRemaining: json["pages_remaining"],
      nextPage: json["next_page"],
      nextPageOffset: json["next_page_offset"],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "current_rows": currentRows,
      "total_rows": totalRows,
      "rows_remaining": rowsRemaining,
      "total_pages": totalPages,
      "pages_remaining": pagesRemaining,
      "next_page": nextPage,
      "next_page_offset": nextPageOffset,
    };
  }
}
