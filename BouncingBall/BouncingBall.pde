Ball[] balls = new Ball[5];
PVector gravity = new PVector(0, 0.2);

void setup() {
  size(640, 480);
  for (int i = 0; i  < balls.length; i++) {
    balls[i] = new Ball(random(25, width-25), random(25, height-25));
  }
}

void draw() {
  background(51);

  for (Ball b : balls) {
    for (Ball other : balls) {
      if (b == other)
        continue;
      b.bounce(other);
    }    

    b.update();
    b.show();


    b.applyForce(gravity);
  }
}

PVector wind = new PVector(-0.5, 0);
void mousePressed() {
  for (Ball b : balls) {
    b.applyForce(wind);
  }
}
