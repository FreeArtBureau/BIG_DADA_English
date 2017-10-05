XML rss;
int index = 0;

void setup() {
  size(800, 560);
  background(0);
  imageMode(CENTER);
  String url = "https://www.nasa.gov/rss/dyn/lg_image_of_the_day.rss"; 
  rss = loadXML( url );
}

///////////////////////////////////// DRAW
void draw() {

  background(0);
  // get image urls. Note that you may have to change to tag name depending on the RSS
  XML[] imageURLElements = rss.getChildren("channel/item/enclosure");

  // get url String
  String imageURL = imageURLElements[index].getString("url");
  //println(i+" | "+imageURL);

  PImage img = loadImage(imageURL);
  image(img, width/2, height/2, img.width/8, img.height/8);
}

void keyPressed() {
  if (key == '+') {
    index++;
    println(index);
  }
}