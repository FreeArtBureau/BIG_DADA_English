/*
::::::::::::::
DATA_ESAD 2015
::::::::::::::

----------------
D_RSS_Reader_01
----------------
RSS DELICIOUS
PLUS D'INFO : 
http://fr.wikipedia.org/wiki/Delicious
https://delicious.com/rss

*/

////////////////////// GLOBALS

String recent = "http://feeds.delicious.com/v2/rss/motiondesign/design";
// nombre maximum de résultats
int numResults = 20; 
XML data[];
int x = 10;
int y = 20;

/////////////////////////////////////// SETUP

void setup() {
  size(600,800);
  smooth();
  background(255);
  fill(0);
  initRSS();
  // On parcourt les données pour extraire les informations
  for (int i=0; i < data.length; i++) {
    XML tagElement   = data[i].getChild("title"); 
    String tag  = tagElement.getContent();
    text(tag, x, y);

    y+=15;
  }
}

////////////////////// RIEN à FAIRE
void initRSS() {
  String url = recent + "?count="+numResults;
  XML rss = loadXML (url);
  String form = rss.format(0);
  //println(form);
  // Chaque contenu se trouve dans des balises à l'intérieur de la balise <channel>
  data = rss.getChildren("channel/item");
  
}
