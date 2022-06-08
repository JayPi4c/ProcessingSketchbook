// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/IKB1hWWedMk

// use the following command to shrink the filesize created by this sketch
// ffmpeg -i input.avi -c:v libx264 -crf 18 -preset veryslow -c:a copy out.mp4
// https://superuser.com/a/933310

// create gif: https://superuser.com/a/1107201
// gifsicle -i anim.gif -O3 --colors 256 -o anim-opt.gif


int cols, rows;
int scl = 20;
int w = 1600;
int h = 1600;

float flying = 0;

float[][] terrain;

float minHeight = -25;

OpenSimplexNoise noise;

void setup() {
  // fullScreen(P3D);
  size(600, 600, P3D);

  noise = new OpenSimplexNoise((long)random(100000));

  cols = w/scl;
  rows = h /scl;
  terrain = new float[cols][rows];

  // frameRate(30);
}

float inc = 0.06;
float delta_theta = 0.02;
float startValue = cols*inc;
float theta = startValue;
float r = 10;

void draw() {

  float temp = theta;
  for (int j = 0; j < rows; j++) {

    for (int i = 0; i < cols; i++) {

      float n = (float)noise.eval(i*inc, sin(temp)*r, cos(temp)*r);

      float val = map(n, -1, 1, -100, 150);
      terrain[i][j] = val > minHeight ? val : minHeight;
    }
    temp-= delta_theta;
  }
  theta+=delta_theta;

  if (theta >= TWO_PI) {
    theta = 0;
    println("Done with loop!");
  }
  if (theta == startValue) {
    noLoop();
  }

  background(0);
  noFill();

  noStroke();
  translate(width/2, height /2 + 50);
  rotateX(PI/3);
  translate(-w/2, -h/2);

  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      float val = terrain[x][y];
      //stroke(minHeight == val ? color(0, 47, 100) :val < 100 ? color(22, 185, 30)  :255);
      stroke(255);
      vertex(x*scl, y*scl, val);
      val = terrain[x][y+1];
      // stroke(minHeight == val ? color(0, 47, 100) :val < 100 ? color(22, 185, 30)  :255);
      stroke(255);
      vertex(x*scl, (y+1)*scl, val);
    }
    endShape();
  }
  // saveFrame("frames/img####.png");
  // println(frameRate);
}
