import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class ReportBug extends StatelessWidget {
  var _reportController = TextEditingController();

  late ColorScheme theme;

  late Color splash;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context).colorScheme;
    splash = Theme.of(context).splashColor;
    return Scaffold(
      appBar: AppBar(
        title: Text("Report Bug"),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.report),
          )
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "You can always report to us any crashes or bugs you might have come accross through the usage of our app.\n\nWe would be glad to hear from you improvements also as your ideas are priceless.\n\nUse the form below to forward your reports, Thank You!",
                style: Theme.of(context).textTheme.headline6,
                softWrap: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _reportController,
                maxLines: 5,
                decoration: InputDecoration(
                    labelText: "Report bug",
                    labelStyle: Theme.of(context).textTheme.headline6,
                    hintText:
                        "eg : App crashes when put in landscape mode on version 5.0 android",
                    enabled: true,
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.2, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(8.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                color: theme.primaryContainer,
                child: Text(
                  "Send Now !",
                  style: Theme.of(context).textTheme.headline6,
                ),
                hoverElevation: 6.0,
                splashColor: splash,
                onPressed: () {
                  var report = _reportController.text;
                  sendReport(report);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void sendReport(report) async {
    if (report == null) report = '';
    final Email email = Email(
      body: 'Hi Hymnestry !\n\n${report.toString()}'.trim(),
      subject: 'Report Bug/Crash',
      recipients: ['hymnestryteam@outlook.com'],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }
}
