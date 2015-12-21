/**
::::::::::::::::::::::::
SIMPLE ZOOM/MOVE MAP
::::::::::::::::::::::::

http://unfoldingmaps.org 
TUTO ON CREATING MAPS :
http://tillnagel.com/2011/06/tilemill-for-processing/

en français :
http://blog.adrienvh.fr/2013/02/27/tilemill-colorer-et-ajouter-un-fichier-raster/
*/

import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.providers.StamenMapProvider;


UnfoldingMap map;

void setup() {
  size(800, 600, P2D);

  map = new UnfoldingMap(this, new StamenMapProvider.Toner());
  map.zoomAndPanTo(new Location(49.9f, 2.3f), 10);
  MapUtils.createDefaultEventDispatcher(this, map);
}

void draw() {
  map.draw();
   Location here = map.getLocation(mouseX, mouseY);
  fill(0);
  text(here.getLat() + ", " + here.getLon(), mouseX, mouseY);
}

