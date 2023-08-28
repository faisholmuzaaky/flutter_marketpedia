import 'package:bloc/bloc.dart';

class CarouselCubit extends Cubit<int> {
  CarouselCubit() : super(0);

  int index = 0;

  void setCarousel(int newPage) {
    index = newPage;
    emit(index);
  }
}
