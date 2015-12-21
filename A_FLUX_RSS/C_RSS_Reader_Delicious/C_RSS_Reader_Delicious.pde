/*
::::::::::::::
DATA_ESAD 2015
::::::::::::::

----------------------
C_RSS_Reader_Delicious
----------------------
RSS DELICIOUS
REF : http://fr.wikipedia.org/wiki/Delicious

Delicious is a book marking management service. 
It is not used so much nowadays but is an interesting source of information
if you have used it in the past or want ot access other users' bookmarks ;–)
*/

////////////////////// GLOBALS
PFont myFont;
int x = 10;
int y = 50;
// Cette variable permet éventuellement de récupérer des liens avec un tag / mots clés
String tag = "code";
// Cette variable permet éventuellement de récupérer des liens lié à un utilisateur
// Il faudra donc remplacer ce mot avec le nom d'utilisateur voulu
String user = "motiondesign";

/////////////////////////////////////// SETUP
void setup() {
  size(800, 900);
  background(0);
  smooth();
  myFont = createFont("helvetica", 14);
  textFont(myFont);
  fill(255);
  /*
  // Delicious :
  >> Regarder par ici pour avoir plus d'info sur les flux rss Delicious
  >> https://delicious.com/rss
  http://feeds.delicious.com/v2/rss/recent
  */
  
  // Adresses WEB - Chaque adresse correspond à un flux RSS différent et donc des informations différentes
  //String url = " http://feeds.delicious.com/v2/rss/tag/"+ tag + "?count=100"; // requête par tag
  //String url = " http://feeds.delicious.com/v2/rss/golan/"+ tag + "?count=100"; // requête par username & 1 tag/mot clé
  String url = " http://feeds.delicious.com/v2/rss/tags/"+ user + "?count=100"; // requête par username & ses tags//mots clés
  //String url = " http://feeds.delicious.com/v2/rss/networkmembers/"+ user + "?count=100"; // requête par username & ses tag/mots clés

  // On charge l'adresse dans un objet XML 
  XML rss = loadXML( url );
  
  
  // Chaque contenu se trouve dans des balises à l'intérieur de la balise <channel>
  XML[] title = rss.getChildren("channel/item/title");
   String s = rss.format(0); // formats XML :–)
  print(s);// Afficher le contenu brut en XML dans la console en bas.

  // Pour afficher le contenu d'une balise, on se sert d'une boucle FOR
  // pour parcourir chaque élément et éventuellement l'afficher.
  for (int i = 0; i < title.length; i++) {    
    text(title[i].getContent(), x, y);
    y+=20;
  }
}

