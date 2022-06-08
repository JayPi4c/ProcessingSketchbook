
import java.util.*;
int mI=0, mJ=0;
int numCols = 10;
int numRows = numCols;
int w, h;

void setup() {
  size(400, 400);
  w = width/ numCols;
  h = height/ numRows;
  
}

void draw() {
  background(0);
  stroke(0);
  strokeWeight(1);
  boolean availablePlaces[][] = getAvailablePlaces(mI, mJ, 4);
  for (int i = 0; i < numRows; i++) {
    for (int j = 0; j < numCols; j++) {
      if (availablePlaces[i][j])
        fill(20, 200, 20);
      else
        fill(200, 20, 20);
      rect(i*w, j*h, w, h);
    }
  }
}

public boolean[][] getAvailablePlaces(int row, int col, int steps) {
  boolean[][] availablePlaces = new boolean[numRows][numCols];
  for (boolean[] bs : availablePlaces) {
    Arrays.fill(bs, false);
  }

  
  
  for (int i = 0; i <= steps; i++) {
    for (int j = 0; j <= steps-i; j++) {
      if (i == 0 && j == 0) continue;
      for(int is = -1; is<=1; is+=2){
      for(int js = -1; js<=1; js+=2){
        int finalI = i*is;
        int finalJ = j *js;
      if (isViablePlace(row + finalI, col + finalJ)) availablePlaces[row + finalI][col + finalJ] = true;
    }}}
  }


  return availablePlaces;
}

private boolean isViablePlace(int row, int col) {
  return row < numRows && row >= 0 && col <numCols && col >= 0;
}

void mouseClicked(){
  mI = mouseX/w;
  mJ = mouseY/h;
}
