/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::
 
 ----------------
 F_RSS_Reader_03
 ----------------
 RSS DELICIOUS
 REF: http://fr.wikipedia.org/wiki/Delicious
 
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
  delicious = new DeliciousAPI(this); 
  tags = delicious.getUserTags( user, 1 );  

  // Iterate tag data & count
  for (int i=0; i < tags.length; i++) {
    minCount = min(minCount, tags[i].count);
    maxCount = max(maxCount, tags[i].count);
  }
  println("Min count: " + minCount);
  println("Max count: " + maxCount);  

  // Clauculate position of our tags in relation to their count
  for (int i=0; i < tags.length; i++) {
    tags[i].positionTag(minCount, maxCount);
  }
}

////////////////////////////////////////////////////////////////////////
void draw() { 
  background(0);  

  // Display our tags 
  for (int i=0; i < tags.length; i++) {
    tags[i].display(); 
    if (pause == false) tags[i].animate();
  }
}

////////////////////////////////////////////////////////////////////////
void mousePressed() {
  pause = !pause;
}

