float theta = 0;
float deltaTheta = 0.02;

float r ;
ArrayList<Float> vals;

float coordZeroX ;
float coordZeroY ;
float newWavePointX;

float circleX;
float circleY ;

float minCoordVal = -PI/4;

void setup() {
  size(2000, 1000);
  coordZeroX = width/2;
  coordZeroY = height/2;
  newWavePointX =width - width/6;
  circleX = width/4;
  circleY = height/2;
  r = height/2;
  vals = new ArrayList<>();
}
int counter = 0;
void draw() {
  background(51);
  fill(255);
  noStroke();
  ellipse(circleX, circleY, r, r);
  fill(0, 0, 255);

  arc(circleX, circleY, r, r, TWO_PI-theta, TWO_PI);

  // coordsystem
  stroke(255);
  strokeWeight(2);
  line(coordZeroX-10, coordZeroY, newWavePointX+10, coordZeroY);
  line(coordZeroX, coordZeroY-r/2-10, coordZeroX, coordZeroY + r/2 + 10);
  strokeWeight(1);
  line(coordZeroX-5, coordZeroY-r/2, coordZeroX+5, coordZeroY-r/2);
  line(coordZeroX-5, coordZeroY+r/2, coordZeroX+5, coordZeroY+r/2);
  line(newWavePointX, coordZeroY-5, newWavePointX, coordZeroY +5);
  fill(255);
  textAlign(CENTER, CENTER);
  text(theta, newWavePointX, coordZeroY-10);
  text(1, coordZeroX-10, coordZeroY-r/2);
  text(-1, coordZeroX-10, coordZeroY+r/2);




  float x = circleX + cos(theta)*r/2;
  float y = circleY - sin(theta)*r/2;
  strokeWeight(1);
  stroke(255, 0, 0);
  line(x, y, newWavePointX, y);
  vals.add(y);


  stroke(255, 50, 50);
  noFill();
  beginShape();
  int i;
  for (i= vals.size()-1; i>= 0; i--) {
    float pInc = (vals.size()-1 - i)*deltaTheta;
    float f = TWO_PI-pInc;
    if (f < minCoordVal) {
      vals.subList(0, i).clear();
      break;
    }
    float pX = map(f, 0, TWO_PI, coordZeroX, newWavePointX);
    vertex(pX, vals.get(i));
  }
  endShape();


  theta += deltaTheta;
  theta %= TWO_PI;
  if (theta < deltaTheta) {
    counter++;
    if (counter >1) {
      noLoop();
      return;
    }
  }
  if (counter ==1) {
    //saveFrame("frames/img####.png");
  }
}
