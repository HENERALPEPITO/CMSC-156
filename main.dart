import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LAB 4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      home: const SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  
  double _age = 18;
  String _description = '';
  String? passwordErrorText;

  void _submitForm() {
  if (_nameController.text.isEmpty ||
      _passwordController.text.isEmpty ||
      _confirmPasswordController.text.isEmpty ||
      _description.isEmpty) {
    showDialog( 
      context: context,
      builder: (context) => AlertDialog(
        title: Text('All fields are required'),
        content: Text('Please fill in all fields.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  } else if (_passwordController.text != _confirmPasswordController.text) {
    setState(() {
      passwordErrorText = 'Passwords do not match';
    });
  } else {
    setState(() {
      passwordErrorText = null;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayUserInfoPage(
          name: _nameController.text,
          age: _age.toInt(),
          description: _description,
        ),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LAB 4'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              maxLength: 30,
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name', 
              hintText: 'Whats your name????',),
            ),
            TextFormField(
              maxLength: 20,
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextFormField(
              maxLength: 20,
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                errorText: passwordErrorText,
              ),
              obscureText: true,
            ),
            
            const SizedBox(height: 16.0),
            Text('Age: ${_age.toInt()}'),
            Slider(
              value: _age,
              min: 1,
              max: 100,
              onChanged: (newValue) {
                setState(() {
                  _age = newValue;
                });
              },
            ),
            TextFormField(
              maxLength: 100,
              onChanged: (value) {
                setState(() {
                  _description = value;
                });
              },
              decoration: const InputDecoration(labelText: 'Short Description',
              hintText: 'Storya ginagmay'),
              maxLines: 2,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class DisplayUserInfoPage extends StatelessWidget {
  final String name;
  final int age;
  final String description;

  const DisplayUserInfoPage({
    required this.name,
    required this.age,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('https://atletiko.ph/wp-content/uploads/2022/12/Apollo-Quiboloy.jpg'),
            const SizedBox(height: 16.0),
            Text('Name: $name'),
            Text('Age: $age'),
            Text('Short Description: $description'),
          ],
        ),
      ),
    );
  }
}
