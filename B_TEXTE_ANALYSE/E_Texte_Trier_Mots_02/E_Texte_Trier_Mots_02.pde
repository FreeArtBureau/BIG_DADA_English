/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::
 
 ----------------------
 E_Texte_Trier_Mots_02
 ----------------------
 
 Ce sketch détécte un nouveau mot dans un texte qui se trouve dans
 le dossier data en format .txt, il stocke les mots et les compte.
 En plus ce sketch trie les mots permettant de les organiser par fréquence
 Les résultats s'affichent à l'écran
 */

////////////////////////////////////////////////////////////////////
import java.util.*;
String joinedText;
String[] lines; // Must be declared as global.
PFont font;
int yPos;
int fontSize = 1300;

WordCount words;
Word[] topWords;

////////////////////////////////////////////////////////////////////
void setup() {
  size(1000, 400);
  background(0);
  yPos = 0;
  // On charge les mots dans notre variable 
  // SI VOUS VOULEZ CHANGER DE TEXTE, C'EST PAR ICI ;–)
  lines = loadStrings("longText.txt");
  joinedText = join(lines, " ").toLowerCase();
  font = createFont("Merriweather-Light.ttf", 14);
  textFont(font);

  // La méthode splitTokens découpe notre texte mot par mot
  String[] tokens = splitTokens(joinedText, " .,;:!@#&*?\"/-()");

  words = new WordCount();
  words.countWords(tokens);  
  // On récupère les mots les plus utilisés
  topWords = words.getCommonWords(40);
}

////////////////////////////////// DRAW //////////////////////////////

void draw() {
  background(0);
  //afficherTexte();
  afficherMots();
}

////////////////////////////////////////////////////////////////////
void   afficherMots() {
  float y = 50;
  float x = 100;
  for (int i=0; i < topWords.length; i++) {
    // On calcule la taille de la fonte en fonction de sa fréquence
    float fontSize = map(topWords[i].count, 0, 300, 6, 30);
    textSize(fontSize);
    textAlign(LEFT);
    fill( 255,0,0,map(i, 0, topWords.length, 255, 33) );//Dégradé couleur
    // Afficher le comptage de caractères
    text(topWords[i].count,x-40-fontSize, y);
   // Afficher les mots
    text(topWords[i].word, x, y);
    y += fontSize;
    if(y >= height-10) {
      y = 50;
      x += 350;
    }
  }
}


void afficherTexte() {

  for (int k=0; k < lines.length; k++) {
    textSize(10);
    fill(255, 0, 0);
    text(lines[k], -65, yPos);
    yPos+=12;
  }
}

void keyPressed() {
  save("Image.png");
}

