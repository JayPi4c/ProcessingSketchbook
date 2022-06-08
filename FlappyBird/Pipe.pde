public class Pipe {
  color c;
  float x, y;
  final float WIDTH = 20;
  float y_top, y_bottom;

  float space = 80;

  float speed = -2;

  public Pipe() {
    x = width +WIDTH;
    //x = width/2;
    y_top = random(20, height - 20 - space);
    y_bottom = y_top + space;
    c = color(random(255), random(255), random(255));
  }

  void show() {
    fill(c);
    rect(x, 0, WIDTH, y_top);
    rect(x, y_bottom, WIDTH, height - y_bottom);
  }

  void update() {
    x+= speed;
  }
  
  boolean intersects(Bird b) {
    if (b.getX() > x && b.getX() < x + WIDTH) {
      if (b.getY() < y_top || b.getY() > y_bottom)
        return true;
    }

    return false;
  }
   boolean isOffScreen() {
    return(x + WIDTH < 0);
  }
}
