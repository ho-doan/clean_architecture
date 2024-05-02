import 'package:analyzer/error/listener.dart';
import 'package:change_case/change_case.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import '../utils/ext/resolver_ext.dart';

const _title = 'folder_name';
const _body = 'Folder name is valid';

const _code = LintCode(name: _title, problemMessage: _body);

class FolderNameCode extends DartLintRule {
  FolderNameCode() : super(code: _code);

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addCompilationUnit((node) {
      final parts = resolver.partName.split('/');

      final partsNoFile = List.of(parts)..removeLast();

      bool check = false;

      for (final i in partsNoFile) {
        if (i.toSnakeCase() != i) {
          check = true;
        }
        if (i.replaceAll(RegExp(r'\W'), '_') != i) {
          check = true;
        }
      }
      if (check) {
        reporter.reportErrorForNode(_code, node);
      }
    });
  }
}
