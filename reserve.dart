import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        passwordErrorText = 'Passwords do not match';
      });
    } else {
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
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            Text('Age: ${_age.toInt()}'),
            Slider(
              value: _age,
              min: 18,
              max: 100,
              divisions: 82,
              onChanged: (newValue) {
                setState(() {
                  _age = newValue;
                });
              },
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _description = value;
                });
              },
              decoration: const InputDecoration(labelText: 'Short Description'),
              maxLines: 3,
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
            Image.asset('../assets/oki.jpg'), 
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
