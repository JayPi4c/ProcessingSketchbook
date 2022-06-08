Maze m;

void setup() {
  size(800, 800);
  m = new Maze(25);
  
 
  frameRate(1);
}

void draw() {
  background(51);
  m.show();
  
  for(Cell c : m.solve()){
  c.show(color(0, 0, 255));
  }
}
