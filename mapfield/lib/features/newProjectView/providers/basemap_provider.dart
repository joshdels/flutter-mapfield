import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedBasemapNotifier extends Notifier<String> {
  @override


  
  String build() => 'Satellite';

  void setBasemap(String name) {
    state = name;
  }
}
