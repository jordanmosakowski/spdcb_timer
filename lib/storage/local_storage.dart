@JS("localStorage")
library storage;

import 'package:js/js.dart';

@JS("getItem")
external String getItem(String key);
@JS("setItem")
external void setItem(String key, dynamic item);