// Copyright (c) Facebook, Inc. and its affiliates.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.

namespace DictMissingKey;

function simple_ok(): int {
  $d = dict['hi' => 42, 'hello' => 52];
  return $d['hi'];
}

function simple_bad(): int {
  $d = dict['hi' => 42, 'hello' => 52];
  return $d['bye'];
}

function simple_empty_bad(): int {
  $d = dict[];
  return $d['bye'];
}

function simple_assign_bad(): int {
  $d = dict[];
  $d['hi'] = 42;
  $d['hello'] = 52;
  return $d['bye'];
}

function dict_argument(dict<string, int> $d): int {
  return $d['bye'];
}

function call_dict_argument_ok(): int {
  return dict_argument(dict['bye' => 42]);
}

function call_dict_argument_bad(): int {
  return dict_argument(dict['hi' => 42]);
}

function coalesce_ok(): int {
  $d = dict['hi' => 42];
  return $d['bye'] ?? 52;
}
