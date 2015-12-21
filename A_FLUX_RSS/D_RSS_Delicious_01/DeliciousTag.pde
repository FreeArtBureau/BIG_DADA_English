/*
Une classe simple pour gérer nos tags / mots clés
Merci à David Bouchard
http://www.deadpixel.ca

*/

class DeliciousTag {
  
  String tag;
  String url;
  int count;
  
  DeliciousTag(String _tag, String _url, int _count) {
    tag = _tag;
    url = _url;
    count = _count;  
  }
  
}
