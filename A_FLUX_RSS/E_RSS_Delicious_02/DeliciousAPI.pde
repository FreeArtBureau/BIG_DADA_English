/*
CLASSE POUR SE CONNECTER À DELICIOUS
 Merci à David Bouchard
 http://www.deadpixel.ca
 */
class DeliciousAPI {

  PApplet sketch;
  String api = "http://feeds.delicious.com/v2/rss/";

  // Constructor
  DeliciousAPI(PApplet _sketch) { 
    sketch = _sketch;
  } 

  // This method will give us an array of DeliciousTag objects
  // for a given user 
  DeliciousTag[] getUserTags( String user ) {

    String url = api + "tags/" + user;  

    XML rss = loadXML(url);
    XML data[] = rss.getChildren("channel/item");

    DeliciousTag[] tags = new DeliciousTag[data.length];

    for (int i=0; i < data.length; i++) {
      // this is just to make it clear that each variable we are 
      // look at here is also an XMLElement 
      XML tagElement   = data[i].getChild("title"); 
      XML countElement = data[i].getChild("description");
      XML urlElement   = data[i].getChild("guid");

      String tag  = tagElement.getContent();
      int count   = Integer.parseInt( countElement.getContent() );
      String lien  = urlElement.getContent();

      tags[i] = new DeliciousTag(tag, lien, count);
    }

    // Classe Java spéciale pour trier nos tags / mots clés
    Arrays.sort(tags); 
    return tags;
  }
} // <-- end of DeliciousAPI class

