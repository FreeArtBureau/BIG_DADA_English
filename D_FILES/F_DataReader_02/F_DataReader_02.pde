/*
::::::::::::::::::::::::::::::
 ------------------------------
 PARSING DATA : CSV FILES
 ------------------------------
 ::::::::::::::::::::::::::::::
 
 DEV 8/03/2015
 Sketch : DataPlotter_02
 
 - Reads incoming data from a file
 - Plots it on a graph
 - Draws the corresponding sparklines
 
 NOTES TO SELF :
 - Implement a class for calculating data points at setup (extends FloatTable class)
 - PGraphics for all static info - text etc
 - Different drawing modes
 
 
 */
/////////////////////////// GLOBALS ////////////////////////////

FloatTable data;
float dataMin, dataMax; 
int rowCount;
float plotX1, plotY1; 
float plotX2, plotY2; 

// Data points for drawing
float[] LineplotX1;
float[] LineplotY1;
int index; // for reading through data points

int monthMin, monthMax; 
int[] months;
int monthsInterval = 1;
PFont plotFont;

Vec v;
Vec v2; // Second data sparkline (not yet immplemented)
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(900, 450);
  background(0);
  smooth();
  noStroke();
  initData(); // data initialisation function
  // Initialise graphics
  //v = new Vec(LineplotX1[0], LineplotY1[0]); // will need this eventually
  v = new Vec(50, 103.910645); // First dataPoint
  //  v2 = new Vec(50, 103.910645); // Second dataPoint (not implemented yet)
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  //background(0);
  strokeWeight(5); 
  stroke(255);
  //  drawDataPoints(0); // plots data points instantly
  // grabs data from first row in data file
  // and calculated x & y coordinates
  calculateLineCoords(0); 

  // Vector drawing of graph
  v.update(LineplotX1[index], LineplotY1[index]);
  v.render();
  v.renderPoint();

  if ((v.loc.x >= LineplotX1[index]-0.05)&&(v.loc.y >= LineplotY1[index]-0.3)) {
    //println(index);
    index++;
  }

  if (index == LineplotX1.length) {
    index = index-1;
  }

  /*
  stroke(255, 0, 0);
   drawDataPoints(1);  
   drawYearLabels();
   */
}
/////////////////////////////////////////////////////////////////////////////////

