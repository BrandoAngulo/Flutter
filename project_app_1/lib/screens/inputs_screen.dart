import 'package:flutter/material.dart';
import 'package:project_app_1/widgets/custom_inputs_field.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState>myFormKey = GlobalKey<FormState>();
    
    final Map<String, String>formValues={
      'nombre': 'prueba',
      'apellido':'prueba2',
      'correo':'prueba@prueba.com',
      'password':'123456*/s',
      'role':'admin',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y forms'),
      ),
      //trabajar dentro del SingleChildScrollView nos permite dar scroll cuando aparece el teclado y nos tama la demas informacion
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10), 
        child : Form(
          key: myFormKey,
          child: Column(
            children: [
              CustomInputsFields(hintText: 'Nombre', helperText: 'Solo letras', icon: Icons.assignment_ind_outlined, suffixIcon: Icons.group_outlined,
               label: 'Nombre', formProperty: 'nombre', formValues: formValues, ),

              CustomInputsFields(hintText: 'Apellido', helperText: 'Solo letras', icon: Icons.assignment_ind_outlined, suffixIcon: Icons.group_outlined
              ,label: 'Apellido', formProperty: 'apellido', formValues: formValues,),

              CustomInputsFields(hintText: 'Correo', helperText: 'Solo letras', icon: Icons.email_outlined, suffixIcon: Icons.send_rounded,label: 'Correo',
               keyboardType: TextInputType.emailAddress, formProperty: 'correo', formValues: formValues,),

              CustomInputsFields(hintText: 'Contraseña', icon: Icons.password, suffixIcon: Icons.security_outlined,label: 'Contraseña', obscureText: true,
               formProperty: 'password', formValues: formValues,),

              //boton para guardar datos del formulario
              ElevatedButton(child: const SizedBox(width: double.infinity,child: Center(child: Text('Guardar'),),),
              
                onPressed: () {
                  //remover teclado siempre que se toque el boton
                  FocusScope.of(context).requestFocus(FocusNode());
                  //si la key no llega a este formulario
                  if (!myFormKey.currentState!.validate()) {
                    print(formValues);
                    return;
                  }
              },
              )
            ],
          ),
        ),
      ),
      );
  }
}

