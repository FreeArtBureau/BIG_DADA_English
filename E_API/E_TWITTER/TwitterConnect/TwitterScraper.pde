/*
 * Twitter Class
 */

 import twitter4j.conf.*;
 import twitter4j.json.*;
 import twitter4j.management.*;
 import twitter4j.auth.*;
 import twitter4j.api.*;
 import twitter4j.util.*;
 import twitter4j.*;
 import java.util.*;


 class TweetScraper {

   Twitter twitter;
   List<Status> tweets;
   String searchString;
   int numTweetQueries;
   ArrayList<PImage> profileImages;
   PImage img;
   String imageUrl;

   /////////////// Personal data config > you will need to enter your App info here
   String APIKey = "-- YOUR APIKey Here --";
   String APISecret = "-- YOUR APISecret Here --";
   String Token = "-- YOUR Token Here --";
   String TokenSecret = "-- YOUR TokenSecret Here --";


   TweetScraper(String _s){
     this.searchString = _s;
     profileImages = new ArrayList<PImage>();
     img = new PImage();
   }

   TweetScraper(){
     profileImages = new ArrayList<PImage>();
     img = new PImage();
   }

   void setup(){
      ConfigurationBuilder cb = new ConfigurationBuilder();
      cb.setDebugEnabled(false)
        .setOAuthConsumerKey( APIKey )
          .setOAuthConsumerSecret( APISecret )
            .setOAuthAccessToken( Token )
              .setOAuthAccessTokenSecret( TokenSecret );

      TwitterFactory tf = new TwitterFactory(cb.build());
      //création de l'objet twitter qui servira tout au long du sketch
      twitter = tf.getInstance();

   }

   // ------------------------------------
List<Status> getNewTweets(String searchString, int _n) {
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
