/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::
 
 --------------
 A_Texte_01
 --------------
 
 */

///////////////////////////////// GLOBALS //////////////////////////////
// Variable qui va stocker une liste de mots
String[] textLines;
float yPos;
////////////////////////////////// SETUP //////////////////////////////

void setup() {
  size( 640, 700 );
  background(33);
  smooth();
  // On charge les mots à partir d'un fichier texte 
  // qui se trouve dans le dossier data
  textLines = loadStrings("poem.txt");
  yPos = 50;
  // Voir le nombre de lignes
  println("Notre poème contient "+textLines.length+" lignes");
  noLoop();
}

////////////////////////////////// DRAW //////////////////////////////

void draw() {
  // Pour lire le texte ligne par ligne on se sert d'une boucle FOR
  // textLines.length est égal au nombre de lignes dans notre texte
  for ( int i = 0; i < textLines.length; i++ ) {
    // Affichage du texte brute dans la console en bas
    println( i + ". " + textLines[i] );
    println("Cette ligne contient "+textLines[i].length()+" caractères");
    
    // Affichage du texte ligne par ligne
    fill(255);
    textSize(14);
    text(textLines[i], 40, yPos);
    yPos+=20;

    // Petite viz : La taille des cercles en fonction  
    // de la longueur de la chaîne de caractères sur chaque ligne
    // Notez bien la différence de syntaxe entre :
    // textLines.length;  > nombre total de lignes
    // textLines.length(); > nombre total de caractères par ligne (plus des espaces)
    float d = textLines[i].length();
    noStroke();
    fill(0, 0, 255);
    ellipse( 530, 40+i * 30, d, d );
  }
}

