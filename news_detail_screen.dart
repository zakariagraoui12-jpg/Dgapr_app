import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailScreen extends StatelessWidget {
  final Map item;
  NewsDetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['title'] ?? 'تفاصيل'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(item['image'] != null)
                Image.network(item['image']),
              SizedBox(height: 12),
              Text(item['title'] ?? '', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(item['body'] ?? '', style: TextStyle(fontSize: 16)),
              SizedBox(height: 12),
              if(item['pdf'] != null)
                ElevatedButton(
                  onPressed: () async {
                    final url = item['pdf'];
                    if (await canLaunch(url)) await launch(url);
                  },
                  child: Text('تحميل الوثيقة'),
                )
            ],
          ),
        ),
      ),
    );
  }
}
