import 'package:equatable/equatable.dart';
import 'package:RedditCloneMobile/models/models.dart';

abstract class ComplaintCategoryState extends Equatable {
  const ComplaintCategoryState();

  @override
  List<Object> get props => [];
}

class ComplaintCategoriesLoading extends ComplaintCategoryState {}
class ComplaintCategoriesLoaded extends ComplaintCategoryState {
  final List<ComplaintCategory> complaintCategories;
  const ComplaintCategoriesLoaded({this.complaintCategories}) : assert(complaintCategories != null);

  @override
  List<Object> get props => [complaintCategories];
}
class ComplaintCategoriesNotLoaded extends ComplaintCategoryState {}

class ComplaintCategoryLoading extends ComplaintCategoryState {}
class ComplaintCategoryLoaded extends ComplaintCategoryState {
  final ComplaintCategory complaintCategory;
  const ComplaintCategoryLoaded({this.complaintCategory}) : assert(complaintCategory != null);

  @override
  List<Object> get props => [complaintCategory];
}
class ComplaintCategoryNotLoaded extends ComplaintCategoryState {}

class ComplaintCategoryError extends ComplaintCategoryState {}