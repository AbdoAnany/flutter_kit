import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

import '../../../../../app.dart';
import '../../../../../di.dart';
import '../../../../auth/domain/use_cases/logout_use_case.dart';
import '../../../../auth/helper/FailureUseCase.dart';
import '../../widgets/Mainbar.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late final LogoutUseCase logoutUseCase;
  static HomeBloc get(context) => BlocProvider.of(context);
  HomeBloc() : super(const HomeState(newPage: PageType.dashboard)) {
    on<HomeEvent>((event, emit) async {
      if (event is ChangePageEvent) {
        print('eeeeeeeeeeeeee  ${event.newPage}');

        emit(ChangePageState(newPage: event.newPage));
      }
    });
  }

  void changePage(context, PageType newPage) {
    MainBarControl.currentPage = newPage;
    add(ChangePageEvent(newPage));
  }

  Future<void> logout() async {
    await logoutUseCase.call(NoParams());
  }
}
