import 'package:flutter/material.dart';

import '../../../../data/data_news.dart';

class NewsFragment extends StatelessWidget {
  const NewsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text("Daftar Berita"),
          Column(
            children: newslist
                .map((e) => Card(
                      child: ListTile(
                        title: Text(
                          e.judul,
                          maxLines: 2,
                        ),
                        leading: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Image.network(e.gambar)),
                        subtitle: Text(
                          e.deskripsi,
                          maxLines: 4,
                        ),
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
