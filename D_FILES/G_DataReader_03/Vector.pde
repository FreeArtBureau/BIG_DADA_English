/*
Graphical class : Using a PVector
 
 */


class Vec {

  PVector loc;
  PVector locBars;
  PVector vel;
  PVector acc;
  PVector dataPnt;
  PVector dataPnt_2;


  Vec(float xPos, float yPos) {
    loc = new PVector(xPos, yPos);
    locBars = new PVector(xPos, height-493);
    vel = new PVector(0, 0);    
    acc = new PVector(0, 0);
  }

  // MOTION
  //////////////////////////////////////////////////////////////////////////// 
  void update(float x, float y) {
    dataPnt = new PVector(x, y);
    PVector dir = PVector.sub(dataPnt, loc);
    dir.normalize();
    dir.mult(0.3);
    acc = dir;

    //acc = PVector.random2D(); // Assign a PVector of length 1 pointing in a random direction
    //acc.mult(random(0.2)); // we can scale our random PVector in the following manner
    //acc.mult(noise(loc.x*0.0003, loc.y*0.0003)*0.9); // or try with noise
    vel.add(acc);
    loc.add(vel);
    vel.limit(0.1); // Limit our vel to adpat velocity of our vector
  }

  // GRAPHICS
  //////////////////////////////////////////////////////////////////////////// 


  // Simple data point render
  void renderPoint() {
    fill(255);
    noStroke(); 
    ellipse(dataPnt.x, dataPnt.y, 5, 5);
  }

  // Data point render size based on data
  void renderPointDia(float diameters) {
    strokeWeight(1);
    stroke(255);
    noFill(); 
    //diameters = map(diameters, data.getColumnMin(0), data.getColumnMax(0), 3, 23);
    float dia = map(diameters, 145, 110, 2, 50);
    ellipse(dataPnt.x, dataPnt.y, dia, dia);
  }
  // Display line graphic : Horizontal time based
  void drawLine() {
    fill(255);
    noStroke(); 
    ellipse(loc.x, loc.y, 1, 1);
  }

  // Display point graphic : Horizontal time based
  void drawPoints() {
    fill(255);
    noStroke();     
    ellipse(dataPnt.x+10, (height-273)+loc.y, 2, 2);
  }

  // Display line graphic : Vertical time based
  void drawBars(float len) {
    fill(255);
    noStroke(); 
    float barLen = map(len, 145, 110, 2, 25);
    rect(dataPnt.x+10, (height-390)+loc.y, barLen, 2);
  }

  // VERTICAL SPARK LINES 
  //////////////////////////////////////////////////////////////////////////// 

  // Display line graphic : Vertical time based
  void drawVerticalSparks_01() {
    fill(255);
    noStroke(); 
    ellipse(dataPnt.x, locBars.y, 2, 2);
  }

  // Display line graphic : Vertical time based
  // NOT WORKING !!!
  void drawVerticalSparks_02(float len) {
    noFill();
    stroke(255);
    strokeWeight(0.5); 
    float barLen = map(len, 145, 110, 2, 10);
    rect(dataPnt.x+locBars.y/10, height-73, len/10, 2-locBars.y/20);
  }

  void updateVerticalSparks(float xPos, float yPos) {
    dataPnt_2 = new PVector(xPos, yPos);
    PVector dir = PVector.sub(dataPnt_2, locBars);
    dataPnt_2.normalize();
    dataPnt_2.mult(0.1);
    acc = dataPnt_2;

    //acc = PVector.random2D(); // Assign a PVector of length 1 pointing in a random direction
    //acc.mult(random(0.2)); // we can scale our random PVector in the following manner
    //acc.mult(noise(loc.x*0.0003, loc.y*0.0003)*0.9); // or try with noise
    vel.add(acc);
    locBars.add(vel);
    vel.limit(0.2); // Limit our vel to adpat velocity of our vector
  }

  /*
    void check() {
   if (loc.x > width) {
   loc.x = 0;
   } 
   if (loc.x < 0) {
   loc.x = width;
   } 
   
   if (loc.y > height) {
   loc.y = 0;
   } 
   if (loc.y < 0) {
   loc.y = height;
   }
   }
   */
}

