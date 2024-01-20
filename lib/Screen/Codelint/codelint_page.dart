import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CodeLint extends StatefulWidget {
  const CodeLint({Key? key}) : super(key: key);

  @override
  State<CodeLint> createState() => _CodeLintState();
}

class _CodeLintState extends State<CodeLint> {
  // List to store chat messages
  List<String> messages = [];
  List<String> responseValues = [];

  // Controller for the text input field
  TextEditingController _messageController = TextEditingController();

  // Replace this URL with your actual API endpoint
  static const String apiEndpoint = 'http://192.168.18.179:3000/measurePerformance';

  // Function to handle sending a message
  void _sendMessage() async {
    String message = _messageController.text;
    if (message.isNotEmpty) {
      try {
        // Send the message to the API
        final response =
            await http.post(Uri.parse(apiEndpoint), body: {'code': message});

        if (response.statusCode == 200) {
          // If the API call is successful, add the message to the chat
          setState(() {
            messages.add(message);
            _messageController.clear();
            responseValues = response.body.split(','); // Assuming values are separated by commas
          });
        } else {
          // Handle API error (you might want to show an error message to the user)
          print(
              'Failed to send message. HTTP Status Code: ${response.statusCode}');
        }
      } catch (error) {
        // Handle network error
        print('Error sending message: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SunnyaGPT',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: messages[index].startsWith('You: ')
                        ? Alignment.bottomRight
                        : Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: messages[index].startsWith('You: ')
                              ? Colors.blue
                              : Colors.grey[300],
                        ),
                        child: ListTile(
                          title: Text(
                            messages[index],
                            style: TextStyle(
                              color: messages[index].startsWith('You: ')
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: responseValues.map((value) {
                return Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300], // Grey color
                      borderRadius: BorderRadius.circular(8.0), // Rounded border radius
                    ),
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    child: Text(value),
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  InkWell(
                    child: Icon(
                      Icons.send,
                      color: Colors.black,
                      size: 24.0,
                      semanticLabel: 'Send Message',
                    ),
                    onTap: _sendMessage, // Call the function when the icon is tapped
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CodeLint(),
  ));
}
