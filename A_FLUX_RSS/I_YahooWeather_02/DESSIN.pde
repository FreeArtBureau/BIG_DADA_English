/////////////////////////////// FUNCTION DE DESSIN

void AfficheTexte() {
  fill(360,100,0);
  // On affiche nos données
  text("City: " + city, width*0.15, height*0.33);
  text("Today’s high: " + temperature, width*0.15, height*0.46);
  text("Forecast: " + meteo, width*0.15, height*0.56);
  text("Wind: " + vitesseVent, width*0.15, height*0.66);
}

////////////////////// DESSIN DE FOND QUI CHANGE DE COULEUR EN FONCTION DE LA TEMPERATURE
void TemperatureBG() {
  noStroke();
  color c = (int)map(temperature, -10, 30, 100, 360);
  fill(c, 100, 100);
  rect(50, 35, 500, 270);
}


////////////////////// DESSIN DE TRAME QUI BOUGE EN FONCTION DE LA VITESSE DU VENT
void lines() {
  stroke(0);
  strokeWeight(0.5);

  for (int yPos=75; yPos<height-75; yPos+=6) {
    for (int xPos=75; xPos<width-75; xPos+=6) {
      float windSpeed =  map(vitesseVent, 0, 120, 0, 0.8);
      float z = frameCount*windSpeed;
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

