public enum DIRECTION {
  LEFT(1), RIGHT(1), TOP(2), BOTTOM(3);

  private int value;

  private DIRECTION(int val) {
    this.value = val;
  }
  int getValue() {
    return this.value;
  }
}


class Cell {

  boolean walls[];

  private int i, j, space;

  private boolean visited;
  private int score;
  private Cell prev;

  public Cell(int i, int j, int space, float prob) {
    this.i = i;
    this.j = j;
    this.space = space;
    walls = new boolean[4];

    visited =false;
    score = 99999;

    for (int counter = 0; counter < walls.length; counter++) {
      walls[counter] = random(1) < prob;
    }
  }

  void setVisited(boolean flag) {
    this.visited =flag;
  }

  void setScore(int newScore) {
    this.score = newScore;
  }

  int getScore() {
    return score;
  }
  
  Cell getPrev(){
  return prev;
}

void setPrev(Cell c){
this.prev = c;}

  void show() {
    show(color(51));
  }
  
  void show(color c) {
    noStroke();
    fill(c);
    rect(i*space, j*space, space, space);

    stroke(255);
    if (walls[DIRECTION.BOTTOM.getValue()]) {
      line(i*space, j*space + space, i*space + space, j*space + space);
    }
    if (walls[DIRECTION.TOP.getValue()]) {
      line(i*space, j*space, i*space + space, j*space);
    }

    if (walls[DIRECTION.LEFT.getValue()]) {
      line(i*space, j*space, i*space, j*space + space);
    }

    if (walls[DIRECTION.RIGHT.getValue()]) {
      line(i*space + space, j*space, i*space + space, j*space +space);
    }
    //  text(j, i*space+space/2, j*space + space/2);
  }


  ArrayList<Cell> getNeighbours(Maze m) {
    ArrayList<Cell> neighbours = new ArrayList<>();
    if (j > 0 && !walls[DIRECTION.TOP.getValue()])
      neighbours.add(m.getMaze()[this.i][this.j-1]);

    if (j < m.getMaze().length-1 && !walls[DIRECTION.BOTTOM.getValue()])
      neighbours.add(m.getMaze()[this.i][this.j+1]);

    if (i> 0 && !walls[DIRECTION.LEFT.getValue()])
      neighbours.add(m.getMaze()[this.i-1][this.j]);
    if (i < m.getMaze()[0].length-1 && !walls[DIRECTION.RIGHT.getValue()])
      neighbours.add(m.getMaze()[this.i+1][this.j]);


    return neighbours;
  }

  void print() {
    println("i: " + i + "; j: " + j);
  }
}
