import 'package:flutter/material.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: ListView(
            children: [
              _aboutApplication(context),
              _creditsApplication(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _aboutApplication(context){
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(bottom: 30.0),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Text("Acerca de",
              style: TextStyle(color: Color(0xFF7f4ca5), fontSize: 22, fontWeight: FontWeight.bold)
          ),
          Text("Lugares históricos"),
          Text("Versión 1.0"),
          Text("Aplicación relacionada con diferentes lugares históricos del mundo, el objetivo de esta es informativa dando a conocer la información básica de estos lugares.", textAlign: TextAlign.justify,),
          Text("Soporte",  style: TextStyle(fontWeight: FontWeight.bold)),
          Text("Esta aplicación fue realizada por Cristian Hernández Bautista como un proyecto personal, este se puede encontrar en github para futuras opiniones o contribuciones.", textAlign: TextAlign.justify),
        ],
      ),
    );
  }

  Widget _creditsApplication(context){
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(bottom: 30.0),
      decoration: _boxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Text("Creditos",
              style: TextStyle(color: Color(0xFF7f4ca5), fontSize: 22, fontWeight: FontWeight.bold)
          ),
          Text("La aplicación toma información de terceros, el link correspondiente se encuentra en cada sección. Si algún contenido cree que tenga derechos de autor puede notificarmelo.", textAlign: TextAlign.justify,),
          Text("Imágenes de lugares historicos",  style: TextStyle(fontWeight: FontWeight.bold)),
          Text("Las imáges fueron obtenidas de la página https://pixabay.com/. Los créditos son para sus respectivos autores.", textAlign: TextAlign.justify,),
          Text("Icono de la aplicación",  style: TextStyle(fontWeight: FontWeight.bold)),
          Text("Sitio historico icono creado por SBTS2018 -> https://www.flaticon.es/iconos-gratis/sitio-historico")
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration(){
    return BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(4.0, 4.0),
          blurRadius: 10.0,
        ),
      ],
    );
  }
}
