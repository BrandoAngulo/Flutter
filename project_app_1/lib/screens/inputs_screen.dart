import 'package:flutter/material.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y forms'),
      ),
      //trabajar dentro del SingleChildScrollView nos permite dar scroll cuando aparece el teclado y nos tama la demas informacion
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10), 
        child : Column(
          children: [
            TextFormField(
              autofocus: false,
              //autocorrect: true,
              //la funcion OnChange captura e valor tecleado en el input
              onChanged: (value) {
                print('$value');
              },
              //valida algo dentro del input ejemplo va a validar el minimo de caracteres en el input
              validator: (value) {
                if (value == null) return 'Este campo es requerido'; {
                  return value.length < 3 ? 'minimo 3 caracteres' : null;
                }
              },
              //llama la validacion realizada con el validator
              autovalidateMode: AutovalidateMode.onUserInteraction,
              //decora el input
              decoration: const InputDecoration(
                //es el placeHolder, o muestra lo que el usuario debe insertar en ese input
                hintText: 'Nombre', 
                //muestra lo que debemos teclear abajo del input
                helperText: 'Solo Letras',
                //icono dento del input a la derecha
                suffixIcon: Icon(Icons.group_outlined),
                //por fuera del input al lado izquierdo
                icon: Icon(Icons.assignment_ind_outlined),
                //Titulo del campo 
                label: Text('Nombre'),
                //aplica bordes en el input
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topRight: Radius.circular(10))
                )
              ),
            ),
          ],
        ),



      ),
      );
  }
}
