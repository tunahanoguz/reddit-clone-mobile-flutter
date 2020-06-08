import 'package:bloc/bloc.dart';
import 'package:RedditCloneMobile/models/models.dart';
import 'package:RedditCloneMobile/repositories/repositories.dart';
import 'complaint_category_event.dart';
import 'complaint_category_state.dart';

class ComplaintCategoryBloc extends Bloc<ComplaintCategoryEvent, ComplaintCategoryState> {
  final ComplaintCategoryRepository complaintCategoryRepository;
  ComplaintCategoryBloc({this.complaintCategoryRepository}) : assert(complaintCategoryRepository != null);

  @override
  ComplaintCategoryState get initialState => ComplaintCategoriesLoading();

  @override
  Stream<ComplaintCategoryState> mapEventToState(ComplaintCategoryEvent event) async* {
    if (event is GetAllComplaintCategories) {
      yield ComplaintCategoriesLoading();

      try {
        List<ComplaintCategory> complaintCategories = await complaintCategoryRepository.getAll();
        yield ComplaintCategoriesLoaded(complaintCategories: complaintCategories);
      } catch (_) {
        yield ComplaintCategoriesNotLoaded();
      }
    } else if (event is GetSingleComplaintCategory) {
      yield ComplaintCategoryLoading();

      try {
        ComplaintCategory complaintCategory = await complaintCategoryRepository.getSingle(event.id);
        yield ComplaintCategoryLoaded(complaintCategory: complaintCategory);
      } catch (_) {
        yield ComplaintCategoryNotLoaded();
      }
    } else {
      yield ComplaintCategoryError();
    }
  }
}