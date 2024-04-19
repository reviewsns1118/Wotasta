import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchResultProvider = StateProvider<List<dynamic>>((ref) => []);
// Firestoreを使うProvider.
final firebaseProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);
// SearchStateNotifireを呼び出すProvider.
final searchStateNotifireProvider =
    StateNotifierProvider<SearchStateNotifire, dynamic>((ref) {
  return SearchStateNotifire(ref);
});

// キーワードで映画を検索するメソッドが使えるStateNotifier.
class SearchStateNotifire extends StateNotifier<dynamic> {
  final Ref _ref;
  SearchStateNotifire(this._ref) : super([]);

  // .whereでstring_id_arrayを検索して、候補を表示する
  Future<void> searchWhere(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('works')
        .where('titleOption', arrayContains: query)
        .get();
    // リストに、検索して取得したデータを保存する.
    _ref.watch(searchResultProvider.notifier).state =
        result.docs.map((e) => e.data()).toList();
  }
}