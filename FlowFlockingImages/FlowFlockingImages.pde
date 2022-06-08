
Flowfield flowfield;

int n = 500;

Boid[] flock;

float alignValue = .5;
float cohesionValue = 1;
float seperationValue = 1.2;

PGraphics pg;
void setup() {
  //size(500, 500, P2D);
  fullScreen(P2D);
  pg = createGraphics(width, height);
  flowfield = new Flowfield();
  flock = new Boid[n];
  for (int i = 0; i < n; i++) {
    flock[i] = new Boid(pg);
  }
  pg.beginDraw();
  pg.background(0, 0);
  pg.endDraw();
}

void draw() {
  background(255);
  pg.beginDraw();
  for (Boid  boid : flock) {
    boid.flock(flock);
    boid.applyFlow(flowfield);
    boid.update();
     //boid.show();
    boid.showHSB();
    if (!hideDebug)
      boid.showBoid();
  }
  pg.endDraw();

  if (!hideDebug)
    flowfield.printField();
  flowfield.update();
  if (show)
    image(pg, 0, 0);
  // println(frameRate);
}

void keyReleased() {
  if (key == ' ') {
    saveFrame("imgs/frame-###.png");
  }

  if (key == 's') {
    show = !show;
  }

  if (key == 'h') {
    hideDebug = !hideDebug;
  }
}

boolean show = true;
boolean hideDebug = false;
