class User {
  final int? id;
  final String name;
  final String email;
  final String password;
  final String role;
  final String? phone;
  final String? city;
  final String? state;
  final String? orgName;
  final String? orgCnpj;
  final String? orgType;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.role = 'adopter',
    this.phone,
    this.city,
    this.state,
    this.orgName,
    this.orgCnpj,
    this.orgType,
  });

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        'name': name,
        'email': email,
        'password': password,
        'role': role,
        'phone': phone,
        'city': city,
        'state': state,
        'org_name': orgName,
        'org_cnpj': orgCnpj,
        'org_type': orgType,
      };

  static User fromMap(Map<String, dynamic> map) => User(
        id: map['id'],
        name: map['name'],
        email: map['email'],
        password: map['password'],
        role: map['role'] ?? 'adopter',
        phone: map['phone'],
        city: map['city'],
        state: map['state'],
        orgName: map['org_name'],
        orgCnpj: map['org_cnpj'],
        orgType: map['org_type'],
      );
}
