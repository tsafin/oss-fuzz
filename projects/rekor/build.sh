#!/bin/bash -eu
# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

git clone --branch=dev https://github.com/AdamKorcz/go-118-fuzz-build $SRC/go-118-fuzz-build

go mod edit -replace github.com/AdamKorcz/go-118-fuzz-build=/src/go-118-fuzz-build
go install github.com/AdamKorcz/go-118-fuzz-build@dev
go get github.com/AdamKorcz/go-118-fuzz-build/testing

compile_native_go_fuzzer github.com/sigstore/rekor/pkg/sharding FuzzCreateEntryIDFromParts FuzzCreateEntryIDFromParts
compile_native_go_fuzzer github.com/sigstore/rekor/pkg/sharding FuzzGetUUIDFromIDString FuzzGetUUIDFromIDString
compile_native_go_fuzzer github.com/sigstore/rekor/pkg/sharding FuzzGetTreeIDFromIDString FuzzGetTreeIDFromIDString
compile_native_go_fuzzer github.com/sigstore/rekor/pkg/sharding FuzzPadToTreeIDLen FuzzPadToTreeIDLen
compile_native_go_fuzzer github.com/sigstore/rekor/pkg/sharding FuzzReturnEntryIDString FuzzReturnEntryIDString
compile_native_go_fuzzer github.com/sigstore/rekor/pkg/sharding FuzzTreeID FuzzTreeID
compile_native_go_fuzzer github.com/sigstore/rekor/pkg/sharding FuzzValidateUUID FuzzValidateUUID
compile_native_go_fuzzer github.com/sigstore/rekor/pkg/sharding FuzzValidateTreeID FuzzValidateTreeID
compile_native_go_fuzzer github.com/sigstore/rekor/pkg/sharding FuzzValidateEntryID FuzzValidateEntryID
compile_native_go_fuzzer github.com/sigstore/rekor/pkg/types/alpine FuzzPackageUnmarshal FuzzPackageUnmarshal
