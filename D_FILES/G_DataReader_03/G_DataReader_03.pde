/*
:::::::::::::::::::::::::::::::
 ------------------------------
 PARSING DATA : CSV FILES
 ------------------------------
 ::::::::::::::::::::::::::::::
 
 DEV 8/03/2015
 Sketch : DataPlotter_03
 
 - Implements new graphical modes
 ** NOTE : pour les activer/désactiver, changer la valeur 'true >< 'false' **
 
 NOTES TO SELF :
 - Implement a class for calculating data points at setup (extends FloatTable class)
 - PGraphics for all static info - text etc [TEXT DONE 8/3/15]
 - Different drawing modes [IN PROCESS HERE]
 
 
 */
/////////////////////////// GLOBALS ////////////////////////////

// VALEURS À CHANGER POUR ACTIVER/DÉSACTIVER DES GRAPHIQUES
// changer à 'false' pour désactiver / 'true' pour activer

boolean drawLine = true;
boolean showCircles = true; 
boolean verticalSparks = true; 
boolean dataPoints = true; 
boolean graphics_02Points = true;
boolean showText = true;

// Changer la vitesse d'animation ici (valeurs entre 4 > 60)
int ANIMATION_SPEED = 60;

// FIN

// RIEN À FAIRE ICI ;–)
FloatTable data;
float dataMin, dataMax; 
int rowCount;
float plotX1, plotY1; 
float plotX2, plotY2; 

// Data points for drawing and passing to x & y coords
float[] LineplotX1;
float[] LineplotY1;
int index; // for reading through data points

int monthMin, monthMax; 
int[] months;
int monthsInterval = 1;
PFont plotFont;

Vec v;
//Vec v2; // Second data sparkline (not yet immplemented)

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(1280, 760, P2D);
  background(0);
  smooth();
  noStroke();
  frameRate(ANIMATION_SPEED);
  initData(); // data initialisation function
  // Initialise graphics
  //v = new Vec(LineplotX1[0], LineplotY1[0]); // will need this eventually
  v = new Vec(50, 103.910645); // First dataPoint
  //v2 = new Vec(50, 200); // Second dataPoint (used for vertical lines)
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  // background(0);
  // translate(0,300);
  if (showText) {
    drawYearLabels(); // draws text ( months )
  }

  strokeWeight(5); 
  stroke(255);
  if (dataPoints) {
    drawDataPoints(0); // plots data points instantly
  }
  // grabs data from first row in data file
  // and calculates x & y coordinates
  calculateLineCoords(0); 


  // Vector drawing of graph
  v.update(LineplotX1[index], LineplotY1[index]);
  if (drawLine) {
    v.drawLine();
  }
  if (verticalSparks) {
    // Vertical sparklines
    v.updateVerticalSparks(LineplotX1[index], LineplotY1[index]);   
    v.drawVerticalSparks_01();
  }
  /////////////////////////////////// TEST POSITIONS X & Y COORDS AND UPDATE ANIMATION

  // Increments data once the line arrives at each new data point on the graph
  if ((v.loc.x >= LineplotX1[index]-0.015)&&(v.loc.y >= LineplotY1[index]-0.3)
    || (v.locBars.x >= LineplotX1[index]-0.015)&&(v.locBars.y >= LineplotY1[index]-0.3))
  {
    //println(index);
    //v.renderPoint(); // draws a simple point

    if (showCircles) {
      v.renderPointDia( LineplotY1[index] ); // draws each point modifiying its size in relation to data received
    }

    if (graphics_02Points) {
      v.drawPoints(); // Draw point data in another position in space
      v.drawBars( LineplotY1[index] ); // Draws horizontal bars, length based on data
    }

    index++;
  }

  if (index == LineplotX1.length) {
    index = index-1;
  }

  // SECOND COLUMN DATA POINTS ( Other data )
  
  stroke(255, 0, 0);
   drawDataPoints(1);
   
}
/////////////////////////////////////////////////////////////////////////////////
void keyPressed() {

  if (key == 's' || key == 'S') {
    saveFrame("screenCapture_###.png");
  }
}

