void keyPressed() {
  if (key == ' ') {
    //solve();
    rev();
    started = true; 
    sequence="";
  }
  
  switch (key) {
  case 'f': 
    turnZ(1, 1);
    Put(0);
    break;
  case 'F': 
    turnZ(1, -1);
    break;  
  case 'b': 
    turnZ(-1, 1);
    Put(1);
    break;
  case 'B': 
    turnZ(-1, -1);
    break;
  case 'u': 
    turnY(1, 1);
    Put(2);
    break;
  case 'U': 
    turnY(1, -1);
    break;
  case 'd': 
    turnY(-1, 1);
    Put(3);
    break;
  case 'D': 
    turnY(-1, -1);
    break;
  case 'l': 
    turnX(-1, 1);
    Put(4);
    break;
  case 'L': 
    turnX(-1, -1);
    break;
  case 'r': 
    turnX(1, 1);
    Put(5);
    break;
  case 'R': 
    turnX(1, -1);
    break;
  }
  // applyMove(key); 
}

void applyMove(char move) {
  switch (move) {
  case 'f': 
    turnZ(1, 1);
    break;
  case 'F': 
    turnZ(1, -1);
    break;  
  case 'b': 
    turnZ(-1, 1);
    break;
  case 'B': 
    turnZ(-1, -1);
    break;
  case 'u': 
    turnY(1, 1);
    break;
  case 'U': 
    turnY(1, -1);
    break;
  case 'd': 
    turnY(-1, 1);
    break;
  case 'D': 
    turnY(-1, -1);
    break;
  case 'l': 
    turnX(-1, 1);
    break;
  case 'L': 
    turnX(-1, -1);
    break;
  case 'r': 
    turnX(1, 1);
    break;
  case 'R': 
    turnX(1, -1);
    break;
  }
}
