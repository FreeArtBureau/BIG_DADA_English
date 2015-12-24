/////////////////////////////// DRAWING FUNCTIONS

void displayText() {
  fill(360,100,0);
  // Display textual data
  text("City: " + city, width*0.15, height*0.33);
  text("Today’s high: " + temperature, width*0.15, height*0.46);
  text("Forecast: " + weather, width*0.15, height*0.56);
  text("Wind: " + windSpeed, width*0.15, height*0.66);
}

////////////////////// 
void temperatureBG() {
  noStroke();
  color c = (int)map(temperature, -10, 30, 70, 360);
  fill(c, 50, 100);
  rect(50, 35, 500, 270);
}


////////////////////// 
void lines() {
  stroke(0);
  strokeWeight(0.3);

  for (int yPos=75; yPos<height-75; yPos+=5) {
    for (int xPos=75; xPos<width-75; xPos+=5) {
      float ws =  map(windSpeed, 0, 120, 0, 0.5);
      float z = frameCount*ws;
      float offSet = noise(xPos*noiseScale, yPos*noiseScale, z) * noiseAmm;
      pushMatrix();
      translate(xPos, yPos);
      //noFill();
      rotate(radians(-45));
      line(-lineLnH+offSet, -lineLnH, lineLnH, lineLnH);
      popMatrix();
    }
  }
}

