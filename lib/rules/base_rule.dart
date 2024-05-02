import 'package:analyzer/error/listener.dart';
import 'package:change_case/change_case.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import '../utils/ext/resolver_ext.dart';

const _baseFileName = 'folder_name';
const _baseFileNameCode = 'Folder name is valid';

class FolderNameCode extends DartLintRule {
  FolderNameCode() : super(code: _code);
  static const _code = LintCode(
    name: _baseFileName,
    problemMessage: 'This is not DataSource',
  );

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
      }
      if (check) {
        reporter.reportErrorForNode(
          LintCode(
            name: _baseFileName,
            problemMessage: _baseFileNameCode,
          ),
          node,
        );
      }
    });
  }
}
