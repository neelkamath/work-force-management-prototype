import 'package:link_checker/link_checker.dart';
import 'package:test/test.dart';

void main() => test(
    'dead links',
    () => expect(
        getBadLinksInDirectory(blacklistedFilePaths: [
          'pubspec.lock'
        ], blacklistedDirectories: [
          BlacklistedDirectory('android'),
          BlacklistedDirectory('ios'),
          BlacklistedDirectory('build'),
          BlacklistedDirectory('.idea')
        ]),
        emitsDone),
    timeout: Timeout.none);
