// Copyright 2017 Google Inc. Use of this source code is governed by an
// MIT-style license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:source_span/source_span.dart';

import 'io.dart';

// TODO(nweiz): We should probably expose this through the public API with a
// customizable callback. However, we need to decide whether we want to expose a
// notion of different log levels. Currently we only emit warnings, but will
// that always be the case?

/// A logger for printing warnings.
class Logger {
  /// Whether to use terminal colors in messages.
  final bool color;

  /// If `true`, warnings won't be printed.
  final bool quiet;

  Logger({this.color: false, this.quiet: false});

  /// Prints a warning to standard error, associated with [span].
  void warn(String message, FileSpan span) {
    var warning = color ? '\u001b[33m\u001b[1mWarning\u001b[0m' : 'WARNING';
    stderr.writeln("$warning on ${span.message("\n$message", color: color)}\n");
  }
}
