
Flowfield flowfield;

int n = 500;

Boid[] flock;

float alignValue = .5;
float cohesionValue = 1;
float seperationValue = 1.2;

void setup() {
  //size(500, 500, P2D);
  fullScreen(P2D);
  flowfield = new Flowfield();
  flock = new Boid[n];
  for (int i = 0; i < n; i++) {
    flock[i] = new Boid();
  }
  background(255);
}

void draw() {


  for (Boid  boid : flock) {
    boid.flock(flock);
    boid.applyFlow(flowfield);
    boid.update();
    boid.show();
    //boid.showHSB();
    //boid.showBoid();
  }

  //flowfield.printField();
  flowfield.update();
  // println(frameRate);
}

void keyReleased() {
  if (key == ' ') {
    saveFrame("imgs/frame-###.png");
  }
}
