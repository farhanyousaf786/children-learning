import 'dart:collection';

import 'package:flutter/material.dart';

class DataBase {
  List<String> dotedAlphabetsLinks = [
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FAa.jpg?alt=media&token=443952aa-15e5-4d64-b52b-35c08ff821f1",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FBb.jpg?alt=media&token=8ae6c78a-9126-451e-abd6-c3e223532ec3",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FCc.jpg?alt=media&token=501e1196-eb35-4e11-b64d-28038b7e4dba",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FDd.jpg?alt=media&token=033a8470-c3c5-4be1-ae81-237ea9741a97",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FEe.jpg?alt=media&token=b73c4518-5d7a-4364-82aa-cc04fd2091e6",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FFf.jpg?alt=media&token=1c02f8ea-8368-45d4-90c5-374a3a728ba3",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FGg.jpg?alt=media&token=735e2e13-15aa-46a1-84a4-5b379fe095a0",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FHh.jpg?alt=media&token=18420b63-953f-489e-be39-671b9ea25e28",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FIi.jpg?alt=media&token=189499ce-9ae6-44cf-927b-2316192e6bf1",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FJj.jpg?alt=media&token=394b6019-aaa4-4b2b-89ca-b9b1bce4581f",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FKk.jpg?alt=media&token=421f907d-01e7-4397-bbda-19387a0fc241",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FLl.jpg?alt=media&token=1e84c4b0-554e-4c41-9498-9c9eea3e50a2",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FMm.jpg?alt=media&token=c6db07d7-3821-4352-9f6e-09112ad1e22d",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FNn.jpg?alt=media&token=7cefeeb7-a9b1-4194-b36e-c1e56e7f66ff",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FOo.jpg?alt=media&token=f5196eab-8977-41f7-8b77-16eab414afa0",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FPp.jpg?alt=media&token=c3004d59-bf24-415e-b87c-94cc1cb53340",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FQq.jpg?alt=media&token=c79df538-8005-4b32-a0e4-53e3e5b284e2",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FRr.jpg?alt=media&token=0508d6ff-2948-48b3-a675-72eee2481d2e",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FSs.jpg?alt=media&token=e7f5b421-7959-4486-9c7f-663644aa3f91",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FTt.jpg?alt=media&token=f3b07b9e-89bc-4353-9186-229d1bedb5b8",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FUu.jpg?alt=media&token=15dcb358-9ae2-419f-88f9-86fce52789c6",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FVv.jpg?alt=media&token=029269dc-4ec1-46f1-b133-b727ff77a700",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FWw.jpg?alt=media&token=01547b3f-6b58-4c55-afd8-0ef3fe314a20",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FXx.jpg?alt=media&token=0e35c84b-83c2-4291-8386-1e19dd37f03b",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FYy.jpg?alt=media&token=700b2ce5-dee2-4af1-b10e-36af793d9433",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCWriting%2FZz.jpg?alt=media&token=9d9f8389-d7f7-4ce0-b52e-3011b3d430ac"
  ];

  List<String> alphabetsCharacter = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  List<String> alphabetsVoice = [
    "assets/abcVoice/A.mp3",
    "assets/abcVoice/B.mp3",
    "assets/abcVoice/C.mp3",
    "assets/abcVoice/D.mp3",
    "assets/abcVoice/E.mp3",
    "assets/abcVoice/F.mp3",
    "assets/abcVoice/G.mp3",
    "assets/abcVoice/H.mp3",
    "assets/abcVoice/I.mp3",
    "assets/abcVoice/J.mp3",
    "assets/abcVoice/K.mp3",
    "assets/abcVoice/L.mp3",
    "assets/abcVoice/M.mp3",
    "assets/abcVoice/N.mp3",
    "assets/abcVoice/O.mp3",
    "assets/abcVoice/P.mp3",
    "assets/abcVoice/Q.mp3",
    "assets/abcVoice/R.mp3",
    "assets/abcVoice/S.mp3",
    "assets/abcVoice/T.mp3",
    "assets/abcVoice/U.mp3",
    "assets/abcVoice/V.mp3",
    "assets/abcVoice/W.mp3",
    "assets/abcVoice/X.mp3",
    "assets/abcVoice/Y.mp3",
    "assets/abcVoice/Z.mp3",
  ];

  List<String> simpleAlphabetsLinks = [
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FAa.png?alt=media&token=277353a6-3ef0-44c8-bd63-2bd43230fd13",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FBb.png?alt=media&token=6de405d5-c584-4a42-b72f-45ea64bcec25",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FCc.png?alt=media&token=0fb299ba-6b90-46c2-b566-e932e4663f53",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FDd.png?alt=media&token=e45d03db-ba92-4253-8c41-050885d17d3d",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FEe.png?alt=media&token=39354350-cd71-4420-9fc2-7da9962f4c3c",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FFf.png?alt=media&token=6ea1ec1e-c5f9-4057-85a1-9f5726f19e49",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FGg.png?alt=media&token=1324920f-0e09-4b8c-94bf-e07fb7764eab",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FHh.png?alt=media&token=d05954fa-4f0e-47fb-a9cb-cd19db5c1f8b",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FIi.png?alt=media&token=2c7102e7-e0d0-48b1-a14f-84c7be349919",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FJj.png?alt=media&token=7f3808e9-efa2-4b9c-9c5c-ee63c335dfe2",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FKk.png?alt=media&token=b806e89b-ec9b-4661-822f-814caadc6f2e",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FLl.png?alt=media&token=17a1b3b5-7380-4deb-9956-92719d7a32d1",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FMm.png?alt=media&token=2b28efe8-0ffb-43b0-9101-471c17cbbc6a",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FNn.png?alt=media&token=b46e5711-ff2e-4848-a4c7-7068e09fae93",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FOo.png?alt=media&token=f98f52b7-ea6c-4693-8647-d29461e405cc",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FPp.png?alt=media&token=a03245bf-fc1c-4844-85e6-dc5726ce9eb3",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FQq.png?alt=media&token=01eac49b-4693-4660-8c5d-1db4158a803a",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FRr.png?alt=media&token=feceacd6-68e4-4865-9c33-37d82f665c6e",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FSs.png?alt=media&token=cea9796a-50eb-45e7-9959-e677190f011c",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FT.png?alt=media&token=418b29be-2614-4cee-a5ad-e7f494df4b0e",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FUu.png?alt=media&token=6b95edf1-c11d-4319-a3dc-78377b9c16e1",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FVv.png?alt=media&token=853ca612-b4b0-4f7b-96a7-e144152ccd51",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FWw.png?alt=media&token=5a36f271-0461-4d18-a71b-b099f7a6244d",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FXx.png?alt=media&token=d702e2a7-846d-411f-b949-238bd6458d15",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FYy.png?alt=media&token=bd9e1a53-fe4d-448d-9b97-c0c9c943fead",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ABCReading%2FZz.png?alt=media&token=40f4bbad-7f84-41e7-9bad-123ab0c50926"
  ];

  List<String> aForAppleLinks = [
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2FApple.JPG?alt=media&token=9acf7e8d-27a6-4e2f-b2b9-8f5430e3e7d9",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2FBall.JPG?alt=media&token=35d25160-7564-4406-a5db-1d889c3b374d",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2FCat.JPG?alt=media&token=c140e41c-3a1e-4ff8-8db8-a3fa21c8480b",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2FDog.JPG?alt=media&token=ea248e30-5475-4723-9cc5-7897bc7fb5ea",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2FeGG.JPG?alt=media&token=8b429bc6-9830-45b1-83ab-2d784ff0b10f",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2FfAN.JPG?alt=media&token=7dfd5ba9-c631-40ea-9eaa-81db2a8e5213",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2FGum.JPG?alt=media&token=f61c4499-39ea-4af0-a119-24977ad56876",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2FHen.JPG?alt=media&token=32704a8f-49e1-4a0a-bc2f-cbcd2b80959a",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2FIgloo.JPG?alt=media&token=72dfa94f-8e36-4634-941b-529916232fde",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2FjUMP.JPG?alt=media&token=a79fcd15-764c-407a-8575-363756a4f0d7",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2FKing.JPG?alt=media&token=8b563b4d-3383-4f97-a657-bd206f4046ab",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2FLion.JPG?alt=media&token=059ba26b-aefc-42b9-b632-7a319378fc19",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2FMonkey.JPG?alt=media&token=5dfdc8b9-e55e-422b-a45a-288c5721703a",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2FNest.JPG?alt=media&token=93636baa-524c-439e-9779-4644ab369f4d",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2FOwl.JPG?alt=media&token=dc854cb7-78cb-4aea-abbe-0977c3bbefc0",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2FPear.JPG?alt=media&token=d951b828-0937-4bad-8fa9-c7facffbea97",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2FQuilt.JPG?alt=media&token=c8233d49-efdd-410c-8f16-9b18f74f8b01",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2FrABBIT.JPG?alt=media&token=f387f332-6750-4dc6-a34f-56e8462b15f7",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2FSun.JPG?alt=media&token=5a17235d-b350-42a2-860b-9ebd4b8e0c6c",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2FTent.JPG?alt=media&token=bdd79eea-5491-4127-8c7a-9c40bebfe510",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2FUmbrella.JPG?alt=media&token=ab9203bd-5a19-4cde-be2e-305951060985",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2Fvest.JPG?alt=media&token=fd9c73fa-c385-4cb5-8e2f-7d79444c2635",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2Fwatch.JPG?alt=media&token=714188fe-1ffa-4c5c-9515-619142661241",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2Fxylophone.JPG?alt=media&token=1c20963d-8e13-43a2-9e80-aaea9e3725f2",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2Fyarn.JPG?alt=media&token=dfaaca8c-c8e5-4bde-842b-a359bd887b96",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforApple%2Fzoo.JPG?alt=media&token=c2f127c5-7c44-400f-b787-67cf9b00718c"
  ];

  List<String> aForAppleVoiceLinks = [
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FApple.mp3?alt=media&token=174d5c23-b161-4bab-8587-00bbff6850fe",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FBall.mp3?alt=media&token=d8d6e422-b79f-4b48-81d6-2edab426c95e",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FCat.mp3?alt=media&token=db7c27fc-6c5c-46fb-b3a5-69bc9395d365",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FDog.mp3?alt=media&token=ae25f66f-0750-4f3f-ab3e-69a53bc2487b",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FEgg.mp3?alt=media&token=d01661a0-b430-432d-8a8d-5eb10b3d7ef2",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FFan.mp3?alt=media&token=3983003f-af43-4d7c-9217-ddc4d3d2fb45",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FGum.mp3?alt=media&token=f7181a9e-1ea4-4c4b-948a-796e42caf878",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FHen.mp3?alt=media&token=2c3e9d0d-d400-4818-b7f9-67a9e4a7164e",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FIgloo.mp3?alt=media&token=092e7477-2d46-42d7-a5a4-69af343412f5",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FJump.mp3?alt=media&token=e58d66bc-a7d1-4323-8d0d-0b44e412925d",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FKing.mp3?alt=media&token=c3048e58-779c-4f74-9900-56047f8fb8ac",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FLion.mp3?alt=media&token=eb66a8e0-86e1-46bd-a1cc-d87495a32f2c",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FMonkey.mp3?alt=media&token=7121a077-a92e-4ebc-9ace-f620c614cfbb",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FNest.mp3?alt=media&token=587aa7b0-2a84-4fcc-b12a-c8e7048cb9c3",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FOwl.mp3?alt=media&token=a4c84015-facd-4772-b011-fca0616db708",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FPear.mp3?alt=media&token=08dfcfc3-4bbe-42c3-b89e-5f0aa1a47c4f",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FQuilt.mp3?alt=media&token=10f90d14-420f-4f1e-a7fc-7ee15be0bc6e",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FRabbit.mp3?alt=media&token=ac07ad92-c300-497d-aae6-31ff7a1b3161",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FSun.mp3?alt=media&token=15cbfafb-6a29-43cb-986b-c30d9db3d2be",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FTent.mp3?alt=media&token=ce99a8ed-d30c-4bad-91ff-958190a28995",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FUmbrella.mp3?alt=media&token=6187e68f-94bf-40e1-a2b0-95d60618b566",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FVest.mp3?alt=media&token=79f6cf65-241d-46ea-8d35-15921821bb84",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FWatch.mp3?alt=media&token=469d2621-0fb4-47c8-9bec-0c0121fda054",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FXylophone.mp3?alt=media&token=9ef2b36f-1d3f-44be-b448-1fba1c0ea48d",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FYarn.mp3?alt=media&token=89945c82-071a-483c-b664-c81804428a5d",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/AforAppleVoice%2FZoo.mp3?alt=media&token=13849590-8b96-47d3-9c63-f0d666366b26"
  ];

  List<String> aForAppleWords = [
    "APPLE",
    "BALL",
    "CAT",
    "DOG",
    "EGG",
    "FAN",
    "GUM",
    "HEN",
    "IGLOO",
    "JUMP",
    "KING",
    "LION",
    "MONKEY",
    "NEST",
    "OWL",
    "PEAR",
    "QUILT",
    "RABBIT",
    "SUN",
    "TENT",
    "UMBRELLA",
    "VEST",
    "WATCH",
    "XYLOPHONE",
    "YARN",
    "ZOO"
  ];

  List<String> colorsName = [
    "Red",
    "Orange",
    "Yellow",
    "Green",
    "Blue",
    "Purple",
    "Black",
    "Grey",
    "Pink",
    "Brown",
    "Lime",
    "Indigo",
  ];
  List<Color> colorsList = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.black,
    Colors.grey,
    Colors.pink,
    Colors.brown,
    Colors.lime,
    Colors.indigo
  ];

  List<String> colorsNameVoice = [
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ColorsName%2FRed.mp3?alt=media&token=f361bc50-430c-4644-87fa-62b7f933dabf",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ColorsName%2FOrange.mp3?alt=media&token=f4d529b6-2349-4950-9857-50e2d7b4af03",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ColorsName%2FYellow.mp3?alt=media&token=3641dec3-87f4-4a6f-a270-b87218c0cae9",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ColorsName%2FGreen.mp3?alt=media&token=58daa1ea-3e93-48f9-b29c-c3453153ab03",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ColorsName%2FBlue.mp3?alt=media&token=b53e1a60-990e-4e00-b9cc-2223362fd834",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ColorsName%2FPurple.mp3?alt=media&token=d6923903-0779-4294-aeb6-3c1b2f466acb",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ColorsName%2FBlack.mp3?alt=media&token=22b842bb-ebdf-4ccc-a8d2-9e6594020c53",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ColorsName%2FGrey.mp3?alt=media&token=8f63682e-0c72-425e-b246-f361d49efa84",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ColorsName%2FPink.mp3?alt=media&token=77349ee6-04a7-4b1c-80e7-0de28f6523c8",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ColorsName%2FBrown.mp3?alt=media&token=7935c83a-126f-49c1-b756-0fa1898bd171",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ColorsName%2FLime.mp3?alt=media&token=cadd147e-1874-4015-9149-339561417ef4",
    "https://firebasestorage.googleapis.com/v0/b/chlidren-education.appspot.com/o/ColorsName%2FIndigo.mp3?alt=media&token=9c8ddb0b-7422-4198-81fe-ce2f37bbc9df",
  ];

  /// Outlines a text using shadows.
  List<Shadow> outlinedText(
      {double strokeWidth = 2,
      Color strokeColor = Colors.black,
      int precision = 5}) {
    Set<Shadow> result = HashSet();
    for (int x = 1; x < strokeWidth + precision; x++) {
      for (int y = 1; y < strokeWidth + precision; y++) {
        double offsetX = x.toDouble();
        double offsetY = y.toDouble();
        result.add(Shadow(
            offset: Offset(-strokeWidth / offsetX, -strokeWidth / offsetY),
            color: strokeColor));
        result.add(Shadow(
            offset: Offset(-strokeWidth / offsetX, strokeWidth / offsetY),
            color: strokeColor));
        result.add(Shadow(
            offset: Offset(strokeWidth / offsetX, -strokeWidth / offsetY),
            color: strokeColor));
        result.add(Shadow(
            offset: Offset(strokeWidth / offsetX, strokeWidth / offsetY),
            color: strokeColor));
      }
    }
    return result.toList();
  }
}
