import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_offices_usecase.dart';
import 'activation_offices_state.dart';

@injectable
class ActivationOfficesCubit extends Cubit<ActivationOfficesState> {
  final GetOfficesUseCase _getOfficesUseCase;

  ActivationOfficesCubit(this._getOfficesUseCase)
      : super(const ActivationOfficesState.initial());

  Future<void> loadOffices() async {
    emit(const ActivationOfficesState.loading());
    final result = await _getOfficesUseCase(NoParams());
    result.fold(
      (failure) => emit(ActivationOfficesState.error(failure.message)),
      (offices) => emit(ActivationOfficesState.loaded(offices)),
    );
  }
}
