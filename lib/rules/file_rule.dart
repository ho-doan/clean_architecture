import 'package:analyzer/error/listener.dart';
import 'package:change_case/change_case.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:sugi_lint/utils/ext/string_ext.dart';
import '../utils/ext/resolver_ext.dart';

const _title = 'file_name';
const _body = 'File name is valid';

const _code = LintCode(name: _title, problemMessage: _body);

class FileRuleCode extends DartLintRule {
  FileRuleCode() : super(code: _code);

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addCompilationUnit((node) {
      final part = resolver.fileName.specChar;

      bool check = false;

      if (part.toSnakeCase() != part) {
        check = true;
      }
      if (part.replaceAll(RegExp(r'\W'), '_') != part) {
        check = true;
      }

      if (check) {
        reporter.reportErrorForNode(_code, node);
      }
    });
  }
}
