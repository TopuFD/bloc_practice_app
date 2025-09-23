class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  UserModel({
    this.id = 0,
    this.name = '',
    this.username = '',
    this.email = '',
    Address? address,
    this.phone = '',
    this.website = '',
    Company? company,
  })  : address = address ?? Address(),
        company = company ?? Company();

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      address: Address.fromJson(json['address'] ?? {}),
      phone: json['phone'] ?? '',
      website: json['website'] ?? '',
      company: Company.fromJson(json['company'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "username": username,
      "email": email,
      "address": address.toJson(),
      "phone": phone,
      "website": website,
      "company": company.toJson(),
    };
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, username: $username, email: $email, phone: $phone, website: $website, company: ${company.name}, city: ${address.city})';
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({
    this.street = '',
    this.suite = '',
    this.city = '',
    this.zipcode = '',
    Geo? geo,
  }) : geo = geo ?? Geo();

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'] ?? '',
      suite: json['suite'] ?? '',
      city: json['city'] ?? '',
      zipcode: json['zipcode'] ?? '',
      geo: Geo.fromJson(json['geo'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "street": street,
      "suite": suite,
      "city": city,
      "zipcode": zipcode,
      "geo": geo.toJson(),
    };
  }

  @override
  String toString() {
    return 'Address(street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: $geo)';
  }
}

class Geo {
  final String lat;
  final String lng;

  Geo({this.lat = '', this.lng = ''});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'] ?? '',
      lng: json['lng'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "lat": lat,
      "lng": lng,
    };
  }

  @override
  String toString() {
    return 'Geo(lat: $lat, lng: $lng)';
  }
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({
    this.name = '',
    this.catchPhrase = '',
    this.bs = '',
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'] ?? '',
      catchPhrase: json['catchPhrase'] ?? '',
      bs: json['bs'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "catchPhrase": catchPhrase,
      "bs": bs,
    };
  }

  @override
  String toString() {
    return 'Company(name: $name, catchPhrase: $catchPhrase, bs: $bs)';
  }
}
