class ProfileModel {
  final int id;
  final String name;
  final String email;
  final double monthlyBudget;
  final String currencyCode;
  final String currencyName;
  final String currencySymbol;
  final String createdAt;
  final String updatedAt;

  const ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.monthlyBudget,
    required this.currencyCode,
    required this.currencyName,
    required this.currencySymbol,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProfileModel.defaultProfile() {
    final now = DateTime.now().toIso8601String();

    return ProfileModel(
      id: 1,
      name: 'Alex Thompson',
      email: 'alex.thompson@example.com',
      monthlyBudget: 2500.0,
      currencyCode: 'USD',
      currencyName: 'US Dollar',
      currencySymbol: r'$',
      createdAt: now,
      updatedAt: now,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'monthlyBudget': monthlyBudget,
      'currencyCode': currencyCode,
      'currencyName': currencyName,
      'currencySymbol': currencySymbol,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      monthlyBudget: (map['monthlyBudget'] as num).toDouble(),
      currencyCode: map['currencyCode'] as String,
      currencyName: map['currencyName'] as String,
      currencySymbol: map['currencySymbol'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }
}