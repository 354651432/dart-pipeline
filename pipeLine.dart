T pipeLine<T>(T it, List<T Function(T)> list) {
  for (Function fun in list) {
    it = fun(it);
  }
  return it;
}

class PipeLine<T> {
  T it;
  List<T Function(T)> list = [];
  PipeLine(this.it);
  PipeLine via(T callback(T)) {
    list.add(callback);
    return this;
  }

  T build() {
    for (var callback in list) {
      it = callback(it);
    }
    return it;
  }
}
