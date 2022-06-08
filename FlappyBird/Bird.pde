class Bird {

  // Attribute
  float x, y;
  float radius = 10;
  float y_speed;
  float y_acc; // acceleration -> Beschleunigung

  private float limit = 10;
  boolean dead;

  // Konstruktor
  public Bird() {
    dead = false;
    this.x = 30;
    this.y = height/2;

    y_speed = 0;
    y_acc = 0;
  }


  // Methoden
  void show() {
    strokeWeight(1);
    fill(0, 255, 255);
    circle(x, y, 2*radius);
  }

  void applyForce(float force) {
    y_acc += force;

    // limit maximum force
    if (y_acc < -1*limit  ) {
      y_acc /= y_acc*-1*limit;
    } else if (y_acc > limit) {
      y_acc /= y_acc*limit;
    }
  }
  void update() {
    y_speed += y_acc;
    y += y_speed;
    y_acc = 0;

    if (y + radius > height) {
      dead = true;
    }
  }

  boolean isDead() {
    return dead;
  }
  
   void setDead(boolean dead) {
    this.dead = dead;
  }

  float getY() {
    return y;
  }
  float getRadius() {
    return radius;
  }
  float getX() {
    return x;
  }
}
