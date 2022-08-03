class IItemSelectDropdown {
  final String id;
  final String name;
  IItemSelectDropdown({
    required this.id,
    required this.name,
  });

  factory IItemSelectDropdown.fromJson(Map<String, dynamic> map) {
    return IItemSelectDropdown(
      id: map["id"],
      name: map["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
