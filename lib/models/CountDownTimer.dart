class CountDownTimer {
  int work;
  bool _isActive = false;

  CountDownTimer({required this.work});

  Stream countDown() async* {
    for (int i = work; i >= 0; i--) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }
}
