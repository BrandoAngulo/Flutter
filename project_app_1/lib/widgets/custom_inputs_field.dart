import 'package:flutter/material.dart';

class CustomInputsFields extends StatelessWidget {
  final String? hintText;
  final String? helperText;
  final IconData? suffixIcon;
  final IconData? icon;
  final String? label;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String formProperty;
  final Map <String, String> formValues;

  const CustomInputsFields( {
    super.key,
     this.hintText,
     this.helperText,
     this.suffixIcon,
     this.icon,
     this.label,
     this.keyboardType,
     this.obscureText = false, //se pone por defecto en false por que normalmente viene asi peo tambien para que no tenga error al ponerlo para llamar el parametro
     required this.formProperty, 
     required this.formValues, 
  });

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      autofocus: false,
      //autocorrect: true,
      //la funcion OnChange captura el valor introducido en un input, le pasamos el formvalues q es el map y dentro las propiedades que va a recibir del formulario
      onChanged: (value) => formValues[formProperty] = value,
      //valida algo dentro del input ejemplo va a validar el minimo de caracteres en el input
      validator: (value) {
        if (value == null) return 'Este campo es requerido'; {
          return value.length < 3 ? 'minimo 3 caracteres' : null;
        }
      },
      //teclado para password
      obscureText: obscureText,
      //teclado para correo
      keyboardType: keyboardType,
      //llama la validacion realizada con el validator
      autovalidateMode: AutovalidateMode.onUserInteraction,
      //decora el input
      decoration: InputDecoration(
        //es el placeHolder, o muestra lo que el usuario debe insertar en ese input
        hintText: hintText, 
        //muestra lo que debemos teclear abajo del input
        helperText: helperText,
        //icono dento del input a la derecha
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon), //Icons.group_outlined
        //por fuera del input al lado izquierdo
        icon: icon == null ? null : Icon(icon), //Icons.assignment_ind_outlined
        //Titulo del campo 
        label: Text('$label'),
      ),
    );
  }
}
