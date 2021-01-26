import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final steps = [
    'step1',
    'step2',
    'step3',
  ];

  final form = FormGroup({
    // 'name': FormControl<String>(validators: [Validators.required,]),
    // 'category': FormControl<String>(validators: [Validators.required,]),
    // 'instructions': FormControl<String>(),
    // 'unit': FormControl<int>(validators: [Validators.required,]),
    'steps': FormArray<String>([]),
  });

  FormArray<String> get selectedSteps => form.control('steps') as FormArray;

  @override
  void initState() {
    selectedSteps.addAll(
      steps.map((step) => FormControl<String>(value: '')).toList(),
    );
    super.initState();
  }

  Widget _buildStepListItem(step) {
    return ReactiveTextField(
      formControlName: this.steps.indexOf(step).toString(),
      decoration: InputDecoration(
        labelText: step,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steps',
      home: Scaffold(
        body: ReactiveForm(
          formGroup: this.form,
          child: Column(
            children: [
              ReactiveFormArray<String>(
                formArrayName: 'steps',
                builder: (context, formArray, child) => Column(
                  children: this.steps.map(_buildStepListItem).toList(),
                ),
              ),
              ReactiveFormConsumer(
                builder: (context, form, child) {
                  return RaisedButton(
                    child: Text('Send'),
                    onPressed: form.valid
                        ? () {
                      print(this.selectedSteps.rawValue);
                    }
                        : null,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
