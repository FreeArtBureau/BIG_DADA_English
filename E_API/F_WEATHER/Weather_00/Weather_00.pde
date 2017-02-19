
* ------------
 * Weather API
 * -----------
 *
 * Sketch : Weather_00
 * Grabs current weather conditions for a city
 *
 * KEY : YOU WILL NEED TO SIGN UP FOR A UNIQUE API KEY
 * // http://openweathermap.org
 *
 * MW_2017
 * links / refs ...
 * end

 */

/////////////////////////// GLOBALS ////////////////////////////


/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(780, 400);
  background(0, 0, 33);
  smooth();
  noStroke();


}

/////////////////////////// DRAW ////////////////////////////
void draw() {
}

/////////////////////////// FUNCTIONS ////////////////////////////
class 
// Function for loading data and grabbing articles
void grabAPIData(String s) {
  // load data from API
  json = loadJSONObject(s);
  print(json); // print raw data to console for debugging

}
