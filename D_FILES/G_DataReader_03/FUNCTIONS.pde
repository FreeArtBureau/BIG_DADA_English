/////////////////////////// FUNCTIONS ////////////////////////////

// These are all functions for drawing the graphics 
// and are part of the FloatTable class.

///////////////////////////////////////////////////////


/////////////////////////////////////////////////////////
// Draw the data as a series of points instantly
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

/////////////////////////////////////////////////////////
// Calculates x & y coords for sparklines
void calculateLineCoords(int col) { 
   int rowCount = data.getRowCount(); 
  // Read data from each row and in the column specified in function
  for (int row = 0; row < rowCount; row++) { 
    if (data.isValid(row, col)) { 
      // Get data from each row which will be used for y values
      float value = data.getFloat(row, col); 
      // Map row values to x coordinates
      float x = map(months[row], monthMin, monthMax, plotX1, plotX2); 
      LineplotX1[row] = x; // Assign each to our array for x
       // Map row values to y coordinates
      float y = map(value, dataMin, dataMax, plotY2, plotY1);
      LineplotY1[row] = y; // Assign each to our array for y
    }
  }
}


/////////////////////////////////////////////////////////
// Display data as years 
void drawYearLabels() {
  PGraphics pg = createGraphics(width, height, P2D);
  pg.beginDraw();
    // TEXT
  plotFont = createFont("SansSerif", 20);
  pg.textFont(plotFont, 12); 
  pg.fill(0);
  pg.textSize(12);
  pg.textAlign(CENTER);

  // Use thin, gray lines to draw the grid
  pg.stroke(127);
  pg.strokeWeight(1);

  for (int row = 0; row < rowCount; row++) {
    if (months[row] % monthsInterval == 0) {
      float x = map(months[row], monthMin, monthMax, plotX1, plotX2);
      pg.fill(255);
      pg.text(months[row], x, plotY2 + textAscent() + 10);
    }
  }
  pg.endDraw();
  image(pg, 10, 10);
}

/////////////////////////////////////////////////////////
// Implement a class that calculates all the x & y points
// >>> https://processing.org/discourse/beta/num_1158908277.html
/*
The idea is to calcualte the first data points as x & y coords
to be passed to the vector on setup

*/
void calculatePoints(int col) { 
  int rowCount = data.getRowCount(); 
  // Read data from each row and in the column specified in function
  for (int row = 0; row < rowCount; row++) { 
    if (data.isValid(row, col)) { 
      // Get data from each row which will be used for y values
      float value = data.getFloat(row, col); 
      // Map row values to x coordinates
      float x = map(months[row], monthMin, monthMax, plotX1, plotX2); 
      LineplotX1[row] = x; // Assign each to our array for x
       // Map row values to y coordinates
      float y = map(value, dataMin, dataMax, plotY2, plotY1);
      LineplotY1[row] = y; // Assign each to our array for y
    }
  } 
}

///////////////////////////////////////////////////////// INITIALISE INCOMING DATA
void initData() {
  data = new FloatTable("data2.tsv");
  rowCount = data.getRowCount();
//  println( rowCount );
  // Number of yvalues
  LineplotY1 = new float[data.getRowCount()];
  LineplotX1 = new float[data.getRowCount()];

  // PLOTTING METHODS & DATA
  dataMin = 0; 
  dataMax = data.getTableMax(); 

  months = int(data.getRowNames()); 
  monthMin = months[0]; 
  monthMax = months[months.length - 1];

  // Initialise data points in relation to 2D space 
  plotX1 = 50; 
  plotX2 = width - plotX1; 
  plotY1 = 60; 
  plotY2 = height - plotY1; 
  
  float r = data.getColumnMin(0);
  println( r );
  float rMin = data.getColumnMax(0);
  println( rMin );
  
}
