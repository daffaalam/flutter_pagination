import 'dart:convert';

class YuGiOh {
  List<Datum> data;
  Meta meta;

  YuGiOh({
    this.data,
    this.meta,
  });

  factory YuGiOh.fromJson(String str) => YuGiOh.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory YuGiOh.fromMap(Map<String, dynamic> json) => YuGiOh(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    meta: Meta.fromMap(json["meta"]),
  );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
    "meta": meta.toMap(),
  };
}

class Datum {
  int id;
  String name;
  String type;
  String desc;
  String race;
  String archetype;
  List<CardImage> cardImages;
  List<CardPrice> cardPrices;
  List<CardSet> cardSets;
  int atk;
  int def;
  int level;
  String attribute;

  Datum({
    this.id,
    this.name,
    this.type,
    this.desc,
    this.race,
    this.archetype,
    this.cardImages,
    this.cardPrices,
    this.cardSets,
    this.atk,
    this.def,
    this.level,
    this.attribute,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    desc: json["desc"],
    race: json["race"],
    archetype: json["archetype"] == null ? null : json["archetype"],
    cardImages: List<CardImage>.from(json["card_images"].map((x) => CardImage.fromMap(x))),
    cardPrices: List<CardPrice>.from(json["card_prices"].map((x) => CardPrice.fromMap(x))),
    cardSets: json["card_sets"] == null ? null : List<CardSet>.from(json["card_sets"].map((x) => CardSet.fromMap(x))),
    atk: json["atk"] == null ? null : json["atk"],
    def: json["def"] == null ? null : json["def"],
    level: json["level"] == null ? null : json["level"],
    attribute: json["attribute"] == null ? null : json["attribute"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "type": type,
    "desc": desc,
    "race": race,
    "archetype": archetype == null ? null : archetype,
    "card_images": List<dynamic>.from(cardImages.map((x) => x.toMap())),
    "card_prices": List<dynamic>.from(cardPrices.map((x) => x.toMap())),
    "card_sets": cardSets == null ? null : List<dynamic>.from(cardSets.map((x) => x.toMap())),
    "atk": atk == null ? null : atk,
    "def": def == null ? null : def,
    "level": level == null ? null : level,
    "attribute": attribute == null ? null : attribute,
  };
}

class CardImage {
  int id;
  String imageUrl;
  String imageUrlSmall;

  CardImage({
    this.id,
    this.imageUrl,
    this.imageUrlSmall,
  });

  factory CardImage.fromJson(String str) => CardImage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CardImage.fromMap(Map<String, dynamic> json) => CardImage(
    id: json["id"],
    imageUrl: json["image_url"],
    imageUrlSmall: json["image_url_small"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "image_url": imageUrl,
    "image_url_small": imageUrlSmall,
  };
}

class CardPrice {
  String cardMarketPrice;
  String tcgPlayerPrice;
  String ebayPrice;
  String amazonPrice;
  String coolStuffincPrice;

  CardPrice({
    this.cardMarketPrice,
    this.tcgPlayerPrice,
    this.ebayPrice,
    this.amazonPrice,
    this.coolStuffincPrice,
  });

  factory CardPrice.fromJson(String str) => CardPrice.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CardPrice.fromMap(Map<String, dynamic> json) => CardPrice(
    cardMarketPrice: json["cardmarket_price"],
    tcgPlayerPrice: json["tcgplayer_price"],
    ebayPrice: json["ebay_price"],
    amazonPrice: json["amazon_price"],
    coolStuffincPrice: json["coolstuffinc_price"],
  );

  Map<String, dynamic> toMap() => {
    "cardmarket_price": cardMarketPrice,
    "tcgplayer_price": tcgPlayerPrice,
    "ebay_price": ebayPrice,
    "amazon_price": amazonPrice,
    "coolstuffinc_price": coolStuffincPrice,
  };
}

class CardSet {
  String setName;
  String setCode;
  String setRarity;
  String setRarityCode;
  String setPrice;

  CardSet({
    this.setName,
    this.setCode,
    this.setRarity,
    this.setRarityCode,
    this.setPrice,
  });

  factory CardSet.fromJson(String str) => CardSet.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CardSet.fromMap(Map<String, dynamic> json) => CardSet(
    setName: json["set_name"],
    setCode: json["set_code"],
    setRarity: json["set_rarity"],
    setRarityCode: json["set_rarity_code"],
    setPrice: json["set_price"],
  );

  Map<String, dynamic> toMap() => {
    "set_name": setName,
    "set_code": setCode,
    "set_rarity": setRarity,
    "set_rarity_code": setRarityCode,
    "set_price": setPrice,
  };
}

class Meta {
  int currentRows;
  int totalRows;
  int rowsRemaining;
  int totalPages;
  int pagesRemaining;
  String previousPage;
  int previousPageOffset;
  String nextPage;
  int nextPageOffset;

  Meta({
    this.currentRows,
    this.totalRows,
    this.rowsRemaining,
    this.totalPages,
    this.pagesRemaining,
    this.previousPage,
    this.previousPageOffset,
    this.nextPage,
    this.nextPageOffset,
  });

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
    currentRows: json["current_rows"],
    totalRows: json["total_rows"],
    rowsRemaining: json["rows_remaining"],
    totalPages: json["total_pages"],
    pagesRemaining: json["pages_remaining"],
    previousPage: json["previous_page"],
    previousPageOffset: json["previous_page_offset"],
    nextPage: json["next_page"],
    nextPageOffset: json["next_page_offset"],
  );

  Map<String, dynamic> toMap() => {
    "current_rows": currentRows,
    "total_rows": totalRows,
    "rows_remaining": rowsRemaining,
    "total_pages": totalPages,
    "pages_remaining": pagesRemaining,
    "previous_page": previousPage,
    "previous_page_offset": previousPageOffset,
    "next_page": nextPage,
    "next_page_offset": nextPageOffset,
  };
}
