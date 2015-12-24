/*
::::::::::::::
DATA_ESAD 2015
::::::::::::::

------------------
E_RSS_Delicious_02
------------------
RSS DELICIOUS
REF: http://fr.wikipedia.org/wiki/Delicious

*/ 
import java.util.*;

DeliciousAPI delicious; // API class. Neat ;–)
DeliciousTag[] tags; // Array of tags 
String user = "motiondesign";
int minCount = 99999;
int maxCount = 0;

////////////////////////////////////////////////////////////////////////
void setup() {
  size(1200, 700); 
  // Initialise our API
  delicious = new DeliciousAPI(this); 
  // Grab tags for the user
  tags = delicious.getUserTags( user );  
  
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
  }  
}
