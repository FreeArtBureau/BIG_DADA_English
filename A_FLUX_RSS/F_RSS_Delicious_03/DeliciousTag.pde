/*
Une classe pour gérer nos tags / mots clés
et les classer en fonction de sa fréqeunce
Merci à David Bouchard
http://www.deadpixel.ca

*/
class DeliciousTag implements Comparable {
  
  String tag;
  String url;
  int count;
  int gray;
  
  // these fields will be used to draw the tag
  float x;
  float y;
  int fontSize;
  float tagWidth;
 
  // Constructor
  DeliciousTag(String _tag, String _url, int _count) {
    tag = _tag;
    url = _url;
    count = _count;  
    
    // we can't assign an (x, y) position just yet, since 
    // we don't know the max and min count at this point    
  }
  
  // A method that will give the tag an (x, y) position 
  // and a font size based on a count range
  // we will use this method AFTER calculating the min and max counts
  void positionTag(int minCount, int maxCount) {
    // first, calculate the font size for this tag
    fontSize = (int)map(count, minCount, maxCount, 10, 64);
    
    // set the active font size
    textSize(fontSize);
    
    // now, calculate the approximate width in pixels for the tag
    tagWidth = textWidth(tag);
    // the height of the text will be approximately the font size 
    
    // finally, we can come up with an (x, y) position
    x = random(0, width-tagWidth);
    y = random(fontSize, height);    
    
   
  }
  
  // A method to display the tag in the window 
  void display() {
    textSize(fontSize);
    
     int opacity = (int)map(fontSize,10, 100, 73, 255);
    fill(255, opacity);
    text(tag, x, y);
  }
  
  // Comparable interface method
  // Returns either -1: smaller than, 1: bigger than or 0: equal 
  int compareTo(Object other) {
    // we will assume here the other Object is a DeliciousTag. 
    DeliciousTag otherTag = (DeliciousTag)other;
    if (otherTag.count < count ) return 1;
    if (otherTag.count > count ) return -1;
    else return 0; // counts are equal
  }
  
  // Animation method
  void animate() {
    y += fontSize/50.0;  
    if (y > height+fontSize) y = 0; // wrap
  }
  
}
