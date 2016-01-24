// Copyright (c) 2013-present, Iván Zaera Avellón - izaera@gmail.com

// This library is dually licensed under LGPL 3 and MPL 2.0. See file LICENSE for more information.

// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of
// the MPL was not distributed with this file, you can obtain one at http://mozilla.org/MPL/2.0/.

library pointycastle.test.random.block_ctr_random_test;

import "dart:typed_data";

import "package:pointycastle/pointycastle.dart";

import "package:test/test.dart";

void main() {



  group( "BlockCtrRandom:", () {

    final rnd = new SecureRandom("AES/CTR/PRNG");

    test( "${rnd.algorithmName}", () {

      final key = new Uint8List(16);
      final keyParam = new KeyParameter(key);
      final params = new ParametersWithIV(keyParam, new Uint8List(16));

      rnd.seed(params);
      var bytes = rnd.nextBytes(16*257);

      final expected = [102, 233, 75, 212, 239, 138, 44, 59, 136, 76, 250, 89, 202, 52, 43, 46, 88, 226, 252, 206, 250, 126, 48, 97, 54, 127, 29, 87, 164, 231, 69, 90, 3, 136, 218, 206, 96, 182, 163, 146, 243, 40, 194, 185, 113, 178, 254, 120, 247, 149, 170, 171, 73, 75, 89, 35, 247, 253, 137, 255, 148, 139, 193, 224, 32, 2, 17, 33, 78, 115, 148, 218, 32, 137, 182, 172, 208, 147, 171, 224, 201, 77, 162, 25, 17, 142, 41, 125, 123, 126, 188, 188, 201, 195, 136, 242, 138, 222, 125, 133, 168, 238, 53, 97, 111, 113, 36, 169, 213, 39, 2, 145, 149, 184, 77, 27, 150, 198, 144, 255, 47, 45, 227, 11, 242, 236, 137, 224, 2, 83, 120, 110, 18, 101, 4, 240, 218, 185, 12, 72, 163, 3, 33, 222, 51, 69, 230, 176, 70, 30, 124, 158, 108, 107, 122, 254, 221, 232, 63, 64, 222, 179, 250, 103, 148, 248, 253, 143, 85, 168, 141, 203, 218, 157, 104, 242, 19, 124, 201, 200, 52, 32, 7, 126, 124, 242, 138, 178, 105, 107, 13, 240, 93, 17, 69, 43, 88, 172, 80, 170, 46, 179, 161, 149, 182, 27, 135, 229, 198, 90, 109, 213, 215, 247, 168, 64, 101, 213, 161, 127, 244, 98, 115, 8, 96, 2, 73, 109, 182, 63, 164, 185, 27, 238, 56, 127, 163, 3, 12, 149, 167, 63, 141, 4, 55, 224, 145, 95, 188, 229, 215, 166, 45, 141, 171, 10, 88, 178, 67, 27, 192, 190, 222, 2, 85, 15, 64, 35, 137, 105, 236, 120, 4, 16, 190, 252, 205, 230, 148, 75, 105, 221, 0, 125, 235, 227, 154, 157, 188, 94, 36, 245, 25, 164, 189, 244, 120, 177, 217, 236, 11, 103, 18, 95, 40, 176, 110, 250, 165, 93, 121, 65, 42, 214, 40, 212, 80, 137, 195, 195, 4, 249, 77, 179, 162, 29, 246, 205, 175, 109, 46, 46, 59, 53, 84, 65, 239, 246, 74, 217, 5, 39, 231, 82, 164, 178, 235, 180, 208, 161, 7, 12, 226, 226, 152, 46, 39, 47, 219, 124, 244, 181, 132, 176, 149, 160, 249, 87, 253, 184, 40, 104, 148, 55, 227, 125, 196, 139, 42, 211, 121, 198, 243, 198, 233, 87, 238, 119, 175, 184, 140, 101, 148, 155, 161, 46, 236, 69, 194, 40, 101, 228, 144, 122, 228, 42, 238, 129, 56, 152, 172, 223, 145, 226, 228, 194, 29, 130, 142, 10, 118, 222, 43, 182, 187, 111, 134, 158, 94, 239, 31, 97, 141, 237, 210, 117, 98, 129, 43, 154, 20, 232, 153, 106, 92, 53, 45, 243, 129, 126, 96, 214, 236, 32, 17, 154, 82, 200, 10, 97, 236, 25, 86, 34, 98, 114, 64, 33, 45, 236, 202, 81, 95, 234, 182, 62, 39, 52, 88, 121, 72, 168, 54, 167, 222, 32, 92, 254, 192, 194, 136, 53, 28, 52, 139, 17, 121, 65, 221, 10, 99, 217, 148, 112, 62, 99, 217, 74, 68, 104, 4, 33, 58, 180, 251, 29, 43, 123, 163, 118, 89, 10, 44, 36, 29, 31, 80, 141, 198, 167, 244, 24, 161, 69, 3, 222, 184, 155, 23, 170, 219, 40, 6, 247, 63, 192, 110, 93, 20, 230, 117, 245, 236, 136, 0, 35, 212, 247, 50, 150, 18, 220, 228, 160, 229, 188, 121, 43, 91, 90, 85, 249, 194, 243, 14, 7, 173, 32, 153, 233, 172, 41, 0, 7, 170, 94, 18, 80, 107, 237, 130, 113, 64, 210, 97, 20, 76, 222, 102, 237, 181, 179, 39, 211, 246, 148, 88, 196, 146, 164, 235, 53, 30, 113, 64, 67, 2, 75, 146, 205, 182, 137, 201, 139, 129, 110, 72, 164, 23, 148, 164, 211, 156, 250, 107, 71, 165, 52, 6, 37, 24, 160, 185, 132, 237, 109, 150, 127, 167, 69, 209, 97, 120, 169, 158, 56, 3, 145, 24, 196, 164, 242, 60, 31, 32, 81, 198, 30, 16, 191, 46, 244, 133, 33, 215, 208, 210, 116, 202, 4, 188, 84, 224, 127, 73, 215, 47, 32, 181, 250, 7, 39, 63, 100, 194, 248, 196, 50, 227, 191, 188, 224, 158, 228, 154, 112, 146, 106, 13, 226, 188, 30, 76, 172, 22, 110, 95, 231, 135, 39, 183, 158, 134, 15, 126, 69, 175, 95, 93, 238, 49, 165, 90, 32, 65, 167, 24, 146, 139, 126, 34, 89, 11, 143, 159, 237, 177, 23, 106, 2, 147, 166, 228, 119, 1, 134, 148, 34, 177, 253, 0, 124, 190, 57, 166, 60, 165, 234, 30, 14, 167, 44, 183, 231, 71, 94, 43, 147, 92, 119, 63, 249, 18, 118, 146, 99, 67, 15, 245, 167, 27, 134, 21, 73, 205, 232, 32, 88, 3, 230, 145, 26, 155, 170, 176, 255, 121, 92, 119, 193, 172, 201, 31, 29, 219, 30, 105, 156, 134, 253, 184, 223, 236, 27, 60, 39, 212, 16, 218, 122, 218, 155, 6, 244, 234, 149, 65, 78, 255, 160, 21, 92, 2, 216, 218, 163, 57, 94, 49, 210, 227, 95, 106, 4, 189, 21, 4, 116, 250, 130, 61, 37, 229, 13, 172, 226, 112, 195, 210, 187, 206, 202, 50, 253, 129, 94, 222, 149, 137, 119, 78, 223, 42, 189, 31, 128, 21, 166, 205, 221, 103, 131, 49, 155, 87, 54, 178, 53, 93, 247, 144, 208, 131, 55, 160, 124, 102, 199, 64, 130, 230, 237, 223, 9, 170, 223, 84, 128, 111, 98, 28, 53, 148, 146, 170, 70, 37, 79, 129, 231, 93, 210, 235, 166, 208, 75, 230, 25, 228, 68, 89, 99, 103, 187, 8, 205, 196, 51, 219, 187, 146, 168, 177, 28, 81, 193, 49, 102, 31, 122, 131, 82, 115, 26, 90, 191, 85, 235, 89, 7, 155, 61, 11, 133, 142, 188, 241, 235, 154, 175, 212, 119, 163, 199, 165, 73, 141, 233, 73, 105, 39, 141, 190, 9, 56, 245, 157, 163, 217, 112, 141, 36, 115, 25, 240, 55, 150, 238, 91, 202, 104, 222, 182, 182, 146, 55, 124, 133, 246, 81, 93, 42, 51, 225, 94, 7, 10, 222, 83, 61, 46, 9, 14, 208, 245, 190, 19, 188, 9, 131, 38, 90, 253, 71, 6, 202, 231, 37, 218, 19, 236, 170, 33, 180, 233, 43, 185, 160, 184, 146, 152, 12, 28, 87, 30, 175, 116, 0, 45, 132, 252, 128, 22, 228, 255, 25, 125, 155, 53, 125, 198, 176, 208, 208, 95, 145, 74, 3, 167, 81, 156, 169, 206, 90, 200, 225, 181, 221, 157, 218, 209, 77, 62, 253, 38, 158, 57, 250, 78, 104, 77, 209, 247, 212, 141, 194, 248, 28, 243, 5, 86, 33, 138, 179, 198, 18, 206, 219, 41, 115, 46, 95, 204, 57, 248, 215, 68, 138, 140, 212, 142, 248, 115, 246, 241, 60, 57, 81, 63, 205, 0, 254, 221, 107, 185, 123, 118, 66, 197, 20, 246, 95, 0, 31, 45, 122, 96, 64, 145, 84, 219, 145, 78, 44, 117, 80, 197, 145, 118, 219, 33, 47, 175, 229, 160, 134, 63, 220, 130, 141, 29, 249, 219, 31, 139, 175, 174, 28, 41, 16, 134, 5, 75, 70, 98, 43, 159, 72, 152, 131, 115, 78, 50, 90, 141, 209, 115, 24, 62, 14, 143, 56, 12, 150, 137, 196, 223, 49, 148, 245, 71, 98, 20, 136, 63, 140, 207, 90, 118, 174, 54, 51, 0, 178, 243, 243, 231, 151, 223, 150, 166, 120, 215, 84, 187, 176, 63, 111, 148, 16, 247, 158, 202, 112, 18, 12, 99, 237, 14, 60, 237, 150, 159, 209, 224, 55, 137, 6, 180, 129, 137, 36, 193, 75, 36, 195, 246, 33, 0, 145, 71, 115, 26, 79, 190, 9, 246, 19, 203, 74, 132, 212, 251, 161, 74, 190, 245, 101, 106, 23, 85, 145, 29, 93, 228, 78, 251, 87, 121, 183, 214, 246, 220, 117, 154, 9, 79, 95, 224, 116, 211, 223, 218, 201, 83, 154, 200, 60, 24, 96, 78, 80, 167, 13, 96, 198, 205, 36, 23, 8, 18, 206, 128, 163, 49, 47, 62, 104, 16, 32, 94, 91, 212, 130, 74, 14, 89, 163, 59, 241, 235, 78, 70, 234, 89, 225, 50, 85, 118, 197, 203, 151, 84, 42, 210, 221, 88, 251, 125, 204, 140, 227, 91, 193, 40, 232, 24, 147, 60, 12, 59, 198, 242, 137, 171, 153, 206, 70, 55, 47, 131, 210, 148, 121, 183, 152, 229, 3, 44, 90, 185, 243, 176, 170, 250, 82, 201, 14, 216, 195, 23, 232, 82, 48, 112, 80, 248, 30, 157, 102, 20, 218, 114, 233, 127, 17, 51, 220, 8, 219, 255, 157, 80, 102, 53, 62, 74, 182, 226, 20, 183, 86, 247, 250, 22, 156, 29, 250, 13, 239, 133, 118, 66, 212, 66, 76, 136, 40, 121, 58, 194, 26, 17, 143, 70, 77, 151, 234, 199, 236, 222, 103, 12, 131, 199, 46, 126, 103, 48, 115, 54, 66, 246, 37, 171, 40, 194, 207, 129, 96, 209, 5, 119, 28, 73, 63, 196, 89, 216, 139, 4, 65, 163, 145, 77, 24, 128, 87, 158, 131, 79, 92, 227, 212, 228, 208, 27, 250, 152, 161, 141, 240, 77, 80, 101, 57, 17, 5, 191, 226, 66, 64, 228, 254, 96, 159, 244, 253, 197, 87, 253, 39, 28, 144, 48, 1, 42, 39, 116, 22, 239, 7, 98, 154, 189, 196, 221, 74, 200, 11, 137, 74, 39, 105, 173, 167, 127, 6, 26, 199, 122, 91, 124, 182, 145, 102, 87, 2, 84, 242, 40, 200, 178, 4, 232, 181, 169, 174, 242, 252, 60, 247, 214, 32, 140, 60, 32, 242, 175, 22, 23, 125, 208, 65, 235, 105, 179, 56, 143, 24, 87, 10, 22, 227, 149, 144, 233, 176, 247, 6, 78, 18, 182, 61, 253, 84, 112, 119, 119, 118, 149, 159, 22, 181, 121, 212, 52, 214, 227, 108, 206, 114, 53, 132, 192, 238, 225, 250, 34, 242, 89, 140, 21, 227, 92, 84, 221, 138, 150, 42, 235, 106, 172, 18, 186, 131, 167, 59, 18, 192, 48, 208, 95, 17, 218, 103, 24, 245, 182, 216, 146, 93, 237, 37, 15, 55, 17, 9, 237, 200, 20, 121, 38, 230, 135, 193, 182, 43, 168, 62, 226, 120, 33, 61, 234, 219, 62, 173, 80, 193, 249, 128, 190, 25, 198, 191, 167, 230, 200, 6, 3, 31, 104, 173, 44, 50, 136, 24, 166, 55, 134, 230, 64, 124, 126, 34, 160, 249, 91, 221, 7, 101, 88, 167, 43, 218, 250, 160, 66, 236, 239, 149, 221, 170, 128, 7, 166, 91, 100, 124, 61, 207, 8, 86, 174, 202, 163, 121, 153, 230, 96, 62, 115, 50, 136, 113, 88, 109, 249, 232, 9, 235, 241, 44, 166, 161, 7, 162, 10, 124, 5, 102, 153, 22, 171, 137, 234, 141, 222, 167, 7, 55, 90, 129, 101, 156, 251, 29, 83, 94, 94, 70, 182, 182, 166, 158, 144, 229, 3, 87, 159, 12, 17, 4, 114, 168, 69, 247, 126, 108, 232, 171, 30, 39, 44, 45, 149, 9, 227, 92, 23, 48, 163, 189, 225, 188, 24, 238, 142, 12, 111, 13, 100, 63, 76, 58, 6, 193, 120, 231, 193, 215, 117, 240, 239, 150, 145, 239, 115, 156, 216, 176, 10, 83, 30, 104, 131, 99, 64, 126, 236, 17, 209, 255, 87, 76, 78, 106, 79, 158, 57, 242, 65, 32, 28, 227, 18, 153, 48, 203, 147, 73, 14, 203, 6, 208, 16, 17, 228, 128, 121, 142, 213, 72, 2, 227, 92, 195, 22, 129, 58, 20, 25, 158, 196, 175, 60, 194, 58, 122, 231, 169, 208, 94, 92, 14, 79, 190, 73, 29, 216, 3, 86, 249, 230, 239, 14, 84, 9, 164, 239, 96, 38, 31, 191, 14, 227, 1, 33, 219, 2, 193, 254, 233, 65, 209, 3, 25, 249, 104, 94, 36, 163, 104, 210, 202, 63, 13, 3, 224, 223, 208, 60, 7, 254, 98, 199, 198, 93, 115, 226, 33, 223, 106, 48, 121, 220, 221, 59, 120, 181, 98, 214, 114, 228, 36, 97, 7, 251, 211, 42, 151, 52, 155, 242, 237, 153, 232, 114, 108, 177, 115, 67, 73, 229, 197, 73, 154, 255, 73, 184, 223, 74, 151, 203, 224, 56, 51, 230, 97, 151, 98, 13, 173, 224, 141, 210, 165, 29, 58, 100, 136, 189, 33, 4, 182, 197, 165, 28, 9, 177, 62, 56, 218, 199, 209, 45, 165, 133, 41, 82, 47, 48, 196, 210, 28, 158, 35, 24, 53, 120, 39, 239, 237, 231, 60, 203, 254, 241, 158, 198, 171, 14, 77, 147, 193, 193, 168, 133, 184, 55, 171, 131, 163, 253, 4, 3, 167, 230, 1, 97, 151, 116, 218, 197, 38, 223, 127, 111, 1, 25, 98, 124, 255, 185, 223, 94, 0, 102, 60, 147, 109, 22, 1, 233, 254, 76, 228, 206, 188, 168, 105, 224, 16, 17, 218, 127, 133, 63, 197, 8, 61, 106, 213, 9, 37, 213, 43, 218, 216, 125, 165, 231, 155, 77, 181, 41, 112, 7, 59, 59, 242, 192, 251, 13, 124, 52, 219, 42, 243, 195, 9, 98, 212, 99, 161, 165, 23, 127, 17, 31, 44, 209, 169, 111, 220, 193, 99, 158, 133, 25, 171, 59, 42, 22, 121, 142, 68, 44, 216, 227, 252, 198, 222, 243, 104, 39, 76, 105, 102, 37, 67, 136, 115, 69, 78, 127, 198, 199, 55, 211, 153, 170, 53, 93, 127, 244, 117, 192, 81, 40, 154, 234, 60, 15, 149, 221, 74, 74, 92, 157, 25, 10, 158, 112, 210, 99, 9, 203, 238, 195, 31, 128, 49, 117, 132, 46, 75, 90, 188, 143, 128, 6, 2, 192, 123, 79, 249, 90, 28, 12, 14, 195, 142, 226, 108, 163, 84, 174, 36, 47, 149, 201, 139, 83, 83, 190, 155, 124, 235, 161, 166, 28, 6, 217, 160, 63, 89, 171, 42, 181, 66, 80, 0, 146, 17, 94, 112, 206, 19, 93, 160, 37, 126, 92, 241, 40, 244, 110, 52, 88, 154, 58, 198, 78, 9, 254, 141, 111, 250, 245, 221, 75, 251, 124, 7, 212, 183, 68, 44, 206, 248, 196, 18, 238, 78, 249, 147, 128, 98, 45, 142, 84, 90, 169, 97, 183, 19, 93, 25, 90, 123, 148, 255, 97, 177, 163, 101, 100, 226, 212, 161, 22, 21, 106, 188, 138, 46, 104, 189, 232, 3, 112, 203, 55, 254, 204, 190, 138, 81, 219, 155, 137, 209, 255, 186, 127, 5, 81, 120, 97, 224, 94, 25, 173, 87, 0, 163, 179, 110, 114, 92, 165, 112, 244, 170, 38, 170, 102, 236, 123, 207, 161, 69, 185, 190, 86, 243, 247, 148, 161, 18, 5, 203, 65, 43, 192, 117, 26, 191, 172, 222, 51, 199, 254, 39, 198, 11, 77, 125, 196, 122, 200, 199, 78, 232, 176, 183, 240, 180, 144, 152, 6, 136, 16, 106, 104, 77, 246, 197, 25, 132, 143, 223, 21, 191, 178, 32, 210, 37, 223, 222, 5, 189, 229, 234, 34, 48, 124, 242, 186, 30, 31, 18, 84, 108, 102, 136, 91, 233, 178, 219, 73, 108, 15, 60, 75, 214, 95, 84, 62, 34, 155, 9, 202, 131, 229, 124, 149, 187, 196, 223, 185, 156, 42, 197, 195, 92, 50, 71, 137, 80, 239, 220, 109, 57, 36, 247, 122, 235, 175, 125, 224, 89, 38, 6, 17, 15, 13, 89, 88, 90, 145, 109, 221, 47, 241, 107, 71, 12, 153, 209, 162, 0, 222, 28, 33, 142, 145, 131, 205, 254, 129, 43, 186, 26, 62, 184, 66, 27, 186, 71, 92, 25, 50, 49, 179, 34, 126, 219, 197, 70, 97, 44, 246, 246, 38, 71, 174, 22, 116, 51, 56, 39, 41, 11, 43, 82, 244, 214, 175, 60, 194, 69, 167, 101, 47, 67, 207, 25, 110, 63, 91, 132, 25, 139, 164, 35, 206, 197, 119, 190, 201, 231, 233, 25, 176, 200, 3, 80, 182, 212, 8, 114, 76, 205, 156, 139, 127, 125, 125, 220, 199, 230, 10, 208, 132, 140, 64, 4, 52, 78, 55, 142, 169, 231, 81, 247, 249, 125, 59, 112, 202, 122, 89, 102, 237, 181, 45, 238, 34, 125, 71, 105, 83, 56, 129, 152, 181, 85, 110, 185, 76, 248, 190, 17, 238, 98, 218, 85, 207, 172, 103, 42, 47, 141, 209, 128, 186, 75, 30, 144, 206, 156, 2, 22, 79, 250, 51, 120, 153, 191, 54, 249, 64, 196, 251, 119, 82, 80, 209, 154, 13, 55, 13, 158, 102, 195, 6, 60, 211, 99, 200, 185, 224, 153, 13, 152, 150, 140, 84, 43, 132, 31, 45, 170, 234, 26, 139, 58, 77, 107, 221, 127, 51, 181, 72, 79, 243, 45, 239, 178, 13, 210, 91, 228, 133, 95, 24, 167, 42, 144, 130, 131, 252, 152, 253, 20, 23, 9, 96, 147, 194, 65, 144, 93, 202, 127, 178, 81, 70, 147, 193, 151, 93, 197, 229, 83, 128, 52, 94, 245, 158, 199, 203, 21, 253, 202, 235, 70, 118, 40, 97, 1, 65, 159, 84, 110, 240, 103, 103, 58, 219, 35, 213, 2, 158, 218, 168, 4, 24, 250, 151, 110, 56, 67, 80, 199, 199, 160, 92, 25, 210, 160, 168, 4, 133, 133, 177, 53, 60, 221, 189, 205, 195, 173, 105, 44, 45, 7, 108, 10, 161, 25, 123, 165, 58, 191, 39, 69, 3, 104, 243, 202, 86, 3, 208, 86, 208, 2, 99, 6, 218, 94, 189, 49, 204, 202, 254, 37, 239, 203, 134, 186, 165, 236, 17, 243, 163, 129, 226, 103, 13, 37, 218, 78, 158, 228, 189, 28, 85, 12, 157, 188, 13, 143, 141, 63, 215, 218, 94, 135, 191, 206, 107, 82, 48, 230, 46, 157, 107, 186, 4, 201, 208, 43, 25, 5, 171, 217, 117, 249, 224, 78, 76, 54, 30, 207, 115, 181, 251, 7, 18, 221, 55, 195, 252, 173, 132, 47, 6, 53, 121, 134, 17, 36, 111, 213, 11, 46, 139, 202, 5, 100, 175, 144, 172, 11, 62, 23, 227, 99, 32, 210, 106, 199, 252, 182, 162, 168, 205, 212, 145, 130, 223, 72, 56, 16, 21, 27, 180, 117, 161, 167, 105, 134, 89, 48, 1, 75, 134, 217, 168, 198, 216, 221, 255, 116, 164, 22, 122, 236, 135, 118, 74, 167, 149, 136, 165, 19, 88, 53, 197, 39, 217, 194, 55, 250, 186, 121, 188, 48, 254, 171, 11, 98, 221, 175, 156, 98, 153, 19, 225, 215, 188, 153, 18, 223, 232, 11, 21, 155, 184, 146, 85, 248, 70, 33, 49, 42, 236, 241, 96, 174, 113, 199, 89, 43, 212, 36, 201, 43, 173, 0, 45, 111, 138, 52, 122, 175, 235, 152, 100, 217, 129, 186, 206, 150, 135, 179, 153, 190, 218, 21, 241, 129, 27, 0, 172, 179, 82, 146, 56, 18, 159, 189, 73, 24, 59, 151, 202, 148, 203, 14, 210, 74, 227, 112, 177, 200, 7, 4, 136, 12, 49, 251, 161, 14, 236, 9, 187, 27, 68, 171, 136, 57, 136, 238, 4, 168, 222, 158, 162, 88, 146, 125, 137, 123, 113, 87, 195, 238, 128, 210, 130, 106, 246, 140, 175, 49, 13, 67, 245, 46, 249, 122, 142, 229, 19, 231, 73, 155, 35, 237, 38, 237, 94, 90, 243, 166, 198, 189, 37, 192, 32, 45, 177, 67, 240, 101, 74, 105, 179, 200, 12, 85, 97, 15, 12, 234, 89, 81, 77, 169, 231, 103, 108, 225, 35, 151, 242, 167, 156, 167, 254, 219, 50, 75, 37, 224, 250, 121, 184, 235, 115, 133, 215, 177, 21, 105, 211, 167, 220, 82, 208, 249, 15, 171, 240, 51, 112, 89, 66, 240, 248, 33, 236, 112, 196, 175, 160, 142, 108, 241, 220, 255, 80, 72, 187, 3, 18, 81, 136, 199, 115, 99, 44, 5, 108, 194, 48, 198, 112, 251, 246, 51, 105, 60, 138, 114, 98, 215, 251, 203, 206, 29, 78, 60, 244, 199, 246, 48, 239, 34, 9, 132, 233, 150, 211, 150, 98, 86, 86, 171, 174, 169, 164, 70, 157, 47, 120, 176, 94, 46, 21, 70, 171, 38, 126, 41, 239, 232, 197, 95, 239, 112, 255, 190, 111, 209, 42, 93, 139, 183, 160, 204, 202, 37, 39, 135, 172, 202, 99, 40, 113, 74, 137, 29, 48, 18, 212, 221, 133, 154, 20, 108, 12, 14, 148, 133, 132, 156, 242, 73, 143, 64, 6, 216, 249, 68, 120, 111, 40, 78, 22, 193, 200, 182, 49, 220, 8, 210, 220, 60, 58, 209, 64, 7, 110, 47, 133, 70, 127, 54, 226, 132, 9, 184, 150, 82, 67, 57, 30, 230, 167, 56, 131, 8, 237, 3, 242, 197, 109, 216, 185, 127, 190, 9, 55, 114, 13, 95, 211, 183, 120, 11, 219, 147, 2, 122, 22, 254, 190, 25, 155, 38, 103, 214, 45, 248, 95, 94, 70, 214, 139, 30, 64, 255, 9, 28, 235, 134, 1, 255, 71, 81, 229, 235, 240, 30, 227, 125, 208, 176, 197, 73, 233, 27, 35, 64, 34, 35, 59, 141, 169, 254, 75, 246, 221, 29, 234, 119, 247, 222, 85, 248, 39, 108, 208, 183, 108, 221, 182, 10, 94, 123, 61, 208, 110, 37, 63, 249, 143, 252, 107, 130, 203, 23, 71, 185, 97, 52, 166, 225, 174, 0, 147, 225, 174, 227, 189, 240, 239, 153, 13, 162, 9, 152, 23, 234, 89, 208, 172, 0, 248, 80, 223, 150, 112, 202, 96, 218, 141, 195, 168, 233, 10, 194, 18, 245, 84, 162, 46, 99, 191, 73, 250, 143, 103, 97, 97, 168, 211, 51, 38, 73, 117, 109, 231, 235, 28, 243, 126, 22, 8, 98, 143, 225, 118, 211, 130, 204, 72, 77, 103, 41, 20, 160, 209, 179, 156, 28, 1, 111, 191, 171, 116, 100, 160, 167, 5, 115, 190, 77, 215, 241, 52, 187, 39, 161, 173, 92, 83, 217, 1, 22, 185, 236, 171, 4, 183, 210, 224, 201, 233, 178, 80, 12, 120, 237, 211, 43, 172, 9, 231, 13, 120, 53, 15, 175, 245, 0, 232, 67, 45, 53, 4, 87, 135, 21, 40, 93, 14, 182, 163, 55, 202, 94, 231, 142, 90, 144, 246, 151, 117, 21, 30, 13, 43, 131, 148, 231, 122, 39, 41, 220, 31, 88, 42, 188, 26, 137, 36, 105, 170, 215, 149, 16, 65, 151, 158, 156, 195, 162, 41, 244, 21, 250, 37, 104, 10, 207, 252, 181, 17, 106, 21, 194, 89, 202, 146, 109, 140, 193, 207, 30, 247, 49, 81, 154, 56, 246, 83, 142, 63, 220, 202, 44, 225, 28, 129, 202, 134, 189, 213, 173, 244, 138, 168, 246, 82, 249, 166, 17, 137, 218, 105, 7, 165, 49, 57, 93, 49, 70, 40, 159, 188, 194, 206, 128, 155, 143, 144, 6, 242, 83, 76, 156, 234, 251, 186, 19, 223, 243, 192, 104, 2, 151, 41, 143, 3, 7, 180, 165, 45, 156, 241, 78, 162, 222, 12, 54, 248, 49, 123, 137, 49, 102, 98, 121, 88, 128, 14, 196, 179, 188, 106, 35, 32, 47, 26, 255, 254, 3, 72, 171, 59, 174, 33, 167, 53, 25, 75, 54, 101, 91, 22, 206, 173, 69, 63, 30, 113, 154, 142, 77, 206, 63, 167, 220, 4, 137, 162, 100, 50, 123, 102, 103, 138, 111, 37, 133, 90, 210, 59, 119, 80, 194, 189, 59, 249, 211, 2, 15, 254, 163, 19, 23, 130, 250, 241, 215, 118, 33, 184, 41, 104, 47, 115, 108, 155, 202, 17, 86, 177, 41, 141, 159, 163, 210, 208, 4, 163, 110, 201, 159, 107, 83, 203, 135, 157, 5, 86, 241, 201, 30, 89, 61, 177, 247, 212, 19, 103, 170, 96, 51, 115, 3, 4, 2, 181, 30, 94, 32, 89, 176, 31, 203, 121, 145, 144, 228, 220, 44, 98, 110, 247, 63, 171, 241, 114, 114, 16, 13, 236, 135, 79, 102, 148, 203, 104, 224, 120, 138, 253, 46, 30, 59, 93, 213, 102, 94, 250, 252, 82, 14, 211, 175, 202, 172, 148, 211, 26, 39, 254, 45, 168, 112, 22, 221, 212, 127, 48, 250, 16, 53, 116, 74, 153, 196, 248, 197, 93, 87, 16, 154, 21, 9, 108, 215, 144, 88, 74, 81, 152, 108, 24, 3, 108, 95, 152, 20, 72, 138, 163, 222, 137, 185, 150, 18, 194, 127, 53, 207, 32, 191, 150, 159, 200, 3, 247, 13, 222, 249, 59, 166, 37, 136, 36, 42, 14, 103, 208, 214, 69, 224, 251, 86, 204, 9, 182, 128, 177, 208, 124, 90, 82, 20, 158, 41, 240, 124];
      expect( bytes, expected );

    });

  });

}
