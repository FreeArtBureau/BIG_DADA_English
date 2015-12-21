/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::
 
 ---------------
 YahooWeather_02
 ---------------
 
 
 */
/////////////////////////// GLOBALS ////////////////////////////

// Variable pour stocker la température
int temperature = 0;
// Variable pour stocker la condition météo
String meteo = "";

/*
 On récupère les données météorologiques par ville ou par région et par un chiffre spécifique.
 Ce chiffre est déterminé par Yahoo et il s'appelle WOEID (Where On Earth Identifiers)
 575961 = WOEID pour Amiens
 7153326 = WOEID pour Picardie
 Voir l'onglet INFO_WOEID pour connaitre les autres chiffres pour les régions de la France
 */
String place = "575961"; // WOEID > Amiens
String city = "";
float vitesseVent;
// Varialbes qui modifie le comportement de l'animation des lignes
float noiseScale = 0.02;
float noiseAmm = 50.0;
float lineLnH = 10.0; // longueur de nos lignes

PFont font;

/////////////////////////// SETUP ////////////////////////////
void setup() {
  size(600, 360);
  smooth();
  colorMode(HSB, 360, 100, 100);

  // La fonte pour notre texte
  font = createFont("SourceSansPro-Semibold.ttf", 34);
  textFont(font);
  initialise(); // voir l'onglet INIT
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0, 0, 100);

  // voir l'onglet DESSIN
  TemperatureBG(); // fonction pour dessiner le rectangle
  AfficheTexte();// fonction pour afficher le texte
  lines(); // fonction pour dessiner une trame de lignes
}


