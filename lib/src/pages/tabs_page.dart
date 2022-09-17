import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //Con esto ya se tiene una instancia de navegacion model, elñ cual tiene sus propiedades publicas
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
       ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({
    Key? key,
  }) : super(key: key);

  @override
  //Context es un objecto que tiene la informacion de toda la estructura del arbol de widgets 
  Widget build(BuildContext context) {
    //Para obtener la instancia se crea una nueva propiedad navegacionModel el cual sera asginado por:
    //una busqueda en el contexto acerca de _NavegacionModel
    final navegacionModel = Provider.of<_NavegacionModel>(context);




    return BottomNavigationBar(
      //Aqui esta escuchando
      currentIndex: navegacionModel.paginaActual,
      //Con esto se cambia el valor del provider
      onTap: (i) => navegacionModel.paginaActual = i,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Para ti' ),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Encabezados' ),
      ]);
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.pageController,
      //Para que salga un poco mas de scroll como una parte negra
      //physics: BouncingScrollPhysics(),
      //Para inhabilitar el scroll del PageView
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[

        Container(
          color: Colors.red,
        ),

        Container(
          color: Colors.green,
        )

      ],


    );
  }
}

class _NavegacionModel with ChangeNotifier{

  int _paginaActual = 0;
  //Aqui se inicializa el pageController
  PageController _pageController = new PageController();
  //el get expone esta propiedad para que cualquier pagina donde se este trabajando con la instancia pueda ver la pagina actual
  int get paginaActual => this._paginaActual;

  set paginaActual(int valor){ 
    this._paginaActual = valor;
    
    _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeOut);

    notifyListeners();
    //Cuando se establezca un valor se va a poder hacer el procedimiento de notificar a todos los widgets
    //que estan pendientes de paginaActual para que se redibujen de ser necesario para esto es necesario
    //el ChangeNotifier
  }
  //Mediante es controller y get se lo establecemos al PageView por la linea 50 masomenos
  PageController get pageController => this._pageController;

}