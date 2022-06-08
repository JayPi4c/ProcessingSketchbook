OpenSimplexNoise noise;
float delta_theta = 0.01;
float theta;
float r = 10;

float startValue;
void setup() {

  noise = new OpenSimplexNoise();

  size(400, 400);
  theta = startValue= height*delta_theta;
}

void draw() {//
  loadPixels();

  float temp = theta;
  for (int j = 0; j < height; j++) {

    for (int i = 0; i < width; i++) {

      float n = (float)noise.eval(i*0.05, sin(temp)*r, cos(temp)*r);
      pixels[j*width+i]= color((int)(map(n, 0, 1, 0, 255)));
    }
    temp-= delta_theta;
  }


  updatePixels();
  theta+=delta_theta;



  // println("Done");
  // noLoop();

  //r%= TWO_PI;
  if (theta >= TWO_PI) {
    theta = 0;
  }
  if (theta == startValue)
  {
    noLoop();
    println("Done with loop");
  }

  // saveFrame("frames/img####.png");
}

/*
float r = 0;
 void draw() {//
 loadPixels();
 for (int i = 0; i < pixels.length; i++) {
 // float a = map(r, 0, pixels.length, 0, TWO_PI);
 int x = i% width;
 int y = i/ width;
 float n = (float)noise.eval(x*(sin(r)+1)/100f, y*(cos(r)+1)/100f);
 //println("x: " + x + ", y: " + y + " noise: " + n);
 int col = (int)map(n, 0, 1, 0, 255);
 pixels[i]= color(col, col, col);
 }
 updatePixels();
 // println("Done");
 //noLoop();
 r+=0.01;
 //r%= TWO_PI;
 if (r >= TWO_PI) {
 r = 0;
 println("Done with iteration");
 noLoop();
 }
 //saveFrame("frames/img####.png");
 }*/
