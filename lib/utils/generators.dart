import 'package:uuid/uuid.dart';

String uniqueId() {
  final uuid = Uuid();
  return uuid.v4();
}
