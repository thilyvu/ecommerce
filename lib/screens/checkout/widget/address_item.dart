import 'package:flutter/material.dart';

class MedicationRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final medicationCardContent = new Container(
      margin: new EdgeInsets.all(16.0),
      constraints: new BoxConstraints.expand(),
      child: new Container(
        height: 4.0,
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Container(width: 5.0),
                        new Text('Medication:',
                            style: new TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    new Container(height: 5.0),
                    new Text("123"),
                    new Container(height: 5.0),
                    new Text("456"),
                    new Container(height: 5.0),
                  ],
                ),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        new Container(width: 5.0),
                        new Text(
                          'Dosage:',
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    new Container(height: 5.0),
                    new Text("123", overflow: TextOverflow.ellipsis),
                    new Container(height: 5.0),
                  ],
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Text('Amount to give:'),
                new Text("123"),
              ],
            ),
          ],
        ),
      ),
    );

    final medicationCard = new Container(
      child: medicationCardContent,
      height: 140.0,
      decoration: new BoxDecoration(
        color: new Color(0xFFFFFFFF),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return new Container(
      height: 140.0,
      margin: EdgeInsets.all(16.0),
      child: new Column(
        children: <Widget>[
          medicationCard,
        ],
      ),
    );
  }
}
