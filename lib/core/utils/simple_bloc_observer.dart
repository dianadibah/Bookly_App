import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // ignore: avoid_print
    print("========= onChange: $change ");
    super.onChange(bloc, change);
  }

  @override
  void onCreate(BlocBase bloc) {
    // ignore: avoid_print
    print("========= OnCreateBloc: $Bloc ");
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    // ignore: avoid_print
    print("========= OnCloseBloc: $Bloc");
    super.onClose(bloc);
  }
  @override
  void onTransition(Bloc bloc, Transition transition) {
        // ignore: avoid_print
        print("My transaction:.::$transition");
    super.onTransition(bloc,transition);
  }
}
