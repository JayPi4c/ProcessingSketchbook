int score = 0;

float gravity = 0.3;


ArrayList<Pipe> pipes;
Bird bird; 

void setup() {
  size(640, 480);

  bird = new Bird();
  pipes = new ArrayList<Pipe>();

  pipes.add(new Pipe());
}



void draw() {
  background(255);

  if (frameCount % 100 == 0)
    pipes.add(new Pipe());


  bird.applyForce(gravity);

  for (Pipe p : pipes) {
    p.update();
    p.show();
    if (p.intersects(bird))
      bird.setDead(true);
  }

  bird.update();
  bird.show();

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
