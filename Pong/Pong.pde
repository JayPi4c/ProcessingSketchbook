Puck puck;
Paddle left;
Paddle right;

float paddleSpeed = 5;

int scoreLeft;
int scoreRight;

boolean LeftHasPlayed = false;
boolean RightHasPlayed = false;

final byte HARD = 2;
final byte MEDIUM = 1;
final byte EASY = 0;
final byte IMPOSSIBLE = 3;

void setup() {
  size(800, 600);

  scoreLeft = 0;
  scoreRight = 0; 

  puck = new Puck();
  left = new Paddle (15, EASY);
  right = new Paddle(width-15, HARD);
}

void draw() {
  background(0);
  noStroke();
  fill(255);

  textSize(32);
  text(scoreLeft, 16, 32);
  text(scoreRight, width - 32, 32);
  textAlign(CENTER);
  text("Pong", width/2, 32);
  if (!right.BOT) {
    if (!RightHasPlayed) {
      text("o", width - 40, height/2-20);
      text("l", width - 40, height/2+20);
    } else {
      text(" ", width - 40, height/2-20);
      text(" ", width - 40, height/2+20);
    }
  }
  if (!left.BOT) {
    if (!LeftHasPlayed) {
      text("w", 40, height/2-20);
      text("s", 40, height/2+20);
    } else {
      text(" ", 40, height/2-20);
      text(" ", 40, height/2+20);
    }
  }

  puck.update();
  puck.edges();
  puck.collision();
  puck.show();

  if(right.BOT)right.useBOT( right);
  if(left.BOT)left.useBOT( left);

  left.update();
  right.update();

  left.show();
  right.show();
}





void keyPressed() {
  if (key == 'w') {
    LeftHasPlayed = true;
    left.speed = -paddleSpeed;
  } else if (key == 's') {
    LeftHasPlayed = true;
    left.speed = paddleSpeed;
  }

  if (key == 'o') {
    RightHasPlayed = true;
    right.speed = -paddleSpeed;
  } else if (key == 'l') {
    RightHasPlayed = true;
    right.speed = paddleSpeed;
  }
}

void keyReleased() {
  if (key == 'w') {
    left.speed = 0;
  } else if (key == 's') {
    left.speed = 0;
  }

  if (key == 'o') {
    right.speed = 0;
  } else if (key == 'l') {
    right.speed = 0;
  }
}