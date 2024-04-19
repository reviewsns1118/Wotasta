import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WritePost extends StatefulWidget {
  WritePost(this.document, {super.key});
  Map<String, dynamic>? document;

  @override
  State<WritePost> createState() => _WritePostState(document);
}

class _WritePostState extends State<WritePost> {
  _WritePostState(this.document);
  Map<String, dynamic>? document;
  int score = 0;
  String rank = 'C';
  Color rank_color = Colors.white;
  Map<String, IconData> genreicon = {
    '映画': Icons.theaters,
    '文庫本': Icons.book,
    '漫画': Icons.menu_book,
    'アニメ': Icons.rocket_launch,
    'ゲーム': Icons.videogame_asset,
  };
  bool netabare = false;
  bool ending = false;
  CollectionReference works = FirebaseFirestore.instance.collection('works');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        // タイトルテキスト
        title: const Text(
          'Thoughts',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Row(children: [
                Icon(
                  genreicon[document!["genre"]],
                  color: Colors.white,
                ),
                Image(
                  image: NetworkImage(document!["imageURL"]),
                  height: 45,
                  width: 60,
                ),
                Text(
                  document!["title"],
                  style: const TextStyle(color: Colors.white),
                )
              ]),
            ),
            TextField(
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: '点数(0-100点)',
                icon: Text(
                  rank,
                  style: TextStyle(color: rank_color),
                ),
              ),
              onChanged: (String value) {
                setState(() {
                  score = int.parse(value);
                  if (score < 60) {
                    rank = 'C';
                    rank_color = Colors.white;
                  } else if (score < 80) {
                    rank = 'B';
                    rank_color = Colors.blue;
                  } else if (score < 80) {
                    rank = 'A';
                    rank_color = Colors.red;
                  } else {
                    rank = 'S';
                    rank_color = Colors.yellow;
                  }
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                fillColor: Colors.white,
                hintText: '感想を書く',
              ),
              onChanged: (String value) {
                setState(() {
                  score = int.parse(value);
                  if (score < 60) {
                    rank = 'C';
                    rank_color = Colors.white;
                  } else if (score < 80) {
                    rank = 'B';
                    rank_color = Colors.blue;
                  } else if (score < 80) {
                    rank = 'A';
                    rank_color = Colors.red;
                  } else {
                    rank = 'S';
                    rank_color = Colors.yellow;
                  }
                });
              },
            ),
            Row(
              children: [
                Checkbox(
                  value: netabare,
                  onChanged: (value) {
                    netabare = value!;
                  },
                  checkColor: Colors.blue,
                ),
                const Text(
                  "ネタバレ注意",
                  style: TextStyle(color: Colors.white),
                ),
                Checkbox(
                  value: ending,
                  onChanged: (value) {
                    ending = value!;
                  },
                  checkColor: Colors.blue,
                ),
                const Text(
                  "最後まで見た",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            const Text(
              "上位のタグ",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
