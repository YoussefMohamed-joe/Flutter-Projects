class OrganisationsModel {
  String? status;
  int? results;
  Data? data;

  OrganisationsModel({this.status, this.results, this.data});

  OrganisationsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['results'] = results;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Organizations>? organizations;

  Data({this.organizations});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['organizations'] != null) {
      organizations = <Organizations>[];
      json['organizations'].forEach((v) {
        organizations!.add(Organizations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (organizations != null) {
      data['organizations'] = organizations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Organizations {
  String? sId;
  String? name;
  String? slug;
  String? description;
  String? coverImage;
  int? phoneNumber;
  List<Locations>? locations;
  List<DonationOption>? donationOption;
  int? iV;
  List<String>? sliderImages;
  String? email;

  Organizations(
      {this.sId,
      this.name,
      this.slug,
      this.description,
      this.coverImage,
      this.phoneNumber,
      this.locations,
      this.donationOption,
      this.iV,
      this.sliderImages,
      this.email});

  Organizations.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    coverImage = json['coverImage'];
    phoneNumber = json['phoneNumber'];
    if (json['locations'] != null) {
      locations = <Locations>[];
      json['locations'].forEach((v) {
        locations!.add(Locations.fromJson(v));
      });
    }
    if (json['donationOption'] != null) {
      donationOption = <DonationOption>[];
      json['donationOption'].forEach((v) {
        donationOption!.add(DonationOption.fromJson(v));
      });
    }
    iV = json['__v'];
    sliderImages = json['sliderImages'].cast<String>();
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    data['description'] = description;
    data['coverImage'] = coverImage;
    data['phoneNumber'] = phoneNumber;
    if (locations != null) {
      data['locations'] = locations!.map((v) => v.toJson()).toList();
    }
    if (donationOption != null) {
      data['donationOption'] = donationOption!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    data['sliderImages'] = sliderImages;
    data['email'] = email;
    return data;
  }
}

class Locations {
  List<String>? type;
  List<double>? coordinates;
  String? address;
  String? sId;

  Locations({this.type, this.coordinates, this.address, this.sId});

  Locations.fromJson(Map<String, dynamic> json) {
    type = json['type'].cast<String>();
    coordinates = json['coordinates'].cast<double>();
    address = json['address'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['coordinates'] = coordinates;
    data['address'] = address;
    data['_id'] = sId;
    return data;
  }
}

class DonationOption {
  String? donationType;
  String? productImage;
  String? tagName;
  String? description;
  int? quantity;
  int? price;
  String? sId;

  DonationOption(
      {this.donationType,
      this.productImage,
      this.tagName,
      this.description,
      this.quantity,
      this.price,
      this.sId});

  DonationOption.fromJson(Map<String, dynamic> json) {
    donationType = json['donationType'];
    productImage = json['productImage'];
    tagName = json['tagName'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['donationType'] = donationType;
    data['productImage'] = productImage;
    data['tagName'] = tagName;
    data['description'] = description;
    data['quantity'] = quantity;
    data['price'] = price;
    data['_id'] = sId;
    return data;
  }
}
