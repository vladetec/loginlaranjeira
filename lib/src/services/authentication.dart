import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
class Authentication{
  final _firebase = FirebaseAuth.instance;
  Future<bool> signWithPhone(String verificacaoId, String codigoSms)
   async {
     final loginResults = await _firebase.signInWithPhoneNumber(
      verificationId: verificacaoId, smsCode: codigoSms
      );
      if (loginResults?.uid != null){
        return true;
      }
      else{
        return false;
      }
    }
 //C:\Program Files (x86)\Java\jre1.8.0_221\bin   
//keytool -list -v -keystore "%USERPROFILE%\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
  Future verifyPhoneNumber(String numeroDoCelular) async {
    await _firebase.verifyPhoneNumber(
      phoneNumber: numeroDoCelular,
      codeSent: (String verified, [int forceResend]){
        print("verificado com sucesso");
        print(verified);
      },
      verificationFailed: (AuthException autenticaoException) {
        print("Erro na verificacao");
      },
      verificationCompleted: (FirebaseUser user) {
        print(user?.uid);
      },
      codeAutoRetrievalTimeout: (String timeOut) {
        print(timeOut);
      },
      timeout: Duration(seconds: 20)
    );

  } 
}

