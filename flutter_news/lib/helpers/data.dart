import 'package:flutter_news/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = CategoryModel();
  categoryModel.categoryName = 'All';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1563689977643-72168040d352?q=80&w=3173&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Business';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1507679799987-c73779587ccf?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Entertainment';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80';
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'General';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1434030216411-0b793f4b4173?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Health';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?q=80&w=3072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Science';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1532094349884-543bc11b234d?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Sports';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Technology';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1518770660439-4636190af475?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  category.add(categoryModel);

  return category;
}
