/*
::::::::::::::
DATA_ESAD 2015
::::::::::::::

----------------
D_RSS_Reader_01b

Afficher les liens sauvegardés par un utilisateur de Delicious
NOTE : Ce sketch affiche les titres et non pas les pages web
----------------
RSS DELICIOUS
PLUS D'INFO : 
http://fr.wikipedia.org/wiki/Delicious
https://delicious.com/rss

*/

////////////////////// LIRE /////////////////
// changer d'utilisateur par ici (Essaie d'autres utilisateurs ;–))
String user = "motiondesign"; 
// nombre maximum de résultats
int numResults = 100; 
//////////////////////////////////////////// FIN

String api  = "http://feeds.delicious.com/v2/rss/";
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
    String titre  = tagElement.getContent();

    text(titre, x, y); // on affiche les résultats ici avec la fonction text()
    y+=15;
  }
}


////////////////////// RIEN à FAIRE
void initRSS() {
   String url = api + user + "?count="+numResults;
  // On charge l'adresse dans un objet XML 
  XML rss = loadXML( url );
  String form = rss.format(0);
  //println(form);
  // Chaque contenu se trouve dans des balises à l'intérieur de la balise <channel>
  data = rss.getChildren("channel/item");
}
