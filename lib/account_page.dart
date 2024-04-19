import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'infoupdate.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String dropdownValue = '投稿日時の新しい順'; // 初期選択値を設定

  Future<String> getDoc(String s) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return snapshot.data()![s] ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.account_circle),
                  color: Colors.white,
                  iconSize: 80,
                  onPressed: () async {
                    String nickname = await getDoc('nickname');
                    String introduction = await getDoc('introduction');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Infoupdate(nickname, introduction),
                      ),
                    );
                  },
                ),
              ],
            ),
            // 既存の情報
            FutureBuilder(
              future: getDoc('nickname'),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Text(
                  snapshot.data ?? "Guest",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold), // 太字に変更
                );
              },
            ),
            FutureBuilder(
              future: getDoc('introduction'),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Text(
                  snapshot.data ?? "",
                  style: const TextStyle(color: Colors.white),
                );
              },
            ),
            // タブバーとコンテンツ
            Expanded(
              child: Column(
                children: [
                  Container(
                    color: Colors.black,
                    child: TabBar(
                      indicatorColor: Colors.white, // 選択されているタブの色を白に設定
                      labelColor: Colors.white, // 選択されているタブのタブ名の色を白に設定
                      indicatorSize:
                          TabBarIndicatorSize.tab, // インジケーターのサイズをタブのサイズに設定
                      tabs: [
                        Tab(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.rocket_launch), // アイコンを追加
                              SizedBox(width: 5), // アイコンとテキストの間にスペースを追加
                              Text('Anime'), // タブ1
                            ],
                          ),
                        ),
                        Tab(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.menu_book), // アイコンを追加
                              SizedBox(width: 5), // アイコンとテキストの間にスペースを追加
                              Text('Comic'), // タブ2
                            ],
                          ),
                        ),
                        Tab(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.sports_esports), // アイコンを追加
                              SizedBox(width: 5), // アイコンとテキストの間にスペースを追加
                              Text('Game'), // タブ3
                            ],
                          ),
                        ),
                        Tab(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.local_movies), // アイコンを追加
                              SizedBox(width: 5), // アイコンとテキストの間にスペースを追加
                              Text('Movie'), // タブ4
                            ],
                          ),
                        ),
                        Tab(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.music_note), // アイコンを追加
                              SizedBox(width: 5), // アイコンとテキストの間にスペースを追加
                              Text('Music'), // タブ5
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // タブ1の内容
                        buildDropdown('Anime'),
                        // タブ2の内容
                        buildDropdown('Comic'),
                        // タブ3の内容
                        buildDropdown('Game'),
                        // タブ4の内容
                        buildDropdown('Movie'),
                        // タブ5の内容
                        buildDropdown('Music'),
                      ],
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

  Widget buildDropdown(String category) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: PopupMenuButton<String>(
            initialValue: dropdownValue,
            color: Colors.black, // ポップアップメニューの背景色を黒に設定
            onSelected: (String value) {
              setState(() {
                dropdownValue = value;
              });
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: '投稿日時の新しい順',
                  child: Text(
                    '投稿日時の新しい順',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: '投稿日時の古い順',
                  child: Text(
                    '投稿日時の古い順',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: '評価の高い順',
                  child: Text(
                    '評価の高い順',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  value: '評価の低い順',
                  child: Text(
                    '評価の低い順',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ];
            },
            child: Row(
              children: [
                Text(
                  dropdownValue,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
