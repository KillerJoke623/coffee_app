class Drink {
  final String name;
  final String category;
  final String? description;
  final List<int>? sizes; // Список доступных размеров в мл
  final List<int>? prices; // Список цен, соответствующих размерам
  final String? imageUrl; // URL изображения напитка

  Drink({
    required this.name,
    required this.category,
    this.description,
    this.sizes,
    this.prices,
    this.imageUrl,
  });
}