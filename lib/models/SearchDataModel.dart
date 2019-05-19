///
/// project: flight_reservouir
/// @package: models
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-05-19

class SearchDataModel {
  List<SearchData> data;

  SearchDataModel({this.data});

  SearchDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<SearchData>();
      json['data'].forEach((v) {
        data.add(new SearchData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchData {
  String type;
  String id;
  List<OfferItems> offerItems;

  SearchData({this.type, this.id, this.offerItems});

  SearchData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    if (json['offerItems'] != null) {
      offerItems = new List<OfferItems>();
      json['offerItems'].forEach((v) {
        offerItems.add(new OfferItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    if (this.offerItems != null) {
      data['offerItems'] = this.offerItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OfferItems {
  List<Services> services;
  Price price;
  PricePerAdult pricePerAdult;

  OfferItems({this.services, this.price, this.pricePerAdult});

  OfferItems.fromJson(Map<String, dynamic> json) {
    if (json['services'] != null) {
      services = new List<Services>();
      json['services'].forEach((v) {
        services.add(new Services.fromJson(v));
      });
    }
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    pricePerAdult = json['pricePerAdult'] != null
        ? new PricePerAdult.fromJson(json['pricePerAdult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.services != null) {
      data['services'] = this.services.map((v) => v.toJson()).toList();
    }
    if (this.price != null) {
      data['price'] = this.price.toJson();
    }
    if (this.pricePerAdult != null) {
      data['pricePerAdult'] = this.pricePerAdult.toJson();
    }
    return data;
  }
}

class Services {
  List<Segments> segments;

  Services({this.segments});

  Services.fromJson(Map<String, dynamic> json) {
    if (json['segments'] != null) {
      segments = new List<Segments>();
      json['segments'].forEach((v) {
        segments.add(new Segments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.segments != null) {
      data['segments'] = this.segments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Segments {
  FlightSegment flightSegment;
  PricingDetailPerAdult pricingDetailPerAdult;

  Segments({this.flightSegment, this.pricingDetailPerAdult});

  Segments.fromJson(Map<String, dynamic> json) {
    flightSegment = json['flightSegment'] != null
        ? new FlightSegment.fromJson(json['flightSegment'])
        : null;
    pricingDetailPerAdult = json['pricingDetailPerAdult'] != null
        ? new PricingDetailPerAdult.fromJson(json['pricingDetailPerAdult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.flightSegment != null) {
      data['flightSegment'] = this.flightSegment.toJson();
    }
    if (this.pricingDetailPerAdult != null) {
      data['pricingDetailPerAdult'] = this.pricingDetailPerAdult.toJson();
    }
    return data;
  }
}

class FlightSegment {
  Departure departure;
  Arrival arrival;
  String carrierCode;
  String number;
  Aircraft aircraft;
  Operating operating;
  String duration;

  FlightSegment(
      {this.departure,
        this.arrival,
        this.carrierCode,
        this.number,
        this.aircraft,
        this.operating,
        this.duration});

  FlightSegment.fromJson(Map<String, dynamic> json) {
    departure = json['departure'] != null
        ? new Departure.fromJson(json['departure'])
        : null;
    arrival =
    json['arrival'] != null ? new Arrival.fromJson(json['arrival']) : null;
    carrierCode = json['carrierCode'];
    number = json['number'];
    aircraft = json['aircraft'] != null
        ? new Aircraft.fromJson(json['aircraft'])
        : null;
    operating = json['operating'] != null
        ? new Operating.fromJson(json['operating'])
        : null;
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.departure != null) {
      data['departure'] = this.departure.toJson();
    }
    if (this.arrival != null) {
      data['arrival'] = this.arrival.toJson();
    }
    data['carrierCode'] = this.carrierCode;
    data['number'] = this.number;
    if (this.aircraft != null) {
      data['aircraft'] = this.aircraft.toJson();
    }
    if (this.operating != null) {
      data['operating'] = this.operating.toJson();
    }
    data['duration'] = this.duration;
    return data;
  }
}

class Departure {
  String iataCode;
  String terminal;
  String at;

  Departure({this.iataCode, this.terminal, this.at});

  Departure.fromJson(Map<String, dynamic> json) {
    iataCode = json['iataCode'];
    terminal = json['terminal'];
    at = json['at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iataCode'] = this.iataCode;
    data['terminal'] = this.terminal;
    data['at'] = this.at;
    return data;
  }
}

class Arrival {
  String iataCode;
  String terminal;
  String at;

  Arrival({this.iataCode, this.terminal, this.at});

  Arrival.fromJson(Map<String, dynamic> json) {
    iataCode = json['iataCode'];
    terminal = json['terminal'];
    at = json['at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iataCode'] = this.iataCode;
    data['terminal'] = this.terminal;
    data['at'] = this.at;
    return data;
  }
}

class Aircraft {
  String code;

  Aircraft({this.code});

  Aircraft.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    return data;
  }
}

class Operating {
  String carrierCode;
  String number;

  Operating({this.carrierCode, this.number});

  Operating.fromJson(Map<String, dynamic> json) {
    carrierCode = json['carrierCode'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['carrierCode'] = this.carrierCode;
    data['number'] = this.number;
    return data;
  }
}

class PricingDetailPerAdult {
  String travelClass;
  String fareClass;
  int availability;
  String fareBasis;

  PricingDetailPerAdult(
      {this.travelClass, this.fareClass, this.availability, this.fareBasis});

  PricingDetailPerAdult.fromJson(Map<String, dynamic> json) {
    travelClass = json['travelClass'];
    fareClass = json['fareClass'];
    availability = json['availability'];
    fareBasis = json['fareBasis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['travelClass'] = this.travelClass;
    data['fareClass'] = this.fareClass;
    data['availability'] = this.availability;
    data['fareBasis'] = this.fareBasis;
    return data;
  }
}

class Price {
  String total;
  String totalTaxes;

  Price({this.total, this.totalTaxes});

  Price.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalTaxes = json['totalTaxes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['totalTaxes'] = this.totalTaxes;
    return data;
  }
}

class PricePerAdult {
  String total;
  String totalTaxes;

  PricePerAdult({this.total, this.totalTaxes});

  PricePerAdult.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalTaxes = json['totalTaxes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['totalTaxes'] = this.totalTaxes;
    return data;
  }
}

