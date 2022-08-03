import 'package:chat_app/app/bindings/remote_source_bindings.dart';
import 'package:chat_app/app/bindings/repository_bindings.dart';

class DependencyInjection {
  static Future<void> init() async {
    RepositoryBindings().dependencies();
    RemoteSourceBindings().dependencies();
  }
}
