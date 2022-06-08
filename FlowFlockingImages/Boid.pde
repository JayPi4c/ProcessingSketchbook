class Boid {

  PVector position, velocity, acceleration;

  private final float maxSpeed = 2.5;
  float maxForce = 1;

  PGraphics pg;
  Boid(PGraphics pg) {
    this.pg = pg;
    position = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }


  void applyForce(PVector force) {
    this.acceleration.add(force);
  }

  void update() {
    position.add(velocity);
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    acceleration.mult(0);
    edges();
  }

  void edges() {
    if (position.x < 0)position.x = width;
    if (position.x > width) position.x = 0;
    if (position.y < 0) position.y = height;
    if (position.y > height) position.y = 0;
  }

  void applyFlow(Flowfield flowfield) {
    int i = (int)(position.x / flowfield.scl) % (width / flowfield.scl);
    int j = (int)(position.y / flowfield.scl) % (height / flowfield.scl);
    PVector flowForce = flowfield.flows[i][j];
    applyForce(flowForce);
  }


  PVector align(Boid[] boids) {
    int perceptionRadius = 50;
    PVector steering = new PVector();
    int total = 0;
    for (Boid other : boids) {
      float d = dist(this.position.x, this.position.y, other.position.x, other.position.y);
      if (other != this && d < perceptionRadius) {
        steering.add(other.velocity);
        total++;
      }
    }
    if (total > 0) {
      steering.div(total);
      steering.setMag(this.maxSpeed);
      steering.sub(this.velocity);
      steering.limit(this.maxForce);
    }
    return steering;
  }

  PVector separation(Boid[] boids) {
    int perceptionRadius = 50;
    PVector steering = new PVector();
    int total = 0;
    for (Boid other : boids) {
      float d = dist(this.position.x, this.position.y, other.position.x, other.position.y);
      if (other != this && d < perceptionRadius) {
        PVector diff = PVector.sub(this.position, other.position);
        diff.div(d * d);
        steering.add(diff);
        total++;
      }
    }
    if (total > 0) {
      steering.div(total);
      steering.setMag(this.maxSpeed);
      steering.sub(this.velocity);
      steering.limit(this.maxForce);
    }
    return steering;
  }

  PVector cohesion(Boid[] boids) {
    int perceptionRadius = 100;
    PVector steering = new PVector();
    int total = 0;
    for (Boid other : boids) {
      float d = dist(this.position.x, this.position.y, other.position.x, other.position.y);
      if (other != this && d < perceptionRadius) {
        steering.add(other.position);
        total++;
      }
    }
    if (total > 0) {
      steering.div(total);
      steering.sub(this.position);
      steering.setMag(this.maxSpeed);
      steering.sub(this.velocity);
      steering.limit(this.maxForce);
    }
    return steering;
  }

  void flock(Boid[] boids) {
    PVector alignment = this.align(boids);
    PVector cohesion = this.cohesion(boids);
    PVector separation = this.separation(boids);

    alignment.mult(alignValue);
    cohesion.mult(cohesionValue);
    separation.mult(seperationValue);

    this.acceleration.add(alignment);
    this.acceleration.add(cohesion);
    this.acceleration.add(separation);
  }

  void show() {
    pg.colorMode(RGB);
    pg.stroke(0, 5);
    // stroke(0);
    pg.strokeWeight(3);
    pg.point(position.x, position.y);
  }

  void showHSB() {
    float h = map(velocity.heading(), -PI, PI, 0, 255);
    // h = 255 - h;
    pg.colorMode(HSB);
    pg.stroke(h, 255, 255, 5);
    pg.strokeWeight(3);
    pg.point(position.x, position.y);
  }

  void showBoid() {
    colorMode(RGB);
    stroke(0);
    strokeWeight(3);
    point(position.x, position.y);
  }
}
