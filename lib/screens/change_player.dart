import 'package:flutter/material.dart';
import 'package:tapxercise/utils/api.dart';

class ChangePlayerScreen extends StatefulWidget {
  const ChangePlayerScreen({Key key}) : super(key: key);

  @override
  State<ChangePlayerScreen> createState() => _ChangePlayerScreenState();
}

class _ChangePlayerScreenState extends State<ChangePlayerScreen> {
  final _versusFormKey = GlobalKey<FormState>();
  final _soloFormKey = GlobalKey<FormState>();

  TextEditingController soloPlayerName = TextEditingController();
  TextEditingController VersusPlayer1Name = TextEditingController();
  TextEditingController VersusPlayer2Name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Solo'),
              Tab(text: 'Versus'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // --------------------------------------- Solo ---------------------------------------
            Form(
              key: _soloFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Text('Player name:'),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: TextFormField(
                              controller: soloPlayerName,
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_soloFormKey.currentState.validate()) {
                          final res = await NssProductions.postChangePlayer(
                              1, soloPlayerName.text.toString(), 'null');
                          if (res == 201) {
                            // Success
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Success. Playername changed')),
                            );
                            Navigator.pop(context);
                          } else {
                            // fail
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'An error occured. Please try again')),
                            );
                          }
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
            // ---------------------------------------- Versus -------------------------------------------
            Form(
              key: _versusFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Text('Player 1:'),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: TextFormField(
                              controller: VersusPlayer1Name,
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter player 1 name';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Text('Player 2:'),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: TextFormField(
                              controller: VersusPlayer2Name,
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter player 2 name';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_versusFormKey.currentState.validate()) {
                          final res = await NssProductions.postChangePlayer(
                              2,
                              VersusPlayer1Name.text.toString(),
                              VersusPlayer2Name.text.toString());
                          if (res == 201) {
                            // Success
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Success. Playername changed')),
                            );
                            Navigator.pop(context);
                          } else {
                            // fail
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'An error occured. Please try again')),
                            );
                          }
                        }
                      },
                      child: const Text('Submit'),
                    ),
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
