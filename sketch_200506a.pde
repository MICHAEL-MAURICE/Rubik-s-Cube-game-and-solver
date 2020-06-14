import peasy.*;

PeasyCam cam;

int dim = 3;
Cubie[] cube = new Cubie[dim*dim*dim];

String[] allMoves = {"f", "b", "u", "d", "l", "r"};
String sequence = "";
int counter = 0;
String nextMove=" ";
String moves="";

String moving_cuibe="";

boolean started = false;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 400);
  int index = 0;
  for (int x = -1; x <= 1; x++) {
    for (int y = -1; y <= 1; y++) {
      for (int z = -1; z <= 1; z++) {
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        cube[index] = new Cubie(matrix, x, y, z);
        index++;
      }
    }
  }
}

void rev(){

for (int i = sequence.length()-1; i >= 0; i--) {
    nextMove = flipCase(sequence.charAt(i));
    moving_cuibe += nextMove;
    println(moving_cuibe);
  }
}
String flipCase(char c) {
  String s = "" + c;
  if (s.equals(s.toLowerCase())) {
    return s.toUpperCase();
  } else {
    return s.toLowerCase();
  }
}

void Put(int c){
sequence += allMoves[c];
      moves+=allMoves[c];
      
println(sequence);

}


void turnZ(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Cubie qb = cube[i];
    if (qb.z == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.x, qb.y);
      qb.update(round(matrix.m02), round(matrix.m12), round(qb.z));
      qb.turnFacesZ(dir);
    }
  }
}

void turnY(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Cubie qb = cube[i];
    if (qb.y == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.x, qb.z);
      qb.update(round(matrix.m02), qb.y, round(matrix.m12));
      qb.turnFacesY(dir);
    }
  }
}

void turnX(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Cubie qb = cube[i];
    if (qb.x == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.y, qb.z);
      qb.update(qb.x, round(matrix.m02), round(matrix.m12));
      qb.turnFacesX(dir);
    }
  }
}




void draw() {
  background(51); 
  
  if (started) {
    if (frameCount % 3 == 0) {
      if (counter < moving_cuibe.length()) {
        char move = moving_cuibe.charAt(counter);
        applyMove(move);
        counter++;
      }
    }
  }

  scale(50);
  for (int i = 0; i < cube.length; i++) {
    cube[i].show();
  }
}
