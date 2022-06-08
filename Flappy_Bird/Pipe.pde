class Pipe {

  float x;
  final float WIDTH = 25;
  float y_top;
  float y_bottom;

  float space = 80;

  float speed = -2;

  public Pipe() {
    x = width +WIDTH;
    y_top = random(20, height - 20 - space);
    y_bottom = y_top + space;
  }

  void show() {
    fill(0, 0, 255);
    rect(x, 0, WIDTH, y_top);
    rect(x, y_bottom, WIDTH, height - y_bottom);
  }

  void update() {
    x += speed;
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
