import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

class SurahTabWidget extends StatelessWidget {
  const SurahTabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, surahNumber) {
        return ListTile(
          leading: Text('${++surahNumber}'),
          title: Text(quran.getSurahName(surahNumber)),
          trailing: Text(quran.getSurahNameArabic(surahNumber)),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) =>
                  SurahScreen(surahNumber: surahNumber),
            ),
          ),
        );
      },
      itemCount: quran.getTotalSurahCount(),
    );
  }
}

class SurahScreen extends StatelessWidget {
  const SurahScreen({Key? key, required this.surahNumber}) : super(key: key);
  final int surahNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
                leading: Text('${++index}'),
                title: Text(quran.getVerse(surahNumber, index)));
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: quran.getVerseCount(surahNumber)),
    );
  }
}
