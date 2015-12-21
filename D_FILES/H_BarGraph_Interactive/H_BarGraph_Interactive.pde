/*
::::::::::::::
 DATA_ESAD 2015
 ::::::::::::::
 
 --------------
 A_Data_File_TSV_02
 
 Reader_tsv
 Plus d'info sur ce format :
 http://fr.wikipedia.org/wiki/Tabulation-separated_values
 --------------
 
 Sketch par David Bouchard
 http://www.deadpixel.ca
 
 Ce sketch lit des données en format tsv - un fichier qui se trouve 
 dans le dossier data du sketch
 */
 
 ///////////////////////////////// GLOBALS //////////////////////////////

int[]   years; 
float[] tea;
float[] coffee;
float[] soda;

// we will use a placeholder float[] to represent the 
// currently selected data, as well as a String variable
// to store the current label
float[] data;
String label;

// we will use this intermediate array to "interpolate" 
// to the new data rather than update right away 
float[] interpolatedData;

// we will calculate the maoximum value in the file
float maxLitres = MIN_FLOAT;
int numberOfRows;


/////////////////////////////////////// SETUP //////////////////////////////

void setup() {
  size(600, 250); 
  smooth();

  // open the data file
  String[] rows = loadStrings("drinks.tsv");

  numberOfRows = rows.length-1;

  coffee = new float[numberOfRows];
  tea    = new float[numberOfRows];
  soda   = new float[numberOfRows];
  years  = new int[numberOfRows];

  // skip the first row, this is just our header
  for (int i=0; i < numberOfRows; i++) {
    String[] parts = split(rows[i+1], TAB);    
    years[i] = Integer.parseInt(parts[0]);
    tea[i] = Float.parseFloat(parts[1]); 
    coffee[i] = Float.parseFloat(parts[2]);
    soda[i] = Float.parseFloat(parts[3]);
  }

  // calculate the min/max for the table
  maxLitres = max( max(tea), max(coffee), max(soda) );

  println("Max litres: " + maxLitres);
  
  data = tea;
  label = "Tea";
  interpolatedData = new float[data.length]; // same size
}

/////////////////////////////////////// DRAW //////////////////////////////

void draw() {
  // first attemp at visualizing the data  
  background(66);
  
  // at the beginning of draw, after background
  noStroke();
  fill(99);
  rect(0, 0, width, 45);

  // at the end of draw
  fill(255);
  text(label, 10, 18); // <-- use the label variable

  for (int i=0; i < tea.length; i++) {

    // interpolation
    // slowly bring the contents of "interpolatedData" to match
    // whatever is in "data"
    if ( data[i] != interpolatedData[i] ) {
      interpolatedData[i] += (data[i] - interpolatedData[i]) * 0.2;
    }

    // because neither "width" or "numberOfRows" is a float
    // we must force the answer to be a float using casting 
    float spacing = (float)width / numberOfRows;

    float x = i * spacing;
    // use the interpolated data to show the size of the bars
    // instead of the data itself
    float y = map( interpolatedData[i], 0, maxLitres, height, 60);

    // before we draw a bar, check if the mouse is over its area
    // if it is, we'll highlight it and draw the stats in the header
    // as well
    if (mouseX > x && mouseX <= x+spacing) {
      fill(255);
      text(years[i] + " | " + data[i] + " litres per person", 10, 34);  
      noStroke();
      fill(99);
      rect(x, 45, spacing, height);
    }
 
    fill(255);
    strokeWeight(2);
    stroke(66);
    rect(x, y, spacing, height - y);
  }
}

/////////////////////////////////////// FUNCTIONS //////////////////////////////

// simple interactivity 
// cycle through the data on a mouse click 
void mousePressed() {
  if (label == "TEA") {
    label = "COFFEE";
    data = coffee;
  }  
  else if (label == "COFFEE") {
    label = "SODA";
    data = soda;
  }
  else {
    label = "TEA";
    data = tea;
  }
}

