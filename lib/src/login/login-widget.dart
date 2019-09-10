import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loginlaranjeira/src/login/login-bloc.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      bloc: LoginBloc(context),
      child:Material(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network("https://www.tvovermind.com/wp-content/uploads/2017/12/Cheetahs-640x362.jpg", fit: BoxFit.cover),
            Container(
              color: Colors.grey[800].withOpacity(0.4),
            ),
            SingleChildScrollView(child: _LoginContent()),
            ],
        ),
      ),
    );
  }
}

class _LoginContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   LoginBloc bloc = BlocProvider.of<LoginBloc>(context);
    _botoes() {
      return Column(
        children: <Widget>[
          RaisedButton.icon(
            textColor: Colors.white,
            color: Colors.teal,
            label: Text("Entre com Telefone "),
            icon: Icon(Icons.phone),
            onPressed: bloc.onClickT,
          ),
           RaisedButton.icon(
            textColor: Colors.white,
            color: Colors.red,
            label: Text("Entre  com  Gmail     "),
            icon: Icon(FontAwesomeIcons.google),
            onPressed: bloc.onClickG,
          ),
           RaisedButton.icon(
            textColor: Colors.white,
            color: Colors.lightBlue,
            label: Text("Entre com Facebook"),
            icon: Icon(FontAwesomeIcons.facebook),
            onPressed: bloc.onClickF,
          ),
        ],
      );
    }
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlutterLogo(size: 75,),
          Container(height: 90,),
          StreamBuilder(
            stream: bloc.outLoading,
            initialData: false,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              return AnimatedCrossFade(
                firstChild: _botoes(),
                secondChild: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                  ),
                duration: Duration(milliseconds: 500),
                crossFadeState: snapshot.data ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              );
            },
          ),
          TextField(
            onChanged: bloc.phoneEvent.add,
            onSubmitted: (String value) => bloc.onClickT()
          )
        ],
      );
      
    
  }
}