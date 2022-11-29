class Recipe {
  String title;
  String user;
  String imageUrl;
  String description;
  bool isFavorite;
  int favoriteCount;

  Recipe(this.title, this.user, this.imageUrl, this.description,
      this.isFavorite, this.favoriteCount);

  get obj =>
      Recipe(title, user, imageUrl, description, isFavorite, favoriteCount);

  get name => null;
}
