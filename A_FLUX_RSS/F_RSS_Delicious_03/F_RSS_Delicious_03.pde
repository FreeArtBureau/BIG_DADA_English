/*
::::::::::::::
DATA_ESAD 2015
::::::::::::::

----------------
F_RSS_Reader_03
----------------
RSS DELICIOUS
PLUS D'INFO : http://fr.wikipedia.org/wiki/Delicious

*/ 
import java.util.*; 

DeliciousAPI delicious;
DeliciousTag[] tags;
String user = "motiondesign";
int minCount = 99999;
int maxCount = 0;

boolean pause = false;
PFont f;
////////////////////////////////////////////////////////////////////////
void setup() {
  size(600, 300);
  smooth();
  f = createFont("helvetica", 12);
  textFont(f);
  // Initialiser notre connexion à Delicious
  delicious = new DeliciousAPI(this); 
  // Récupérer les tags / mots clés de l'utilisateur
  tags = delicious.getUserTags( user, 1 );  
    
  // Compter nos tags
  for (int i=0; i < tags.length; i++) {
    minCount = min(minCount, tags[i].count);
    maxCount = max(maxCount, tags[i].count);    
  }
  println("Min count: " + minCount);
  println("Max count: " + maxCount);  
  
  // Calculer la position (x,y) en fonction de nombres de tags
  for (int i=0; i < tags.length; i++) {
    tags[i].positionTag(minCount, maxCount);  
  }
}

////////////////////////////////////////////////////////////////////////
void draw() { 
  background(0);  
  
  // Affichage de nos tags / mots clés
  for (int i=0; i < tags.length; i++) {
    tags[i].display(); 
    if (pause == false) tags[i].animate();
  }  
}

////////////////////////////////////////////////////////////////////////
void mousePressed() {
  pause = !pause;   
}

