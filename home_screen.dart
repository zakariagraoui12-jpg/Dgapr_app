import 'package:flutter/material.dart';
import '../services/api_client.dart';
import 'news_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> news = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      final res = await ApiClient.get('/news'); // path ignored for mock
      setState(() {
        news = res ?? [];
        loading = false;
      });
    } catch (e) {
      setState(() => loading = false);
      print('error fetching news: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DGAPR'),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: news.length,
              itemBuilder: (ctx, i) {
                final item = news[i];
                return ListTile(
                  title: Text(item['title'] ?? 'عنوان'),
                  subtitle: Text(item['excerpt'] ?? ''),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => NewsDetailScreen(item: item)),
                    );
                  },
                );
              },
            ),
    );
  }
}
