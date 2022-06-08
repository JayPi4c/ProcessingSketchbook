int arr[];

int i;
int index = 0;
boolean swapped = false;
int WIDTH = 5;//10;
final int COUNT = 128;
void setup() {
  size(640, 480);
  arr = new int[COUNT];
  WIDTH = width/COUNT;
  for (int i = 0; i < arr.length; i++) {
    arr[i] =(int) map(i, 0, arr.length, 0, height);
  }
  i = arr.length-1;
  shuffle(arr, arr.length);
  // bubblesort(arr);
  noStroke();
}

void shuffle(int array[], int swaps){
  for(int j  = 0; j < swaps; j++){
    int r = (int)random(array.length);
    int r1 = (int)random(array.length);
    swap(array, r, r1);
  }
}


void bubblesort(int array[]) {
  for (int i = array.length-1; i>= 0; i-- ) {
    int index = 0;
    boolean swapped = false;
    while (index < i) {
      if (array[index] > array[index+1]) {
        swap(array, index, index+1);
        swapped = true;
      }
      index++;
    }
    if (!swapped)
      return;
  }
}

void swap(int array[], int i, int j) {
  int tmp = array[i];
  array[i] = array[j];
  array[j] = tmp;
}

void draw() {
  background(51);

  if (arr[index] > arr[index+1]) {
    swap(arr, index, index+1);
    swapped = true;
  }
  index++;
  if (index >= i) {
    if (!swapped){
      noLoop();
    }
    swapped = false;
    index = 0;
    i--;
  }
  if (i < 0) {
    noLoop();
  }


  for (int j = 0; j  < arr.length; j++) {
    if (j == index)
      fill(255, 0, 0);
    else
      fill(255);


    rect(j*WIDTH, height-arr[j], WIDTH, arr[j]);
  }
}
