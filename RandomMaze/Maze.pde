class Maze {
  int space;
  Cell[][] maze;
  int w, h;
  Maze (int space) {
    this.space = space;
    w = width/ space;
    h = height / space;
    maze = new Cell[w][h];
    for (int i = 0; i < w; i++) {
      for (int j = 0; j < h; j++) {

        maze[i][j] = new Cell(i, j, space, 0.25);
      }
    }
  }


  void show() {
    for (int i = 0; i < w; i++) {
      for (int j = 0; j < h; j++) {

        maze[i][j].show();
      }
    }
  }

  Cell[][] getMaze() {
    return this.maze;
  }

  ArrayList<Cell> solve() {

    boolean done = false;
    maze[w/2][0].setScore(0);
    
     
    
    ArrayList<Cell> openSet = new ArrayList<>();
    openSet.add(maze[w/2][0]);
    Cell current= null ;
    while (!done) {
      current = openSet.remove(0);
      
      current.setVisited(true);
      ArrayList<Cell> nextCells = current.getNeighbours(this);
      for (Cell c : nextCells) {
        if (current.getScore() + 1 < c.getScore()) {
          c.setScore( current.getScore() + 1 );
          c.setPrev(current);
        }

        if (!c.visited && !openSet.contains(c))
          openSet.add(c);
          
        //  println(current.i +" " + current.j);
      }
      if (current.j == h-5)//maze[0].length-1)
        done = true;
    }
println("done");



    ArrayList<Cell> path = new ArrayList<>();
path.add(current);
    while (current.getPrev()!= null) {
      path.add(current.prev);
      current = current.prev;
      for(Cell c: current.getNeighbours(m)){
  c.print();}
  println();
    }

    return path;
  }
}
