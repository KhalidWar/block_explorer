import 'package:block_explorer/services/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider((ref) => APIServices());
