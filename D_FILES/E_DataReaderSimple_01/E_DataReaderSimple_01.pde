/*
::::::::::::::::::::::::::::::
 ------------------------------
 PARSING DATA : CSV FILES
 ------------------------------
 ::::::::::::::::::::::::::::::
 
 DEV 7/03/2015
 Sketch : DataPlotter_01
 
 Reads incoming data from a file and plots it on a graph.
 Uses the same class as in earlier sketches
 
 
 */
/////////////////////////// GLOBALS ////////////////////////////
int index = 0;
FloatTable data;
float dataMin, dataMax; 
int rowCount;
float plotX1, plotY1; 
float plotX2, plotY2; 

float[] LineplotX1;
float[] LineplotY1;

int monthMin, monthMax; 
int[] months;
int monthsInterval = 1;
PFont plotFont;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 450);
  background(0);
  smooth();
  noStroke();
  data = new FloatTable("data.tsv");
  rowCount = data.getRowCount();
  // Number of yvalues
  LineplotY1 = new float[data.getRowCount()];
  LineplotX1 = new float[data.getRowCount()];

  // Get Row Data
  //int rowData = data.getRowCount();
  // println( rowData );

  //String[] rowNames = data.getRowNames();
  //println( rowNames );

  // PLOTTING METHODS & DATA
  dataMin = 0; 
  dataMax = data.getTableMax(); 

  months = int(data.getRowNames()); 
  monthMin = months[0]; 
  monthMax = months[months.length - 1];

  // Corners of the plotted time series 
  plotX1 = 50; 
  plotX2 = width - plotX1; 
  plotY1 = 60; 
  plotY2 = height - plotY1; 

  // TEXT
  plotFont = createFont("SansSerif", 20);
  textFont(plotFont);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  //background(0);
  strokeWeight(5); 
  stroke(255);
  drawDataPoints(0);
  stroke(255, 0, 0);
  drawDataPoints(1);
  drawYearLabels();
  //drawLines(1);
}

/////////////////////////// FUNCTIONS ////////////////////////////
// Draw the data as a series of points 
void drawDataPoints(int col) { 
  int rowCount = data.getRowCount(); 
  // Read data from each row and in the column specified in function
  for (int row = 0; row < rowCount; row++) { 
    if (data.isValid(row, col)) { 
      // Get data from each row
      float value = data.getFloat(row, col); 
      float x = map(months[row], monthMin, monthMax, plotX1, plotX2); 
      float y = map(value, dataMin, dataMax, plotY2, plotY1); 
      point(x, y);
    }
  }
} 

void drawYearLabels() {
  fill(0);
  textSize(10);
  textAlign(CENTER);

  // Use thin, gray lines to draw the grid
  stroke(127);
  strokeWeight(1);

  for (int row = 0; row < rowCount; row++) {
    if (months[row] % monthsInterval == 0) {
      float x = map(months[row], monthMin, monthMax, plotX1, plotX2);
      fill(255);
      text(months[row], x, plotY2 + textAscent() + 10);

      //line(x, plotY1, x, plotY2);
    }
  }
}

// Draw the data as lines (WIP 13.09.2015 -  NOT IMPLEMENTED YET !!!!!!! )
void drawLines(int col) { 
  int rowCount = data.getRowCount(); 
  // Read data from each row and in the column specified in function
  for (int row = 0; row < rowCount; row++) { 
    if (data.isValid(row, col)) { 
      // Get data from each row which will be used for y values
      float value = data.getFloat(row, col); 
      float x = map(months[row], monthMin, monthMax, plotX1, plotX2); 
      LineplotX1[row] = x;
      float y = map(value, dataMin, dataMax, plotY2, plotY1);
      LineplotY1[row] = y;
    }
  }


  float xStart = LineplotX1[index];
  float yStart = LineplotY1[index]; 
  float xNext = LineplotX1[index+1];
  float yNext = LineplotY1[index+1]; 

  if (index<=LineplotX1.length-1) {
    index++;
  } else {
    index = LineplotX1.length;
  }

  line(xStart, yStart, xNext, yNext);

}

