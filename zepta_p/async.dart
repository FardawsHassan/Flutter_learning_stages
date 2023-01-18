import 'dart:io';

void main() async {
  taska();
  await taskb();
  taskc();
}

taska() {
  print('task a');
}

taskb() async {
  Duration time = Duration(seconds: 3);
  var a = 'aa';
  await Future.delayed(time, (() {
    print('task $a');
  }));
  print('task outer b');
}

taskc() {
  print('task c');
}
