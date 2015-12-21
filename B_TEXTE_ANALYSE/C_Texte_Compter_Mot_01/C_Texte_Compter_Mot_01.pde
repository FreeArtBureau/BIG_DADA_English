/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::
 
 ----------------------
 C_Texte_Compter_Mot_01
 ----------------------
 
 Ce sketch détécte un nouveau mot dans un texte qui se trouve dans
 le dossier data en format .txt, il stocke les mots et les compte.
 Les résultats s'affichent en bas dans la console.
 */
///////////////////////////////// GLOBALS //////////////////////////////

import java.util.*; 

String joinedText;
String[] lines; 
PFont font;
// Objet words - pour compter nos mots ;–)
WordCount words;

////////////////////////////////// SETUP //////////////////////////////

void setup() {
  size(40, 40);
    
  // On charge les mots dans notre variable 
  // SI VOUS VOULEZ CHANGER DE TEXTE, C'EST PAR ICI ;–)
  lines = loadStrings("shortText.txt");
  joinedText = join(lines, " ").toLowerCase();
  font = createFont("Merriweather-Light.ttf", 14);
  // La méthode splitTokens découpe notre texte mot par mot
  String[] tokens = splitTokens(joinedText, " .,;:!@#&*?\"/-()");

  words = new WordCount();
  words.countWords(tokens); // On compte les mots 
}

////////////////////////////////// DRAW //////////////////////////////

void draw() {
}

////////////////////////////////////////////////////////////////////


