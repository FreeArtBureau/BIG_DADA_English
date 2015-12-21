/*
Rien à faire ici.
Shperes est une classe pour visualiser nos données.
Ces éléments graphiques ont des propriétés physiques

*/
class Spheres {

  Body body;
  float r, r2;
  String t;
  String gen;
  color c;

  Spheres(float _r, String _t, String _gen, color _c, float _r2) {

    t = _t;
    r = _r;
    r2 = _r2;
    gen = _gen;
//    surface = _surface;
    c = _c;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(random(200,300), random(350,450)));
    body = box2d.createBody(bd);

    CircleShape shp = new CircleShape();
    shp.m_radius = box2d.scalarPixelsToWorld(r/2);

    FixtureDef fd = new FixtureDef();
    fd.shape = shp;
    fd.density = 1;
    fd.friction = 0.1;
    fd.restitution = 0.1;
    body.createFixture(fd);
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a); //Box2D calculates rotation in the opposite direction to Processing !
    fill(c,150);
    noStroke();
    ellipse(0, 0, r, r);
    fill(c,200);
    ellipse(0, 0, r2, r2);
    fill(c);
   // textSize(7);
    textSize(aire*1.2);

    text(t, 10, 0); // Afficher le titre
    text(aire, 0, 10); // Afficher le genre
    popMatrix();
  }

  void killBody() {
    box2d.destroyBody(body);
  }
}

