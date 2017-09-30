/* ----------
 * RSS_Reader
 * ----------
 *
 * Sketch : RSS_Image
 * Grabs images from an RSS feed
 *
 *
 * MW_2017
 * REF: http://btk.tillnagel.com/tutorials/rss-feeds-processing.html
 * end
 */
 


///////////////////////////////////// SETUP
void setup() {
  size(800, 560);
  background(0);
  
  String url = "http://newsrss.bbc.co.uk/rss/newsonline_world_edition/technology/rss.xml"; 
  
  XML rss = loadXML( url );
  String s = rss.format(0); // formats XML :–)
  //print(s); 
  
  // get image urls. Note that you may have to change to tag name depending on the RSS
  XML[] imageURLElements = rss.getChildren("channel/item/media:thumbnail");
  
  for(int i=0; i<imageURLElements.length; i++) {
    // get url String
    String imageURL = imageURLElements[i].getString("url");
    //println(i+" | "+imageURL);
    
    PImage img = loadImage(imageURL);
    image(img, random(width), random(height), img.width/8, img.height/8);
  }
}

///////////////////////////////////// DRAW
void draw() {
}