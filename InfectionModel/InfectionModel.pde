final int CIRCLES = 20;
PVector circles[] = new PVector[CIRCLES];
int stats[][] = new int[CIRCLES][3];

int radius = 10;

void setup() {
  size(640, 480);

  noStroke();

  for (int i = 0; i < CIRCLES; i++) {
    stats [i] = new int[]{floor(random(-5, 5)), floor(random(-5, 5)), (random(1) < 0.05 ? 1: 0)
    };
    circles[i] = new PVector(random(radius, width-radius), random(radius, height-radius));
  }
  // patient 0
  stats[0][2] = 1;
}


boolean allInfected() {
  for (int[] arr : stats)
    if (arr[2]==0)
      return false;
  return true;
}

void move(int i) {
  circles[i].x += stats[i][0];
  circles[i].y += stats[i][1];
  if (circles[i].x < radius || circles[i].x > width-radius)
    stats[i][0] *= -1;
  if (circles[i].y < radius || circles[i].y > height-radius)
    stats[i][1] *= -1;
}

void infect(int i) {
  if (stats[i][2] != 1)
    return;
  //for (int j = i+1; j < CIRCLES; j++) {
  for (int j = 0; j < CIRCLES; j++) {
    if (stats[j][2]!= 0 || i==j)
      continue;
    if (intersect(i, j)) {
      stats[j][2] = 1;
     
      
      
    }
  }
  
}

void collide(int i ) {
  for (int j = 0; j < CIRCLES; j++) {
    if (i == j)
      continue;
    if (intersect(i, j)) {
    }
  }
}


boolean intersect(int i, int j) {
  PVector c1 = circles[i];
  PVector c2 = circles[j];
  return sqrt((c1.x-c2.x)*(c1.x-c2.x)+(c1.y-c2.y)*(c1.y-c2.y)) < 2*radius;
}

void draw() {
  background(255);
  for (int i = 0; i < CIRCLES; i++) {
    move(i);
    infect(i);
    if (stats[i][2] == 1 && random(1) < 0.008)
      stats[i][2]++; 
    int state = stats[i][2];
    fill(state == 0 ? color(25, 25, 200) : state == 1 ? color(200, 25, 25) : color(200, 25, 25, 100));
    circle(circles[i].x, circles[i].y, radius);
  }

  if (allInfected()) {
    noLoop();
    println("DONE!");
  }
}
