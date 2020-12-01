import 'package:flutter/material.dart';

String title = 'Plantila 1';

int _currentStep = 0;

StepperType _stepperType = StepperType.vertical;

switchStepType() {
  setState(() => _stepperType == StepperType.vertical 
      ? _stepperType = StepperType.horizontal 
      : _stepperType = StepperType.vertical);
}

class TemplateScreen extends StatefulWidget {

  static String id = 'plantilla';

  @override
  _TemplateScreenState createState() => _TemplateScreenState();

}

class _TemplateScreenState extends State<TemplateScreen> {
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Stepper(
        steps: _stepper(),
        physics: ClampingScrollPhysics(),
        currentStep: this._currentStep,
        type: _stepperType,
        onStepTapped: (step) {
          setState(() {
            this._currentStep = step;
          });
        },
        onStepContinue: () {
          setState(() {
            if( this._currentStep < this._stepper().length - 1) {
              this._currentStep = this._currentStep + 1;
            }else {
              print('Complete');
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (this._currentStep > 0){
              this._currentStep = this._currentStep - 1;
            } else {
              this._currentStep = 0;
            }
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: switchStepType, 
        backgroundColor:  Colors.purple,
        child: Icon(Icons.swap_horizontal_circle, color: Colors.white)
      ),
    );
  }

  List<Step> _stepper() {
    List<Step> _steps = [
      Step(
        title: Text('Título'),
        content: Column(
          children: <Widget>[
            TextFormField(decoration:  InputDecoration(labelText: 'Título')
            ),
            TextFormField(decoration:  InputDecoration(labelText: 'Subtítulo:')
            ),
          ]
        ),
        isActive: _currentStep >= 0,
        state: StepState.complete
      ),
      Step(
        title: Text('Contenido'),
        content: Column(
          children: <Widget>[
            TextFormField(decoration:  InputDecoration(labelText: 'Primer Parráfo'),
            ),
            TextFormField(decoration:  InputDecoration(labelText: 'Segundo Parráfo'),
            ),
          ]
        ),
        isActive:  _currentStep >= 1,
        state: StepState.disabled
      ),
      Step(
        title: Text('Pie de Página'),
        content: Column(
          children: <Widget>[
            TextFormField(decoration:  InputDecoration(labelText: 'Fin de párrafo'),
            ),
            TextFormField(decoration:  InputDecoration(labelText: 'Firma:'),
            ),
          ]
        ),
        isActive: _currentStep >= 2,
        state: StepState.error
      ),
    ];
    return _steps;
  }

}
