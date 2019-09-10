
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loginlaranjeira/src/home/home-widget.dart';
import 'package:loginlaranjeira/src/services/authentication.dart';
import 'package:rxdart/rxdart.dart';


class LoginBloc extends BlocBase{

  final Authentication _authentication = new Authentication();

  final _phoneController = new BehaviorSubject<String>();
  Observable<String> get phoneFlux => _phoneController.stream;
  Sink<String> get phoneEvent => _phoneController.sink;

  final _smsController = new BehaviorSubject<String>();
  Observable<String> get smsFlux => _smsController.stream;
  Sink<String> get smsEvent => _smsController.sink;


  var _controllerLoading = BehaviorSubject<bool>(seedValue: false);
  Stream<bool> get outLoading => _controllerLoading.stream;
  final BuildContext context;
  LoginBloc(this.context);

  onClickT() async{
    _controllerLoading.add(!_controllerLoading.value);
    ///await Future.delayed(Duration(seconds: 2));
    await _authentication.verifyPhoneNumber(_phoneController.value);
    _controllerLoading.add(!_controllerLoading.value);
    
     Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (BuildContext context) => HomePage())
     );
  }
  onClickG() async{
    _controllerLoading.add(!_controllerLoading.value);
    await Future.delayed(Duration(seconds: 2));
    _controllerLoading.add(!_controllerLoading.value);
    
  }
  onClickF() async{
    _controllerLoading.add(!_controllerLoading.value);
    await Future.delayed(Duration(seconds: 2));
    _controllerLoading.add(!_controllerLoading.value);

    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
  }
   @override
  void dispose(){

    _controllerLoading.close();
    _phoneController.close();
    _smsController.close();
    
    }

}