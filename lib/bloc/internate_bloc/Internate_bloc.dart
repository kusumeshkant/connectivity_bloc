import 'package:bloc/bloc.dart';
import 'package:connectivity_bloc/bloc/internate_bloc/internateEvent.dart';
import 'package:connectivity_bloc/bloc/internate_bloc/internateState.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternateBloc extends Bloc<InternateEvents, InternateState> {
  Connectivity _connectivity = Connectivity();

  InternateBloc() : super(InternateInitialState()) {
    on<InternateConnectionLost>((event, emit) => emit(InternateLostState()));
    on<InternateConnectionConnected>(
        (event, emit) => emit(InternateConnectedState()));

    _connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {}
    });
  }
}
