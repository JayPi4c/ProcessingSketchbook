class Paddle {
  float x;
  float y = height/2;
  float w = 10;
  float h = height/5;

  float speed = 0;
  float mode;
  final byte NONE = 10;
  boolean BOT = true;


  Paddle(float x_, byte mode_) {
    mode = mode_;
    x = x_;
  }


  Paddle(float x_) {
    x = x_;
    mode = NONE;
    BOT = false;
  }

  void show() {
    rectMode(CENTER);
    switch ((int)mode) {
    case HARD:
      fill(255, 0, 0);
      break;
    case EASY: 
      fill(0, 255, 0);
      break;
    case MEDIUM: 
      fill(255, 255, 0); 
      break;
    case IMPOSSIBLE: 
      fill(0);
      stroke(1);
      break;
    default: 
      fill (255);
      break;
    }
    rect(x, y, w, h);
  }

  void update() {
    move();
  }

  void move() {
    if (speed > 0 && y < height) {
      y += speed;
    }
    if (speed < 0 && y > 0) {
      y += speed;
    }
  }

  void useBOT(Paddle p) {    

    if (p.x > width/2) {
      if (mode == HARD) {
        if (puck.x > width/2) {
          if (puck.y < y + 30 && puck.y > y - 30) {
            speed = 0;
          } else if (y < puck.y) {
            speed = map(puck.x, width/2, width, 2, 5);
          } else if (y > puck.y) {
            speed = map(puck.x, width/2, width, -2, -5);
          }
        } else {
          if (y < height/2-30) {
            speed = 1;
          } else if (y > height/2 +30) {
            speed = -1;
          } else
            speed = 0;
        }
      }

      if (mode == MEDIUM) {
        if (puck.x > width/2) {
          if (puck.y < y + 30 && puck.y > y - 30) {
            speed = 0;
          } else if (y < puck.y) {
            speed = 3;
          } else if (y > puck.y) {
            speed = -3;
          }
        } else {
          if (y < height/2-30) {
            speed = 1;
          } else if (y > height/2 +30) {
            speed = -1;
          } else
            speed = 0;
        }
      }

      if (mode == EASY) {
        if (puck.x > width/2) {

          if (puck.y < y + 30 && puck.y > y - 30) {
            speed = 0;
          } else if (y < puck.y) {
            speed = 3;
          } else if (y > puck.y) {
            speed = -3;
          }
        } else {
          speed = 0;
        }
      }
      if (mode == IMPOSSIBLE) {
        y = puck.y;
      }
    } else if (p.x < width/2) {
      if (mode == HARD) {
        if (puck.x < width/2) {
          if (puck.y < y + 30 && puck.y > y - 30) {
            speed = 0;
          } else if (y < puck.y) {
            speed = map(puck.x, width/2, 0, 2, 5);
          } else if (y > puck.y) {
            speed = map(puck.x, width/2, 0, -  2, -5);
          }
        } else {
          if (y < height/2-30) {
            speed = 1;
          } else if (y > height/2 +30) {
            speed = -1;
          } else
            speed = 0;
        }
      }

      if (mode == MEDIUM) {
        if (puck.x < width/2) {
          if (puck.y < y + 30 && puck.y > y - 30) {
            speed = 0;
          } else if (y < puck.y) {
            speed = 3;
          } else if (y > puck.y) {
            speed = -3;
          }
        } else {
          if (y < height/2-30) {
            speed = 1;
          } else if (y > height/2 +30) {
            speed = -1;
          } else
            speed = 0;
        }
      }

      if (mode == EASY) {
        if (puck.x < width/2) {

          if (puck.y < y + 30 && puck.y > y - 30) {
            speed = 0;
          } else if (y < puck.y) {
            speed = 3;
          } else if (y > puck.y) {
            speed = -3;
          }
        } else {
          speed = 0;
        }
      }
      if (mode == IMPOSSIBLE) {
        y = puck.y;
      }
    }
  }
}