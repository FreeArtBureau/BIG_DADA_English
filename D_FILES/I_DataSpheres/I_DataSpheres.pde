///////////////////////////////////////
/*
 ++++++++++++++++++++++++++++++++++++++++++
 GRAPHIC SYSTEMS 0.5 (2012)
 AN INTRODUCTORY COURSE TO CREATIVE 
 CODING FOR GRAPHIC DESIGN STUDENTS.
 
 IMPLEMENTED BY THE FREE ART BUREAU 2012/13 
 www.freeartbureau.org
 +++++++++++++++++++++++++++ 
 DATA : BOX2D
 SKETCH : DATA_SPHERES
 TYPE : DYNAMIQUE
 
 AIRE DU LIVRE > M2
 SURFACET > SURFACE TOTALE SIGNE 
 
 */

/////////////////////////// GLOBALS ////////////////////////////
import pbox2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import processing.opengl.*;
import processing.pdf.*;


PBox2D box2d; // This is our Box2D World !

String[] rows;
Spheres[] s;

int num;
float aire, surfaceT;
String gen, titre;
//color myc;

/////////////////////////// SETUP ////////////////////////////

void setup() {
 // size(1000, 700, OPENGL);
  //Ne pas utiliser OPENGL pour l'enregistrement en PDF
  size(1000, 700);
  background(255);
  smooth();

  rows = loadStrings("data_01.tsv");
  box2d = new PBox2D(this);
  box2d.createWorld();
  box2d.setGravity(0, 0);
  
  s = new Spheres[rows.length];
  for (int i=1; i < rows.length; i++) {
    String[] parts = split(rows[i], TAB);

    //num = Integer.parseInt(parts[0]);
    aire = Float.parseFloat(parts[1]); // Ici on récupère les données pour l'aire en m2
    surfaceT = Float.parseFloat(parts[2]);// Ici on récupère les données pour le pourcentage de caractères
    gen = parts[3]; // la couleur par genre
    titre = parts[4]; // les titres
    color myc = unhex(gen);
    println(myc);
    //Donc ici nous créeons nos spheres en fonction de ces données.
    //Spheres(radius extérieur, titre, gen, couleur,radius intérieur) 
    //Donc, le % de caractères détermine le radius extérieur et l'aire en m2 le radius intérieur
    s[i] = new Spheres(surfaceT, titre, gen, myc, aire);
  }
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);
  box2d.step();
    for (int i=1; i < rows.length; i++) {
      s[i].display();
    }
}

/////////////////////////// FUNCTIONS ////////////////////////////


void keyPressed() {
  if(key == 's')
  saveFrame("img_###.png");
  if (key == 'r') 
    beginRecord(PDF, "img_###.pdf");

  if (key == 'e')
    endRecord();
}

