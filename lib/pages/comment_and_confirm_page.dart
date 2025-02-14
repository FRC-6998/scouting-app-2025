import 'package:flutter/material.dart';

class CommentAndConfirmPage extends StatelessWidget {
  const CommentAndConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Comment and Confirm Page'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // Expanded(
              //   flex: 1,
              //     child:
          const Align(
                      alignment: Alignment.topLeft,
                      child: Text('Comment:', style: TextStyle(fontSize: 25))),
        // ),
              // Spacer(),
              Expanded(
                flex: 10,
                child: TextField(
                  maxLines: null,
                  expands: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    // labelText: 'Comment',
                    hintText: 'Please enter your comment here',
                    // alignLabelWithHint: true,
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                  flex: 15,
                  child: Container(
                    color: Colors.red,
                  )),
              Spacer(),
              Expanded(
                  flex: 4,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Spacer(),
                      Expanded(
                        flex: 5,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Color(0xFFFFFFFF),
                              backgroundColor: Color(0xFF303E9B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () {
                              // logger.d("Back");
                              Navigator.pushNamed(context, '/auto');
                            },
                            child:
                                Text("Auto", style: TextStyle(fontSize: 30))),
                      ),
                      Spacer(flex:2),
                      Expanded(
                        flex: 5,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Color(0xFFFFFFFF),
                              backgroundColor: Color(0xFF303E9B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () {
                              // logger.d("comment");
                              Navigator.pushNamed(context, '/comment');
                            },
                            child: Text("End", style: TextStyle(fontSize: 30))),
                      ),
                      Spacer(),
                    ],
                  )),
              Spacer(),
            ],
          ),
        ));
  }
}
