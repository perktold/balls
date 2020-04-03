ArrayList<Ball> balls = new ArrayList<Ball>();
int createBallStartX, createBallStartY;
color createBallColor;
boolean mousePressedLastFrame = false;
boolean draggingBall = false;


void setup(){
  fullScreen();
  noStroke();
}

void draw(){
  background(0);
  for(Ball b : balls){
    b.move();
    b.show();
  }
  if(mousePressed && !draggingBall){
    createBall();
  }
}

void mousePressed(){
  createBallStartX = mouseX;
  createBallStartY = mouseY;
  createBallColor = color((int)random(50,255), (int)random(50,255), (int)random(50,255));
  for(Ball b : balls){
    if(dist(mouseX, mouseY, b.x, b.y) < b.rad){
       b.dragged = true;
       draggingBall = true;
    }
  }  
}
void createBall(){
  fill(createBallColor);
  float rad = dist(createBallStartX, createBallStartY, mouseX, mouseY);
  ellipse((mouseX+createBallStartX)/2, (mouseY+createBallStartY)/2, rad, rad);
}
void mouseReleased(){
  if(!draggingBall){
    balls.add(new Ball((mouseX+createBallStartX)/2, (mouseY+createBallStartY)/2, (int)dist(createBallStartX, createBallStartY, mouseX, mouseY)/2, 0, 0, createBallColor)); 
  }
  for(Ball b : balls){
    b.dragged = false;
  }  
  draggingBall = false;
}
