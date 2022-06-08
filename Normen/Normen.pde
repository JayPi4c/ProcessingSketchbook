void setup() {
  size(400, 400);
  background(51);
  strokeWeight(1);
  stroke(255);
  fill(255);
}

float XminVal = -5;
float XmaxVal = 5;

float YminVal = -10;
float YmaxVal = 10;

float inc = 0.01;
float x1 = XminVal;
float x2 = YminVal;
float a1 = 1/4f;
float a2 = 1/9f;




void draw() {
  for (int i = 0; i < 10000; i++) {
    if (euclideanNorm() < 1)
    {
      float x = map(x1, XminVal, XmaxVal, 0, width);
      float y = map(x2, YminVal, YmaxVal, height, 0);
      point(x, y);
    }
    // println("x1: " + x1 + "; x2: " + x2);

    if (x1 >= XmaxVal && x2 >= YmaxVal) {
      noLoop();
      println("done");
      break;
    }
  }
}
float euclideanNorm() {
  float val = max(a1*abs(x1), a2*abs(x2));
  x1+=inc;
  if (x1 > XmaxVal) {
    x1 = XminVal;
    x2 +=inc;
    if (x2 >YmaxVal)
      x2 = YminVal;
  }
  return val;
}
