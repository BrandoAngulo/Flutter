import 'package:flutter/material.dart';
import 'package:project_app_1/theme/app_theme.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Bar'),
      ),
      body: Column(
        children: [
          Slider(
              max: 400,
              min: 50,
              activeColor: AppTheme.primary,
              value: _sliderValue,
              onChanged:
                  _sliderEnabled //si onChange es true habilita la accion despues del ? si no : es null
                      ? (value) {
                          _sliderValue = value;
                          setState(() {});
                        }
                      : null),
          
          SwitchListTile(
            title: const Text('Activar o desactivar slider'),
            activeColor: AppTheme.primary,
            value: _sliderEnabled,
            onChanged: (value) => {
              setState(() {
                _sliderEnabled = value;
              })
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Image.network(
                'https://img2.freepng.es/20190715/axv/kisspng-sasuke-uchiha-kakashi-hatake-itachi-uchiha-madara-5d2c37a5d91996.8016974115631789178893.jpg',
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          )
        ],
      ),
    );
  }
}
