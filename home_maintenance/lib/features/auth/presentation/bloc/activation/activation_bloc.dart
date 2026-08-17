import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../domain/entities/activation_center.dart';
import '../../../domain/usecases/get_activation_centers_usecase.dart';

part 'activation_event.dart';
part 'activation_state.dart';
part 'activation_bloc.freezed.dart';

@injectable
class ActivationBloc extends Bloc<ActivationEvent, ActivationState> {
  final GetActivationCentersUseCase getActivationCentersUseCase;

  ActivationBloc(this.getActivationCentersUseCase) : super(const ActivationState.initial()) {
    on<_LoadCenters>(_onLoadCenters);
  }

  Future<void> _onLoadCenters(_LoadCenters event, Emitter<ActivationState> emit) async {
    emit(const ActivationState.loading());
    final result = await getActivationCentersUseCase(NoParams());
    result.fold(
      (failure) => emit(ActivationState.error(failure.message)),
      (centers) => emit(ActivationState.loaded(centers)),
    );
  }
}
