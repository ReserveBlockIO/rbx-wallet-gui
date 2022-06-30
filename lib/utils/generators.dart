import 'package:uuid/uuid.dart';

String uniqueId() {
  const uuid = Uuid();
  return uuid.v4();
}
