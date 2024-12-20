import 'package:bookly/Features/home/data_layer/repository/home_repo.dart';
import 'package:bookly/Features/home/domain/entitis/book_entity.dart';
import 'package:bookly/Features/home/domain/usecases/fetch_featured_book_usecase.dart';
import 'package:bookly/Features/home/domain/usecases/fetch_newest_book_usecase.dart';
import 'package:bookly/Features/home/manager/Featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/functions/dependency.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(featuresBox);
  await Hive.openBox<BookEntity>(newestBox);
  Bloc.observer = MyBlocObserver();
  await getDepenency();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FeaturedBooksCubit>(
          create: (context) => FeaturedBooksCubit(
              FetchFeaturedBookUseCase(sl.get<HomeRepositoryImp>()))
            ..getFeaturesBooks(),
        ),
        BlocProvider<NewestBooksCubit>(
          create: (context) => NewestBooksCubit(
              FetchNewestBookUseCase(sl.get<HomeRepositoryImp>()))
            ..getNewestBooks(),
        ),
      ] ,
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
