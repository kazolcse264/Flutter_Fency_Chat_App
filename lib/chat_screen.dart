import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frency_chat_app/chat_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<ChatMessage> _message = <ChatMessage>[];

  void _handleSubmitted(String text) {
    _textEditingController.clear();
    ChatMessage message = ChatMessage(text
    );
   setState(() {
     _message.insert(0, message);
   });
  }

  Widget _textComposerWidget() {
    return IconTheme(
      data: const IconThemeData(color: Colors.blue),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                decoration: const InputDecoration.collapsed(
                    hintText: "Enter a message"),
                controller: _textEditingController,
                onSubmitted: _handleSubmitted,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textEditingController.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(child: ListView.builder(
          padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_,int index)=>_message[index],
          itemCount: _message.length,
        ),
        ),
        Divider(
          height: 1.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor
          ),
          child: _textComposerWidget(),
        )
      ],
    );
  }
}
