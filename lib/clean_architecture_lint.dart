import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

// void main(List<String> args, SendPort sendPort) {
//   startPlugin(sendPort, _CleanArchitecture());
// }

final RegExp _regisGetIt = RegExp(r'/^.*getit.*$');
final RegExp _regisApi = RegExp(r'/^.*api.*$');
final RegExp _reClient = RegExp(r'/^.*client.*$');
final RegExp _regisUseCase = RegExp(r'/^.*usecase.*$');
final RegExp _regisRepo = RegExp(r'/^.*repository.*$');
final RegExp _regisDs = RegExp(r'/^.*datasource.*$');

const String _lintLib = 'clean_architecture';

const String _repoMess = 'This is not Repository';
const String _dsMess = 'This is not DataSource';

const String _api = 'api';
const String _client = 'client';
const String _useCase = 'usecase';
const String _useCaseFile = 'use_case';
const String _repository = 'repository';
const String _ds = 'datasource';

const _codeUs = LintCode(name: _lintLib, problemMessage: _repoMess);
const _codeRepo = LintCode(name: _lintLib, problemMessage: _dsMess);

extension VariableDeclarationX on VariableDeclaration {
  String get _name => name.toString();
  String get _type => declaredElement?.type.toString() ?? '';
  String get _value =>
      toSource().replaceAll(_name, '').replaceAll('=', '').trim();
}

extension CustomLintResolverX on CustomLintResolver {
  String get _fileName => source.shortName;
  bool get _isUseCaseFile => _fileName._isUseCaseFile;
  bool get _isRepoFile => _fileName._isRepo;
  bool get _isDsFile => _fileName._isDs;
}

extension StringX on String {
  String get low => toLowerCase();
  bool get _isUseCaseFile => low.contains(_useCaseFile);
  bool get _isApi => low.contains(_api) || _regisApi.hasMatch(low);
  bool get _isGetIt => _regisGetIt.hasMatch(low);
  bool get _isClient => low.contains(_client) || _reClient.hasMatch(low);
  bool get _isApiClient => _isApi || _isClient;
  bool get _isUseCase => low.contains(_useCase) || _regisUseCase.hasMatch(low);
  bool get _isRepo => low.contains(_repository) || _regisRepo.hasMatch(low);
  bool get _isDs => low.contains(_ds) || _regisDs.hasMatch(low);

  bool get checkNameUseCase => _isApiClient || _isDs || _isGetIt;
  bool get checkNameRepo => _isApiClient || _isUseCase || _isGetIt;
  bool get checkNameDs => _isUseCase || _isRepo || _isGetIt;
}

PluginBase createPlugin() => _CleanArchitectureLint();

class _CleanArchitectureLint extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        UseCaseLintCode(),
        RepositoryLintCode(),
      ];

  @override
  List<Assist> getAssists() => [];
}

class UseCaseLintCode extends DartLintRule {
  UseCaseLintCode() : super(code: _codeUs);

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addVariableDeclaration((node) {
      if (resolver._isUseCaseFile) {
        if (node._name.checkNameUseCase ||
            node._value.checkNameUseCase ||
            node._type.checkNameUseCase) {
          reporter.reportErrorForNode(code, node);
        }
      }
    });
    // context.registry.addAdjacentStrings((node) {
    //   reporter.reportErrorForNode(
    //     LintCode(name: _lintLib, problemMessage: 'addAdjacentStrings'),
    //     node,
    //   );
    // });

    // context.registry.addAnnotatedNode((node) {
    //   reporter.reportErrorForNode(
    //       LintCode(name: _lintLib, problemMessage: 'addAnnotatedNode'), node);
    // });
    // context.registry.addAnnotation((node) {
    //   reporter.reportErrorForNode(
    //       LintCode(name: _lintLib, problemMessage: 'addAnnotation'), node);
    // });
    // context.registry.addArgumentList((node) {
    //   reporter.reportErrorForNode(
    //       LintCode(name: _lintLib, problemMessage: 'addArgumentList'), node);
    // });
    // context.registry.addAssertStatement((node) {
    //   reporter.reportErrorForNode(
    //       LintCode(name: _lintLib, problemMessage: 'addArgumentList'), node);
    // });
  }
}

class RepositoryLintCode extends DartLintRule {
  RepositoryLintCode() : super(code: _codeRepo);

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addVariableDeclaration((node) {
      print('${node._type} ${node._name} ${node._value}');
      if (resolver._isDsFile) {
        if (node._name.checkNameRepo ||
            node._value.checkNameRepo ||
            node._type.checkNameRepo) {
          reporter.reportErrorForNode(code, node);
        }
      }
    });
  }
}

class DataSourceLintCode extends DartLintRule {
  DataSourceLintCode() : super(code: _code);
  static const _code = LintCode(
    name: _lintLib,
    problemMessage: 'This is not DataSource',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addVariableDeclaration((node) {
      if (resolver._isRepoFile) {
        if (node._name.checkNameDs ||
            node._value.checkNameDs ||
            node._type.checkNameDs) {
          reporter.reportErrorForNode(code, node);
        }
      }
    });
  }
}
