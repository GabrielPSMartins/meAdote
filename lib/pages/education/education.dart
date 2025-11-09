import 'package:flutter/material.dart';

class EducacaoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Padding(padding: EdgeInsets.all(16), child: Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Educação e Cuidados', style: TextStyle(fontSize:18,fontWeight: FontWeight.bold)), Icon(Icons.info)]),
      SizedBox(height:12),
      Expanded(child: ListView(children: [
        for (int i=0;i<6;i++) Container(margin: EdgeInsets.only(bottom:12), padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(12)), child: Row(children: [CircleAvatar(radius:20, backgroundColor: Color(0xFF3A3A3A)), SizedBox(width:12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Cuidar pet', style: TextStyle(fontWeight: FontWeight.bold)), SizedBox(height:4), Text('Lorem ipsum dolor sit amet', style: TextStyle(color: Color(0xFFB3B3B3)))])), ElevatedButton(onPressed: (){}, child: Text('Ver'), style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).cardColor, foregroundColor: Theme.of(context).textTheme.bodyLarge?.color))])), 
        
      ]))
    ])));
  }
}
