import 'package:analyzer/error/listener.dart';
import 'package:change_case/change_case.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:sugi_lint/utils/ext/string_ext.dart';

const _title = 'class_name';
const _body = 'Class name is valid';

const _code = LintCode(name: _title, problemMessage: _body);

class ClassRuleCode extends DartLintRule {
  ClassRuleCode() : super(code: _code);

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addClassDeclaration((node) {
      final className = node.name.lexeme;

      bool check = false;

      print(
          'addClassDeclaration class name ${className.specChar.toPascalCase()} ${className.specChar}');

      if (!(className.specChar.toPascalCase() == className.specChar)) {
        check = true;
      }

      if (check) {
        reporter.reportErrorForNode(_code, node);
      }
    });

    context.registry.addClassTypeAlias((node) {
      final className = node.name.lexeme;

      bool check = false;

      print(
          'addClassTypeAlias class name ${className.specChar.toPascalCase()} ${className.specChar}');

      if (!(className.specChar.toPascalCase() == className.specChar)) {
        check = true;
      }

      if (check) {
        reporter.reportErrorForNode(_code, node);
      }
    });
    // context.registry.addGenericTypeAlias((node) {
    //   final className = node.name.lexeme;

    //   bool check = false;

    //   print(
    //       'addGenericTypeAlias class name ${className.specChar.toPascalCase()} ${className.specChar}');

    //   if (!(className.specChar.toPascalCase() == className.specChar)) {
    //     check = true;
    //   }

    //   if (check) {
    //     reporter.reportErrorForNode(_code, node);
    //   }
    // });
    // context.registry.addGenericTypeAlias((node) {
    //   final className = node.name.lexeme;

    //   bool check = false;

    //   print(
    //       'addGenericTypeAlias class name ${className.specChar.toPascalCase()} ${className.specChar}');

    //   if (!(className.specChar.toPascalCase() == className.specChar)) {
    //     check = true;
    //   }

    //   if (check) {
    //     reporter.reportErrorForNode(_code, node);
    //   }
    // });
    // context.registry.addFunctionTypeAlias((node) {
    //   final className = node.name.lexeme;

    //   bool check = false;

    //   print(
    //       'addFunctionTypeAlias class name ${className.specChar.toPascalCase()} ${className.specChar}');

    //   if (!(className.specChar.toPascalCase() == className.specChar)) {
    //     check = true;
    //   }

    //   if (check) {
    //     reporter.reportErrorForNode(_code, node);
    //   }
    // });
  }
}
