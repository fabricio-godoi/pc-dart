// Copyright (c) 2013-present, Iván Zaera Avellón - izaera@gmail.com

// This library is dually licensed under LGPL 3 and MPL 2.0. See file LICENSE for more information.

// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of
// the MPL was not distributed with this file, you can obtain one at http://mozilla.org/MPL/2.0/.

library cipher.impl.block_cipher.test.src.null_block_cipher;

import "dart:typed_data";

import "package:pointycastle/api.dart";
import "package:pointycastle/src/impl/base_block_cipher.dart";
import "package:pointycastle/src/registry/registry.dart";

/**
 * An implementation of a null [BlockCipher], that is, a cipher that does not encrypt, neither decrypt. It can be used for
 * testing or benchmarking chaining algorithms.
 */
class NullBlockCipher extends BaseBlockCipher {

  static final FactoryConfig FACTORY_CONFIG =
      new DynamicFactoryConfig.regex(r"^Null(?:-([0-9]+))?$", (_, Match match) {
        final int blockSize = match.group(1) == null ? 16 : int.parse(match.group(1));
        return () => new NullBlockCipher(blockSize);
      });

  final int blockSize;

  NullBlockCipher([this.blockSize=16]);

  String get algorithmName => "Null";

  void reset() {
  }

  void init( bool forEncryption, CipherParameters params ) {
  }

  int processBlock( Uint8List inp, int inpOff, Uint8List out, int outOff ) {
      out.setRange( outOff, outOff+blockSize, inp.sublist(inpOff) );
      return blockSize;
  }

}

