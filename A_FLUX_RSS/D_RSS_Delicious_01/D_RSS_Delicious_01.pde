/*
::::::::::::::
DATA_ESAD 2015
::::::::::::::

----------------
D_RSS_Reader_01
----------------
RSS DELICIOUS
PLUS D'INFO : http://fr.wikipedia.org/wiki/Delicious

*/

////////////////////// GLOBALS
// voir l'onglet INFO (changer l'adresse pour avoir
// d'autres données
String api  = "http://feeds.delicious.com/v2/rss/tags/"; 
String user = "motiondesign"; // changer le nom d'utilisateur ici
int x = 10;
int y = 20;

DeliciousTag[] tags; // Liste de mots clés

/////////////////////////////////////// SETUP

void setup() {
  size(600,800);
  smooth();
  background(255);
  fill(0);
  String url = api + user;
  // On charge l'adresse dans un objet XML 
  XML rss = loadXML( url );

  // Chaque contenu se trouve dans des balises à l'intérieur de la balise <channel>
  XML data[] = rss.getChildren("channel/item");
  
  // initialiser notre liste avec le même nombre d'éléments que 'data'
  tags = new DeliciousTag[data.length];
  
  // On parcourt les données pour extraire les informations
  for (int i=0; i < data.length; i++) {
    XML tagElement   = data[i].getChild("title"); 
    XML countElement = data[i].getChild("description");
    XML urlElement   = data[i].getChild("guid");
    
    String tag  = tagElement.getContent();
    int count   = Integer.parseInt( countElement.getContent() );
    String lien  = urlElement.getContent();
    
    tags[i] = new DeliciousTag(tag, lien, count);
    //print(url);
    
    // Afficer tag / mots clés
    text(tag, x, y);
    //y+=30;
    
     // Afficer nombre de liens sauvegardés avec ce tag / mot clé
    text(count, x+200, y);
    y+=15;
  }
}
