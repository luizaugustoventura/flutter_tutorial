import 'package:flutter/material.dart';
import 'package:flutter_tutorial/member.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GitFluState extends State<GitFluWidget> {
  var _members = <Member>[];
  final _font = const TextStyle(fontSize: 20.0);

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  _loadData() async {
    final url = Uri.https("api.github.com", "orgs/adobe/members");
    final response = await http.get(url);
    // UI thread
    setState(() {
      final membersJSON = jsonDecode(response.body);

      for (var member in membersJSON) {
        _members.add(Member(member["login"], member["avatar_url"]));
      }
    });
  }

  Widget _buildRow(int position) {
    return ListTile(
      title: Text("${_members[position].login}", style: _font),
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        backgroundImage: NetworkImage(_members[position].avatarUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _members.length,
      itemBuilder: (BuildContext context, int position) {
        return _buildRow(position);
      },
    );
  }
}

class GitFluWidget extends StatefulWidget {
  @override
  createState() => GitFluState();
}
