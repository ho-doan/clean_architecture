import 'package:custom_lint_builder/custom_lint_builder.dart';

extension CustomLintResolverX on CustomLintResolver {
  String get fileName => source.shortName;
  String get partName => source.uri.toFilePath().split('lib').last;
}
