/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::
 
 --------------
 RSS_Image_01
 --------------
 
 */

////////////////////// GLOBALS

/*
// Quelques adresses :
 http://liberation.fr.feedsportal.com/c/32268/fe.ed/rss.liberation.fr/rss/latest/
 
 // Attention : les images du site le Monde sont assez grandes - donc patience pour les afficher
 http://rss.lemonde.fr/c/205/f/3050/index.rss
 http://newsrss.bbc.co.uk/rss/newsonline_world_edition/technology/rss.xml
 */

// Adresse WEB 
String url = "http://newsrss.bbc.co.uk/rss/newsonline_world_edition/technology/rss.xml";
// On va stocker les liens pour les images dans cette variable
String[] liens;

///////////////////////////////////// SETUP
void setup() {
  size(800, 560);
  smooth();
  // Charger les liens d'images
  liens = loadLinks(url);
}

///////////////////////////////////// DRAW
void draw() {
  background(0);

  // Affichage de nos images 
  fill(255);
  for (int i = 0; i < liens.length; i++) {
    //text(liens[i],10,16+i*16);
    // Pour afficher nos images, on récupère l'adresse web pour chaque et...
    PImage imageURL = loadImage(liens[i]);
    // ... on les affiches [si vous chager les images du Monde, divise imageURL.width & imageURL.height par 20
    //  par exemple // image(imageURL, random(width), random(height), imageURL.width/20, imageURL.height/20);
    image(imageURL, random(width), random(height), imageURL.width, imageURL.height);
  }

  // Affichage du nombre d'images trouvées
  textSize(36);
  text("Images trouvées : " + liens.length, 50, 500);
}



/////////////////////////////////// FUNCTION REGEX
// Cette fonction nous permet de récupérer l'adresse web pour une image
// Rien à faire ici ;–)
String[] loadLinks(String s) {
  // Load the raw HTML
  String[] lines = loadStrings(s);
  // Put it in one big string
  String html = join(lines, "\n");

  // A wacky regex for matching a URL
  // <url=" "> 
  String regex = "url\\s*=\\s*\"(.*?)\"";
  // The matches are in a two dimensional array
  // The first dimension is all matches
  // The second dimension is the groups
  String[][] matches = matchAll(html, regex);

  // An array for the results
  String[] results = new String[matches.length];

  // We want group 1 for each result
  for (int i = 0; i < results.length; i++) {
    results[i] = matches[i][1];
  }

  // Return the results
  return results;
}

