/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::
 
 ----------------------
 D_Texte_Trier_Mots_01
 ----------------------
 
 Ce sketch détécte un nouveau mot dans un texte qui se trouve dans
 le dossier data en format .txt, il stocke les mots et les compte.
 En plus ce sketch trie les mots permettant de les organiser par fréquence
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
  size(1200, 100);   
  // On charge les mots dans notre variable 
  // SI VOUS VOULEZ CHANGER DE TEXTE, C'EST PAR ICI ;–)
  lines = loadStrings("longText.txt");
  joinedText = join(lines, " ").toLowerCase();
  font = createFont("Merriweather-Light.ttf", 14);
  textFont(font);
  // La méthode splitTokens découpe notre texte mot par mot
  String[] tokens = splitTokens(joinedText, " .,;:!@#&*?\"/-()");

  words = new WordCount();
  words.countWords(tokens); // On compte les mots  
  
  // On récupère les mots les plus utilisés
  Word[] topWords = words.getCommonWords(25); // la valeur 25 correspond au nombre maximum de mot qu'on veut rechercher
  // On affiche dans la console ces mots
  for (int i=0; i < topWords.length; i++) {
    println( topWords[i].word + ": " + topWords[i].count);
  }
}

////////////////////////////////// DRAW //////////////////////////////

void draw() {
  background(0);
  // Interaction permettant de parcourir le texte avec la souris
  int index = (int)map(mouseX, 0, width, 0, lines.length);
  text(lines[index], 10, 25);
}

////////////////////////////////////////////////////////////////////

