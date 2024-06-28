import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFormFieldsDisplay extends StatefulWidget {
  @override
  _TextFormFieldsDisplayState createState() => _TextFormFieldsDisplayState();
}

class _TextFormFieldsDisplayState extends State<TextFormFieldsDisplay> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _controller = TextEditingController();
  TextEditingController _controllerTime = TextEditingController();
  double _progress = 0;
  double _time = 0;

  List<String> _formValues = [];

  void _submitForm() {
    setState(() {
      //_formValues.clear();
      _formValues.add('Name: ${_nameController.text}');
      _formValues.add('Email: ${_emailController.text}');
      _formValues.add('Phone: ${_phoneController.text}');
      double _progresss = double.tryParse(_controller.text) ?? 0;
      _progress += _progresss;
      _formValues.add('Calories: ${_progresss}');
      double _timee = double.tryParse(_controllerTime.text) ?? 0;
      _time += _timee;
      _formValues.add('Workout Time: ${_timee}');
      
    });
  }
  
/*
  void initState() {
    super.initState();
    _progress = 0/1000;
  }*/
/*
  void _updateProgress() {
    setState(() {
      _progress = double.tryParse(_controller.text) ?? 0.0;
      if (_progress > 1000) {
        _progress = 1000;
      } else if (_progress < 0.0) {
        _progress = 0.0;
      }
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextFormFields Display'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Enter Name'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Enter Email'),
            ),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Enter Phone'),
            ),
            TextFormField(
              controller: _controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Enter Calories'),
              
            ),
            TextFormField(
              controller: _controllerTime,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Enter Time'),
              
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: _formValues.isEmpty
              ? Center(child: Text('no Inputs yet'))
               : ListView.builder(
                itemCount: _formValues.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_formValues[index]),
                  );
                },
              ),
            ),
            Row(
            children: <Widget>[
              Column(
              mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
            child: CircularProgressIndicator(
              value: _progress / 2500,
              strokeWidth: 10,
            ),
            height: 80,
            width: 80,
            ),
            ]
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
            child: CircularProgressIndicator(
              value: _time / 2500,
              strokeWidth: 10,
            ),
            height: 80,
            width: 80,
            ),
            ]
            ),
            ]
            ),
            SizedBox(height: 16,),
            Text('Calories: ${(_progress)}kg',
            style: TextStyle(fontSize: 20),
            ),
            Text('Time it takes: ${(_time)}min',
            style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _controller.dispose();
    _controllerTime.dispose();
    super.dispose();
  }
}