class Ball {

  PVector position;
  PVector velocity;
  PVector acceleration;

  color c;

  float radius = 25;

  public Ball(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector();
    c = color(random(255), random(255), random(255));
  }

  public void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);

    if (position.x+radius >= width ) {
      velocity.x = velocity.x*-1;
      position.x = width-radius;
    } else if ( position.x-radius <= 0) {
      velocity.x = velocity.x*-1;
      position.x = radius;
    }
    if (position.y+radius >= height) {
      velocity.y = velocity.y*-1;
      position.y = height-radius;
    } else if (position.y-radius <= 0) {
      velocity.y = velocity.y*-1;
      position.y = radius;
    }
  }

  public void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  public void bounce(Ball other){
    if(position.dist(other.position) <= 2*radius){
      velocity.mult(-1);
    }
  }

  public void show() {
    noStroke();
    fill(c);
    ellipse(position.x, position.y, radius*2, radius*2);
  }
}
