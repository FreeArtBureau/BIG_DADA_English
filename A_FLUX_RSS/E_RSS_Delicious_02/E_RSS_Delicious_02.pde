/*
::::::::::::::
DATA_ESAD 2015
::::::::::::::

----------------
E_RSS_Reader_02
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

////////////////////////////////////////////////////////////////////////
void setup() {
  size(1200, 700); 
  // Initialiser notre connexion à Delicious
  delicious = new DeliciousAPI(this); 
  // Récupérer les tags / mots clés de l'utilisateur
  tags = delicious.getUserTags( user );  
  
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
  }  
}
