Bird bird;

ArrayList<Pipe> pipes;

float gravity = 0.3;

int score = 0;

void setup() {
  size(640, 480);
  bird = new Bird();

  pipes = new ArrayList<Pipe>();
}

void draw() {
  if (frameCount % 100 == 0) {
    pipes.add(new Pipe());
  }
  background(200);
  bird.applyForce(gravity);
  bird.show();
  bird.update();

  for (Pipe pipe : pipes) {
    pipe.show();
    pipe.update();
    if (pipe.intersects(bird))
      bird.setDead(true);
  }

  for (int i = pipes.size()-1; i >= 0; i--) {
    if (pipes.get(i).isOffScreen()) {
      pipes.remove(i);
      score++;
    }
  }

  fill(0);
  text("Score: " + score, width/2, 25);
  if (bird.isDead()) {
    noLoop();
  }
}

void keyPressed() {
  bird.applyForce(-7);
}
