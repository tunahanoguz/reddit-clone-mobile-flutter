import 'package:equatable/equatable.dart';

abstract class ComplaintCategoryEvent extends Equatable {
  const ComplaintCategoryEvent();
}

class GetAllComplaintCategories extends ComplaintCategoryEvent {
  const GetAllComplaintCategories();

  @override
  List<Object> get props => [];
}

class GetSingleComplaintCategory extends ComplaintCategoryEvent {
  final int id;
  const GetSingleComplaintCategory({this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}