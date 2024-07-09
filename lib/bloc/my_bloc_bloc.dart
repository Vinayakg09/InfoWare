import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoware_assign/data/data.dart';
import 'package:meta/meta.dart';

part 'my_bloc_event.dart';
part 'my_bloc_state.dart';

class MyBlocBloc extends Bloc<MyBlocEvent, MyBlocState> {
  final DataProvider data;
  MyBlocBloc(this.data) : super(MyBlocInitial()) {
    on<FetchData>(_onFetchData);
  }

  void _onFetchData(FetchData event, Emitter<MyBlocState> emit) async {
    emit(Loading());

    try {
      final List<dynamic>itemData = await data.getData();
      print(itemData);
      emit(Success(itemData));
    } catch (e) {
      print("Error: $e");
      emit(Failure(e.toString()));
    }
  }
}
