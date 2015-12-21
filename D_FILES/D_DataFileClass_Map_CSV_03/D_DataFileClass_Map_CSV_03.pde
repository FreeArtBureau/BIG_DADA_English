/*
::::::::::::::::::::::::::::::
 ------------------------------
 PARSING DATA : CSV FILES
 ------------------------------
 ::::::::::::::::::::::::::::::
 
 DEV 13//2015
 Sketch : DataFileClass_Map_CSV_03
 
 - Reads incoming data from a file
 - Maps geographic points using unfolding
 
 ** NOTE 
 
 
 */
/////////////////////////// GLOBALS ////////////////////////////
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.providers.*;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.geo.*;

UnfoldingMap map; 
FloatTable data;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(800, 480, P2D);
  background(0);
  smooth();
  noStroke();
  map = new UnfoldingMap(this, new StamenMapProvider.WaterColor());
  MapUtils.createDefaultEventDispatcher(this, map);

  // J'ai crée cette fonction en bas
  initData(); // data initialisation function
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  map.draw();

  //background(0);
}
/////////////////////////////////////////////////////////////////////////////////
void initData() {  
  // File Datas
  data = new FloatTable("openpaths_01.csv");
  int rowCount = data.getRowCount(); 
  int colCount = data.getColumnCount();

  // New float vars for storing long & latitude values
  float latitude[] = new float[rowCount];
  float longitude[] = new float[rowCount];

  for (int row = 0; row<rowCount; row++) {
    latitude[row] = data.getFloat(row, 0);
    longitude[row] = data.getFloat(row, 1);
  }


  // Map Datas
  SimplePointMarker[] myMarkers;
  myMarkers = new SimplePointMarker[rowCount];
  Location[] loc = new Location[rowCount];

  for (int i = 0; i<myMarkers.length; i++) {
    // Add locations
    loc[i] = new Location(latitude[i], longitude[i]);
    // Add locations to our Markers & to the map ;–)
    myMarkers[i] = new SimplePointMarker(loc[i]);
    map.addMarkers(myMarkers[i]);
    myMarkers[i].setColor(color(0, 0, 255));
      myMarkers[i].setStrokeColor(color(255, 0, 0));
    myMarkers[i].setStrokeWeight(1);
  }
  //Zoom to start location
  map.zoomAndPanTo(loc[0], 10);
}


