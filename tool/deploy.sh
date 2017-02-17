#!/bin/bash -e
# Copyright 2016 Google Inc. Use of this source code is governed by an MIT-style
# license that can be found in the LICENSE file or at
# https://opensource.org/licenses/MIT.

openssl aes-256-cbc -K $encrypted_d18df560dfb2_key -iv $encrypted_d18df560dfb2_iv \
        -in tool/encrypted/npmrc.enc -out ~/.npmrc -d
npm publish build/npm

mkdir -p ~/.pub-cache
openssl aes-256-cbc -K $encrypted_d18df560dfb2_key -iv $encrypted_d18df560dfb2_iv \
        -in tool/encrypted/pub-credentials.json.enc -out ~/.pub-cache/credentials.json -d
pub lish

pub run grinder chocolatey_release
