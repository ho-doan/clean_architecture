import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

// void main(List<String> args, SendPort sendPort) {
//   startPlugin(sendPort, _CleanArchitecture());
// }

PluginBase createPlugin() => _CleanArchitecture();

class _CleanArchitecture extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        UseCaseLintCode(),
        RepositoryLintCode(),
      ];

  @override
  List<Assist> getAssists() => [];
}

class UseCaseLintCode extends DartLintRule {
  UseCaseLintCode() : super(code: _code);
  static const _code = LintCode(
    name: 'clean_architecture',
    problemMessage: 'This is not Repository',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    // print('object============');
    // print(resolver.source.fullName);
    // print(resolver.source.shortName);
    // print(resolver.source.contents.data);
    // print(resolver.source.contents.modificationTime);
    final fileName = resolver.source.shortName;

    final useCase = fileName.toLowerCase().contains('use_case');

    context.registry.addVariableDeclaration((node) {
      if (useCase) {
        final repository =
            node.name.lexeme.toLowerCase().contains('repository');
        if (!repository) {
          reporter.reportErrorForNode(code, node);
        }
      }
    });
    context.registry.addAdjacentStrings((node) {
      reporter.reportErrorForNode(
        LintCode(
            name: 'clean_architecture', problemMessage: 'addAdjacentStrings'),
        node,
      );
    });

    // context.registry.addAnnotatedNode((node) {
    //   reporter.reportErrorForNode(
    //       LintCode(name: 'clean_architecture', problemMessage: 'addAnnotatedNode'), node);
    // });
    // context.registry.addAnnotation((node) {
    //   reporter.reportErrorForNode(
    //       LintCode(name: 'clean_architecture', problemMessage: 'addAnnotation'), node);
    // });
    // context.registry.addArgumentList((node) {
    //   reporter.reportErrorForNode(
    //       LintCode(name: 'clean_architecture', problemMessage: 'addArgumentList'), node);
    // });
    // context.registry.addAssertStatement((node) {
    //   reporter.reportErrorForNode(
    //       LintCode(name: 'clean_architecture', problemMessage: 'addArgumentList'), node);
    // });
  }
}

class RepositoryLintCode extends DartLintRule {
  RepositoryLintCode() : super(code: _code);
  static const _code = LintCode(
    name: 'clean_architecture',
    problemMessage: 'This is not DataSource',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    final fileName = resolver.source.shortName;

    final useCase = fileName.toLowerCase().contains('repository');

    context.registry.addVariableDeclaration((node) {
      if (useCase) {
        final dataSource =
            node.name.lexeme.toLowerCase().contains('DataSource'.toLowerCase());
        if (!dataSource) {
          reporter.reportErrorForNode(code, node);
        }
      }
    });
  }
}

class DataSourceLintCode extends DartLintRule {
  DataSourceLintCode() : super(code: _code);
  static const _code = LintCode(
    name: 'clean_architecture',
    problemMessage: 'This is not DataSource',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    final fileName = resolver.source.shortName;

    final useCase = fileName.toLowerCase().contains('repository');

    context.registry.addVariableDeclaration((node) {
      if (useCase) {
        final dataSource =
            node.name.lexeme.toLowerCase().contains('DataSource'.toLowerCase());
        if (!dataSource) {
          reporter.reportErrorForNode(code, node);
        }
      }
    });
  }
}
