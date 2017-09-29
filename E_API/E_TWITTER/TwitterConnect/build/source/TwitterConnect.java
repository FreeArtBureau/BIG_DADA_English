import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import twitter4j.conf.*; 
import twitter4j.json.*; 
import twitter4j.management.*; 
import twitter4j.auth.*; 
import twitter4j.api.*; 
import twitter4j.util.*; 
import twitter4j.*; 
import java.util.*; 

import twitter4j.api.*; 
import twitter4j.*; 
import twitter4j.auth.*; 
import twitter4j.conf.*; 
import twitter4j.json.*; 
import twitter4j.management.*; 
import twitter4j.util.*; 
import twitter4j.util.function.*; 
import twitter4j.examples.account.*; 
import twitter4j.examples.async.*; 
import twitter4j.examples.block.*; 
import twitter4j.examples.directmessage.*; 
import twitter4j.examples.*; 
import twitter4j.examples.favorite.*; 
import twitter4j.examples.friendsandfollowers.*; 
import twitter4j.examples.friendship.*; 
import twitter4j.examples.geo.*; 
import twitter4j.examples.help.*; 
import twitter4j.examples.json.*; 
import twitter4j.examples.lambda.*; 
import twitter4j.examples.list.*; 
import twitter4j.examples.media.*; 
import twitter4j.examples.oauth.*; 
import twitter4j.examples.savedsearches.*; 
import twitter4j.examples.search.*; 
import twitter4j.examples.spamreporting.*; 
import twitter4j.examples.stream.*; 
import twitter4j.examples.suggestedusers.*; 
import twitter4j.examples.timeline.*; 
import twitter4j.examples.trends.*; 
import twitter4j.examples.tweets.*; 
import twitter4j.examples.user.*; 
import twitter4j.media.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class TwitterConnect extends PApplet {

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
float periodLoadData = 5.0f; // seconds

TweetScraper tw;
String tweetText;
String keyword = "#AI";
 ///////////////////// SETUP //////////////////////
public void setup() {
  
  background(0);
  tw= new TweetScraper();
  tw.setup();
  timerLoadData = new Timer(false);
  timerLoadData.scheduleAtFixedRate(new DataLoadTask(), 0, (long) periodLoadData*1000);
}


 ///////////////////// DRAW //////////////////////
public void draw(){
  //background(0);
}


 ///////////////////// FUNCTIONS //////////////////////

public void getData(){
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

public void keyPressed(){
}
/*
 * Twitter Class
 */

 
 
 
 
 
 
 
 


 class TweetScraper {

   Twitter twitter;
   List<Status> tweets;
   String searchString;
   int numTweetQueries;
   ArrayList<PImage> profileImages;
   PImage img;
   String imageUrl;

   /////////////// Personal data config > you will need to enter your App info here
   String APIKey = "XR899HEmK2gOWGh82tueQw";
   String APISecret = "e7OoDseQJmop9rO4pH9rf5CjZ5PqaKkGAxeXMz0";
   String Token = "2345288324-riKkAH3Ceiqc2uOYz3J8BHO7c9CrKnkVAybjEzm";
   String TokenSecret = "Bznfjdlzdl89lkiSdZGscBER2V44ulWIRygEWEop7SWTE";


   TweetScraper(String _s){
     this.searchString = _s;
     profileImages = new ArrayList<PImage>();
     img = new PImage();
   }

   TweetScraper(){
     profileImages = new ArrayList<PImage>();
     img = new PImage();
   }

   public void setup(){
      ConfigurationBuilder cb = new ConfigurationBuilder();
      cb.setDebugEnabled(false)
        .setOAuthConsumerKey( APIKey )
          .setOAuthConsumerSecret( APISecret )
            .setOAuthAccessToken( Token )
              .setOAuthAccessTokenSecret( TokenSecret );

      TwitterFactory tf = new TwitterFactory(cb.build());
      //cr\u00e9ation de l'objet twitter qui servira tout au long du sketch
      twitter = tf.getInstance();

   }

   // ------------------------------------
public List<Status> getNewTweets(String searchString, int _n) {
    tweets = null;
    profileImages.clear();
    numTweetQueries = _n;
    try {
        // Make a query request for a search term
        Query query = new Query(searchString);
        query.count(numTweetQueries); // num of queries
        QueryResult result = twitter.search(query);
        tweets = result.getTweets();

        // For each tweet get each unique Status : one single person
        for (Status status : tweets) {
          // tweet text + user
          println("//////// > NEW TWEET ");
          println("["+status.getId()+"] " + status.getText());
          println("User: "+status.getUser().getName());
          println("Location: "+status.getUser().getLocation());
          println("Friends Count: "+status.getUser().getFriendsCount());
          println("----------------------> end");

          // GeoLocation [si possible]
          GeoLocation loc = status.getGeoLocation();
          if(loc != null) {
          double longitude = loc.getLongitude();
          double latitude = loc.getLatitude();
          println("Geo: "+latitude+" / "+longitude);
            }

          //image de profil
          //imageUrl = status.getUser().getProfileImageURL();
          //img = loadImage(imageUrl,"jpg");
          //profileImages.add(img);

        }

    }
    catch (TwitterException te) {
        println("Failed to search tweets: " + te.getMessage());
    }

    return tweets;
  }
 }
  public void settings() {  size(600,420); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "TwitterConnect" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
