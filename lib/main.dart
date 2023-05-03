import 'package:flutter/material.dart';
import 'package:flutter_tutorial/git_flu.dart';

void main() {
  runApp(GitFluApp());
}

class GitFluApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GitFlu",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Título do App"),
        ),
        body: Center(
          child: GitFluWidget(),
        ),
      ),
    );
  }
}
