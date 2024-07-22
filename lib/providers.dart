import 'package:cripstv_academy/core/repositories/account_repository.dart';
import 'package:cripstv_academy/core/repositories/auth_repository.dart';
import 'package:cripstv_academy/core/repositories/jobs_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static final providers = <SingleChildWidget>[
    ListenableProvider(create: (_) => AuthRepository()),
    ListenableProvider(create: (_) => AccountRepository()),
     ListenableProvider(create: (_) => JobRepository()),
  ];
}
