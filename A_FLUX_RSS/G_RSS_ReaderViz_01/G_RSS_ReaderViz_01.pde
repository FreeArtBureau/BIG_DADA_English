/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::
 
 --------------
 RSS_Reader_03
 --------------
 * (c) 2008 Till Nagel, btk.tillnagel.com
 
 */


////////////////////// GLOBALS

PFont font;
String[] content; // Variable String pour stocker le contenu
float y = 20;
XML rss;
XML[] title;
/////////////////////////////////////// SETUP

void setup() {
  size(700, 850);
  background(0);
  noStroke();
  font = createFont("helvetica", 12);
  textFont(font);
  fill(255);

  // Load RSS feed
  //String url = "http://liberation.fr.feedsportal.com/c/32268/fe.ed/rss.liberation.fr/rss/latest/";
  //String url = "http://actualite.lachainemeteo.com/meteo-rss/actualite-meteo.xml";
  //String url = "http://rss.lemonde.fr/c/205/f/3050/index.rss";
  //String url = "http://news.yahoo.com/rss/topstories";

  // Adresse WEB
  String url = "http://liberation.fr.feedsportal.com/c/32268/fe.ed/rss.liberation.fr/rss/latest/";

  // On charge l'adresse dans un objet XML 
  rss = loadXML(url);
  // On accède aux données et les stockent dans la variable title
  title = rss.getChildren("channel/item/title");

  content = new String[title.length];
  for (int i = 0; i < title.length; i++) {
    //On accéde aux données stockées dans la variable title
    // et on les passe dans notre variable content
    content[i] = title[i].getContent();
  }
}

/////////////////////////////////////////// DRAW
void draw() {
  //  background(0);

  afficherTitres();
}



//////////////////////////////////// FUNCTION
void afficherTitres() {
  // background(0);
  fill(255);
  for (int i = 0; i < content.length; i++) {
    // On se sert de la longueur des données - le nombre de caractères dans le texte
    // pour changer la couleur
    fill(0 + constrain(content[i].length(), 0, 255));
    rect(8, y - 11, 14, 14);

    // On se sert de la longueur des données - le nombre caractères
    // pour changer la longeur du rect
    fill(255, 100);
    rect(23, y - 11, content[i].length() * 2, 14);

    // On affiche les données
    fill(255, 220);
    text(content[i], 50, y);
    y+=20;
  }
}

