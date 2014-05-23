// Copyright (c) 2013, Iván Zaera Avellón - izaera@gmail.com
// Use of this source code is governed by a LGPL v3 license.
// See the LICENSE file for more information.

library cipher.test.api.registry_test;

import "package:cipher/impl/base.dart";
import "package:unittest/unittest.dart";

import "../test/registry_tests.dart";

void main() {

  initCipher();

  group("registry:", () {
    test("initCipher() can be called several times", () {
      initCipher();
      initCipher();
    });

    test("AsymmetricBlockCipher returns valid implementations", () {
      testAsymmetricBlockCipher("RSA");
      testAsymmetricBlockCipher("RSA/PKCS1");
    });

    test("BlockCipher returns valid implementations", () {
      testBlockCipher("AES");
    });

    test("Digest returns valid implementations", () {
      testDigest("MD2");
      testDigest("MD4");
      testDigest("MD5");
      testDigest("RIPEMD-128");
      testDigest("RIPEMD-160");
      testDigest("RIPEMD-256");
      testDigest("RIPEMD-320");
      testDigest("SHA-1");
      testDigest("SHA-224");
      testDigest("SHA-256");
      testDigest("SHA-3/512");
      testDigest("SHA-384");
      testDigest("SHA-512");
      testDigest("SHA-512/448");
      testDigest("Tiger");
      testDigest("Whirlpool");
    });

    test("ECDomainParameters returns valid implementations", () {
      testECDomainParameters("prime192v1");
    });

    test("EntropySource returns valid implementations", () {
      testEntropySource("");
      testEntropySource("Fortuna");
      testEntropySource("RIPEMD-256/Fortuna");
      testEntropySource("SHA-256/Fortuna");
    });

    test("EntropyCollector returns valid implementations", () {
      testEntropyCollector("Jitter");
      testEntropyCollector("SHA-256/Fortuna/EntropyCollector");
    });

    test("EntropyEstimator returns valid implementations", () {
      testEntropyEstimator("Mean");
      testEntropyEstimator("Shannon");
    });

    test("KeyDerivator returns valid implementations", () {
      testKeyDerivator("SHA-1/HMAC/PBKDF2");
      testKeyDerivator("scrypt");
    });

    test("KeyGenerator returns valid implementations", () {
      testKeyGenerator("EC");
      testKeyGenerator("RSA");
    });

    test("Mac returns valid implementations", () {
      testMac("SHA-1/HMAC");
      testMac("SHA-256/HMAC");
      testMac("RIPEMD-160/HMAC");
    });

    test("BlockCipher returns valid implementations for modes of operation", () {
      testBlockCipher("AES/CBC");
      testBlockCipher("AES/CFB-64");
      testBlockCipher("AES/CTR");
      testBlockCipher("AES/ECB");
      testBlockCipher("AES/OFB-64/GCTR");
      testBlockCipher("AES/OFB-64");
      testBlockCipher("AES/SIC");
    });

    test("PaddedBlockCipher returns valid implementations", () {
      testPaddedBlockCipher("AES/SIC/PKCS7");
    });

    test("Padding returns valid implementations", () {
      testPadding("PKCS7");
    });

    test("SecureRandom returns valid implementations", () {
      testSecureRandom("AES/CTR/AUTO-SEED-PRNG");
      testSecureRandom("AES/CTR/PRNG");
      testSecureRandom("Fortuna");
    });

    test("Signer returns valid implementations", () {
      testSigner("SHA-1/ECDSA");
      testSigner("MD2/RSA");
      testSigner("MD4/RSA");
      testSigner("MD5/RSA");
      testSigner("RIPEMD-128/RSA");
      testSigner("RIPEMD-160/RSA");
      testSigner("RIPEMD-256/RSA");
      testSigner("SHA-1/RSA");
      testSigner("SHA-224/RSA");
      testSigner("SHA-256/RSA");
      testSigner("SHA-384/RSA");
      testSigner("SHA-512/RSA");
    });

    test("StreamCipher returns valid implementations", () {
      testStreamCipher("Salsa20");
      testStreamCipher("AES/SIC");
      testStreamCipher("AES/CTR");
    });

  });

}
