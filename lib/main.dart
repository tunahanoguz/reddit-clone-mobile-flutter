import 'package:flutter/material.dart';
import 'clients/channel_client.dart';
import 'models/channel_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ChannelClient channelClient = new ChannelClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
            future: channelClient.getAll(),
            builder: (BuildContext context, AsyncSnapshot<List<Channel>> snapshot) {
              if (snapshot.hasData) {
                List<Channel> channels = snapshot.data;
                return ListView(
                  children: channels.map((Channel channel) => Text(channel.name)).toList(),
                );
              }

              return CircularProgressIndicator();
          },),
      ),
    );
  }
}
