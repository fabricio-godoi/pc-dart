// Copyright (c) 2013-present, Iván Zaera Avellón - izaera@gmail.com

// This library is dually licensed under LGPL 3 and MPL 2.0. See file LICENSE for more information.

// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of
// the MPL was not distributed with this file, you can obtain one at http://mozilla.org/MPL/2.0/.

library pointycastle.test.asymmetric.rsa_test;

import "package:bignum/bignum.dart";

import "package:pointycastle/pointycastle.dart";

import '../test/asymmetric_block_cipher_tests.dart';

void main() {

  var modulus = new BigInteger("20620915813302906913761247666337410938401372343750709187749515126790853245302593205328533062154315527282056175455193812046134139935830222032257750866653461677566720508752544506266533943725970345491747964654489405936145559121373664620352701801574863309087932865304205561439525871868738640172656811470047745445089832193075388387376667722031640892525639171016297098395245887609359882693921643396724693523583076582208970794545581164952427577506035951122669158313095779596666008591745562008787129160302313244329988240795948461701615228062848622019620094307696506764461083870202605984497833670577046553861732258592935325691");
  var publicExponent = new BigInteger("65537");
  var privateExponent = new BigInteger("11998058528661160053642124235359844880039079149364512302169225182946866898849176558365314596732660324493329967536772364327680348872134489319530228055102152992797567579226269544119435926913937183793755182388650533700918602627770886358900914370472445911502526145837923104029967812779021649252540542517598618021899291933220000807916271555680217608559770825469218984818060775562259820009637370696396889812317991880425127772801187664191059506258517954313903362361211485802288635947903604738301101038823790599295749578655834195416886345569976295245464597506584866355976650830539380175531900288933412328525689718517239330305");
  var p = new BigInteger("144173682842817587002196172066264549138375068078359231382946906898412792452632726597279520229873489736777248181678202636100459215718497240474064366927544074501134727745837254834206456400508719134610847814227274992298238973375146473350157304285346424982280927848339601514720098577525635486320547905945936448443");
  var q = new BigInteger("143028293421514654659358549214971921584534096938352096320458818956414890934365483375293202045679474764569937266017713262196941957149321696805368542065644090886347646782188634885321277533175667840285448510687854061424867903968633218073060468434469761149335255007464091258725753837522484082998329871306803923137");
  // dP = 68805717049526308324575273108573116001662526577152473869179706227957595091947965115631041308417430436199124027318143092441125820376694663934988040410650411495368889020042904305193636218299757516719158446153874604179501966374024692112438317379995729651506791282977824993147390378095874103264534184571632120755
  // dQ = 50784570363590735217102910420562378736776300956031757348933834583758403833600634727605365085416808486374756857656471727593921591511126781583852266259785128933660523683133642580243620064955640182544858428730432641246268155779942551300183363603309753909166293605500547836955434209670082619152099365325073276033
  // Qinv = 55230685559710427662641419127391743688498562899704993951405017803347590263833235040975158906547337992492501961820323076137293399600978620698955537627140829092176376250413837145798422716237647195575076578845234764700372691872271724982949541941613766324969755382993478116416238708238612702107474463263158193372

  var pubk = new RSAPublicKey(modulus, publicExponent);
  var privk = new RSAPrivateKey(modulus, privateExponent, p, q);

  var pubpar = () => new PublicKeyParameter<RSAPublicKey>(pubk);
  var privpar = () => new PrivateKeyParameter<RSAPrivateKey>(privk);

  runAsymmetricBlockCipherTests(new AsymmetricBlockCipher("RSA"), pubpar, privpar, [

    "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
    "3440ad17295687b43a3c81d7955351991c5f2f71a6a0b89571d8363c1dc825e219ea9aa0b668208e2d1c506f23ebc80536aed8577a146213b3cc9989bd3a758d1d1ca8a05cea9261d7df1642e930bc3976cb0b4df9e9423cbbe790fd51a32204230370092fc481efa2d364248febd940d999a4914856be080702845155711e2a7a4a0fecf5c4086792c1b1c4504a094713b7d7488c260265f45bbc80b601daf1de94ac57fd28bb5e154154fb65b339cb88ec583aeb2621ef9f4c9f1f18111401e4c9d73f90194b6791ed06d254da971bc29954c83d0752b2af4777f0c960a06bbb8d68b1f7d0efde31e634b679be598fbbec9f605f7484f773350c3832675b61",
    "0fe986b1829134af1ac8568f71f23f82a77263aabdc274ef3e2aa10e217f935f5fb4b139bcb01b13f7f687d0b1d84d26dd5e0106dd47e071e0b820902ea89946323c96342443054c5a5abccd2ad02cccf4740bf970e144598c57f9575394eb24fbbf985eecfb357053cd53534cd4f183675e55f891de2b531881aba5c814914874bb9cacdfccff650d0b57ca7c7ce6ff9b88d7848eff97da013c100bd926803e86d4cacf19065a2415edd0bcba629a8edc99f4944ba244cfe491349eb43f23ae4363417aa73a7525f90dd80b787fe63d9b92c057ce5addd2a63635acb3ea6099afc0668a16682f31c997029b3e9aa2ef453b3f614dfb3c0e9e78ab45362499eb",

    "En un lugar de La Mancha, de cuyo nombre no quiero acordarme...",
    "6cf9c2b31c3a26dd7a3af82f49583f071f3a3693266dcf19128af9e14d875bc5fb0d224d953e6a1d9c9e38cd1782a147be51496d7476e31ec679290b4e37bc99508029d65ffcbe0d034febbf4b3e31895a054f99728c9c83de1fbdbc06f141077721dff132fda3eb36086301931665b503fd2a41294160815f9aa7af5da451f6f98572c69cc3fd29e66bee29cdbc05f562295a53c6a4fc439c18106cbb2ceef95d868e2da16de9f843c65df26aff4c9bc6b7d59ed1a8d18a16d6c0abce4a5cfe792c921a99725bd5723fc4cfb37e732ed4f00525b79d192370e0584b2a8c5073a088dfde91c9e115f995611eeac6e7dfa63b38a8f964c96f0b57231b98ead441",
    "7d7a3f179d37875f0f14b97cd9c0f266cc0087dbb674488981c1669ec57da4b4025967c6f8557789bf79009ce5f7c15483a887964fc19fd444657538d477368b3681b40de94cc70d3f2dd3d075c7b37b29afb8300b7ce1219c8a9acede902b70f23697d047b13cb37ba95b909a3e30c162591afd5857543555bb73164d5711ad135f997bb0df8c21cb8bf2cfff3f67b145483d3c3e2fee78e600e5c14cdf73cd2ecb63afaee65006644f7b6dab026624c11f142a8ec393c9e409a56da9ddfcbe6d35f8f01533d5a30db3a55c8510bb457c8e3a85e17133c2231be209eb8fa0c93fb87ba7ca2edd30bb4485bf1cb923522414d3d6b0e6d25c251e45e08505a966",

  ]);

}

