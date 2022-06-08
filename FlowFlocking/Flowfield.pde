class Flowfield {

  int scl = 20;

  int cols, rows;

  PVector flows[][];


  Flowfield() {
    cols = width/scl;
    rows = height / scl;
    flows = new PVector[cols][rows];
    update();
  }

  float time = 0;
  float timeInc = 0.001;
  float inc = 0.05;

  float noiseRadius = 0.5;

  void update() {

    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      // float xoff = map(i, 0, cols, 0, TWO_PI);
      for (int j = 0; j < rows; j++) {
        // float yoff = map(j, 0, rows, 0, TWO_PI);
        // float r =(float) OpenSimplex2S.noise4_ImproveXY_ImproveZW(0, noiseRadius * sin(xoff), noiseRadius* cos(xoff), noiseRadius * sin(yoff), noiseRadius* cos(yoff));
        // in order to have to borders match up, we need 5D noise: noise5D(r sin x, r cos x, r sin y, r cos y, time)
        float r = noise(xoff, yoff, time);
        // float theta = map(r, -1, 1, 0, TWO_PI);
        float theta = map(r, 0, 1, 0, TWO_PI);
        PVector v = PVector.fromAngle(theta);
        v.normalize();
        flows[i][j] = v;
        yoff+= inc;
      }
      xoff+= inc;
    }
    time += timeInc;
  }


  void printField() {
    //stroke(0);
    colorMode(HSB);
    strokeWeight(1);
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        PVector v = flows[i][j];
        float h = map(v.heading(), -PI, PI, 0, 255);
        stroke(h, 255, 255, 100);
        pushMatrix();
        translate(i*scl + scl*0.5, j * scl + scl*0.5);
        rotate(v.heading());
        line(scl*-0.5, 0, scl*0.5, 0);
        popMatrix();
      }
    }
  }
}
