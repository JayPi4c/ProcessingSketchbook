OpenSimplexNoise noise;

void setup() {

  //noise = new OpenSimplexNoise(1);
  noise = new OpenSimpleyNoise();
  size(590, 300);
}

float r = 0;
void draw() {
  noLoop();
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    // float a = map(r, 0, pixels.length, 0, TWO_PI);
    int x = i% width;
    int y = i/ width;
    float n = (float)noise.eval(x/100f, y/100f, (sin(r)+1)*5, (cos(r)+1)*5);
    //println("x: " + x + ", y: " + y + " noise: " + n);
    int col = (int)map(n, 0, 1, 0, 255);
    pixels[i]= color(col, col, col);
  }
  updatePixels();
  // println("Done");
  
 // saveFrame("twitterBackground/arduino.png");
  //noLoop();
  r+=0.01;
  //r%= TWO_PI;
  if (r >= TWO_PI) {
    r = 0;
    println("Done with iteration");
    noLoop();
  }
 //   saveFrame("frames/img####.png");
// saveFrame("twitterBackground/img##.png");
}
