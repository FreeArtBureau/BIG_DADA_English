/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::
 
 --------------
 B_Texte_02
 --------------
 Code adapté par un sketch dans le livre
 Generative Gestaltung
 http://www.generative-gestaltung.de
 */

///////////////////////////////// GLOBALS //////////////////////////////
PFont font;
String joinedText; // Variable pour stocker une chaîne de caractères

// Variable qui contient une chaîne de caractères
// qui va servir pour détécter sa présence dans le texte
String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZÂÉÈÊÀ,.;:!?";

// Variable qui stocke le nombre de caractères total
int[] counters = new int[alphabet.length()];

int index; // Variable permettant de parcourir chaque caractère du texte
int x2, y2;
float yPos;
int col =0;
////////////////////////////////// SETUP //////////////////////////////

void setup() {
  size(800, 800);
  background(0);
  font = createFont("Merriweather-Light.ttf", 12);
  x2 = 60;
  y2 = 20;
  yPos = 25;
  // On charge les mots dans une variable type liste
  // Si vous voulez changer de texte, c'est ici ;–)
  String[] lines = loadStrings("longText.txt");
  // La méthode join() rejoint tous les caractères
  // on peut donc maintenant stocker ces informations dans 
  // notre variable joinedText
  joinedText = join(lines, " ");
  countCharacters(); // petite méthode pour compter nos lettres
}

////////////////////////////////// DRAW //////////////////////////////

void draw() {  
  textFont(font);
  noStroke();
  smooth();
  drawGraphics();
  drawText();
}

////////////////////////////////// FUNCTIONS DE DESSIN //////////////////////////////

void drawGraphics() {
  for (int i = 0; i < alphabet.length (); i++) {
    fill(255, 0, 0);
    // Rect en fonction du nombre de caractères trouvés dans le texte
    rect(150, yPos-10, counters[i]/100, 15);
    // Afficher le comptage de caractères
    text(counters[i], 100, yPos);
    // Afficher les caractères
    text(alphabet.charAt(i), 50, yPos);

    yPos+=20;
    // Ne plus afficher 
    if ( i == alphabet.length()-1) {
      noLoop();
    }
  }
}

void drawText() {
  for (int i = 0; i < joinedText.length (); i++) {
    fill(0, 0, 255);
    char counted = joinedText.charAt(i);
    textSize(6);
    fill(0,0,255);
    text(counted, x2, y2);

    if (x2>=width-60) {
      x2 = 50;
      y2 += 20;
    }
    if (y2 >=200) 
      noLoop();
    x2+=10;
  }
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame("monImage_##.png");
}























