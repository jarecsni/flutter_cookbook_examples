import 'package:flutter/material.dart';
import 'package:flutter_cookbook_examples/chapter6/stop_watch.dart';

const emailRegex =
    "([-!#-'*+/-9=?A-Z^-~]+(\\.[-!#-'*+/-9=?A-Z^-~]+)*|\"([]!#-[^-~ \t]|(\\[\t -~]))+\")@([-!#-'*+/-9=?A-Z^-~]+(\\.[-!#-'*+/-9=?A-Z^-~]+)*|\\[[\t -Z^-~]*])";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = '';
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: _buildLoginForm(),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Widget _buildSuccess() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.check, color: Colors.orangeAccent),
        Text('Hi $name')
      ],
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Runner'),
              validator: (text) =>
                  text!.isEmpty ? "Enter the runner's name." : null,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (text) {
                if (text!.isEmpty) {
                  return "Enter the runner's email.";
                }
                final regex = RegExp(emailRegex);
                if (!regex.hasMatch(text)) {
                  return 'Enter a valid email address.';
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Continue'),
              onPressed: () {
                var valid = _validate();
                if (valid) {
                  _navigateToStopWatch();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  _validate() {
    final form = _formKey.currentState;
    bool valid = form?.validate() ?? false;
    if (valid) {
      setState(() {
        name = _nameController.text;
      });
    }
    return valid;
  }

  _navigateToStopWatch() {
    final name = _nameController.text;
    final email = _emailController.text;
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (_) => StopWatch(name: name, email: email),
    // ));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (_) => StopWatch(name: name, email: email),
    ));
  }
}
