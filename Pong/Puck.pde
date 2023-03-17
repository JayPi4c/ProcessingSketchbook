class Puck {

  float x;
  float y;
  float xspeed = 5; 
  float yspeed = 6;
  float r = 12;

  Puck() {
    reset();
  }

  void show() {
    rectMode(CENTER);
    rect(x, y, r*2, r*2);
    //ellipse(x, y, r*2, r*2);
  }

  void update() {
    x += xspeed;
    y += yspeed;
  }

  void reset() {
    x = width/2;
    y = height/2;

    float angle = random(-45, 45);
    float rad = radians(angle);
    xspeed = paddleSpeed * cos(rad);
    yspeed = paddleSpeed * sin(rad);

    float ran = random (1); 
    if (ran < 0.5) {
      xspeed *= -1;
    }
  }

  void collision() {
    if (x+r > right.x && y-r <  right.y + (right.h/2) && y+r > right.y - (right.h/2)) {
      float diff = right.y+right.h/2 - y;
      float angle = map(diff, 0, right.h, -225, -135);
      float rad = radians(angle);
      xspeed = paddleSpeed * cos(rad);
      yspeed = paddleSpeed * sin(rad);

      x = right.x - right.w/2 +xspeed;
    }

    if (x-r < left.x && y-r <  left.y + (left.h/2) && y+r > left.y - (left.h/2)) {
      float diff = left.y+left.h/2 - y;
      float angle = map(diff, 0, left.h, 45, -45);
      float rad = radians(angle);
      xspeed = paddleSpeed * cos(rad);
      yspeed = paddleSpeed * sin(rad);

      x = left.x + left.w/2 + xspeed;
    }
  }

  void edges() {
    if (y > height || y < 0) {
      reset();
    } else if (y + r > height || y-r < 0) {
      yspeed *= -1;
    }

    if (x + r > width) {
      scoreLeft++;
      reset();
    }
    if (x-r < 0) {
      scoreRight++;
      reset();
    }
  }
}