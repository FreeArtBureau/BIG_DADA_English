/*
Graphical class : Using a PVector

*/


class Vec {

  PVector loc;
  PVector vel;
  PVector acc;
  PVector dataPnt;


  Vec(float xPos, float yPos) {
    loc = new PVector(xPos, yPos);
    vel = new PVector(0, 0);    
    acc = new PVector(0, 0);
  }


  void update(float x, float y) {

    dataPnt = new PVector(x, y);
    PVector dir = PVector.sub(dataPnt, loc);
    dir.normalize();
    dir.mult(0.1);
    acc = dir;

    //acc = PVector.random2D(); // Assign a PVector of length 1 pointing in a random direction
    //acc.mult(random(0.2)); // we can scale our random PVector in the following manner
    //acc.mult(noise(loc.x*0.0003, loc.y*0.0003)*0.9); // or try with noise
    vel.add(acc);
    loc.add(vel);
    vel.limit(0.5); // Limit our vel to adpat velocity of our vector
  }

  void renderPoint() {
    fill(255, 0, 0);
    noStroke(); 
    ellipse(dataPnt.x, dataPnt.y, 5, 5);
  }

  void render() {
    fill(255);
    noStroke(); 
    ellipse(loc.x, loc.y, 1, 1);
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

