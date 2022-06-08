


String pick;

int iter;
int letterIndex;
void setup(){

 String [] lines = loadStrings("words.txt");

  pick = lines[(int)(Math.random()*lines.length)];

  iter = 0;
  letterIndex = 0;
}

void draw() {
   
}

void keyPressed(){
  println(key);
}
