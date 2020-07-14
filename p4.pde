char[][] plateau = new char[12][13];
boolean gameOver = false;

char token = 'O';

void setup() {
  size(900, 600);
  textSize(30);
  initialize();
}

void draw() {
}

void mouseClicked() {
  if (!gameOver && mouseX<=700) {
    int yPos = placeToken(mouseX/100 +1);
    if (yPos != -1) checkWin(yPos, mouseX/100 +3);
  } else if (mouseX>750 && mouseX<860 && mouseY>500 && mouseY<550) {
    initialize();
  }
}

void initialize() {

  // reset game properties
  gameOver = false;
  clearTable(); 

  // clear screen
  background(150);
  drawTable();

  fill(255, 0, 0); // red
  rect(750, 500, 110, 50);
  fill(255); // white
  text("Restart", 755, 535);
}

int placeToken(int x) {
  for (int i=0; i<6; i++) {
    if (plateau[8-i][x+2] == '\u0000') {
      plateau[8-i][x+2] = token;
      if (token == 'O') {
        fill(255, 255, 0); 
        token = 'X';
      } else { 
        fill(255, 0, 0); 
        token = 'O';
      }
      ellipse(50+(x-1)*100, 50+(8-i-3)*100, 80, 80) ;
      return 8-i;
    }
  }
  return -1;
}

void checkWin(int y, int x) {
  String h = " ";
  String v = " ";
  String d1 = " ";
  String d2 = " ";

  for (int i=-3; i<=3; i++) {
    h+= plateau[y][x+i];
    v+= plateau[y+i][x];
    d1+= plateau[y+i][x+i];
    d2+= plateau[y-i][x+i];
  }  

  if ( (h+v+d1+d2).contains("OOOO") ) {
    text("Yellow wins", 715, 100); 
    gameOver = true;
  }
  if ( (h+v+d1+d2).contains("XXXX") ) {
    text("Red wins", 735, 100); 
    gameOver = true;
  }
}

void clearTable() {
  for (int j=3; j<9; j++) {
    for (int i=3; i<10; i++) {
      plateau[j][i] = '\u0000';
    }
  }
}

void drawTable() {
  fill(255, 226, 147);
  rect(0, 0, 700, 600);
  fill(150);
  for ( int i=0; i<7; i++) {
    for (int j=0; j<6; j++) {
      ellipse(i*100 + 50, j*100 + 50, 80, 80);
    }
  }
}