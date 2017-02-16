/* ------------------
 * Twitter 4J Library
 * ------------------
 *
 * Sketch : Twitter Connect
 * Connect to Twitter API
 *
 * KEY : YOU WILL NEED TO SIGN UP FOR A UNIQUE API KEY
 * https://apps.twitter.com
 *
 * MW_2017
 * http://twitter4j.org
 *
 *
 * end

 */
 ///////////////////// GLOBALS //////////////////////

Timer timerLoadData;
float periodLoadData = 5.0; // seconds

TweetScraper tw;
String tweetText;
String keyword = "#AI";
 ///////////////////// SETUP //////////////////////
void setup() {
  size(600,420);
  background(0);
  tw= new TweetScraper();
  tw.setup();
  timerLoadData = new Timer(false);
  timerLoadData.scheduleAtFixedRate(new DataLoadTask(), 0, (long) periodLoadData*1000);
}


 ///////////////////// DRAW //////////////////////
void draw(){
  //background(0);
}


 ///////////////////// FUNCTIONS //////////////////////

void getData(){
  // Make a query : @params : search term / number of tweets
  tw.getNewTweets(keyword, 10);
}


 // TimerTask class lets us schedule & time java tasks.
 class DataLoadTask extends TimerTask{
   public void run() {
    //println("run called");
     getData();
   }
 }

void keyPressed(){
}
