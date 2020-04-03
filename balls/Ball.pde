class Ball{
  float x, y;
  float xSpeed, ySpeed;
  int rad;
  boolean dragged = false;
  color col;
  
  Ball(int startX, int startY, int rad, float xSpeed, float ySpeed, color col){
    this.x = startX;
    this.y = startY;
    this.rad = rad;
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
    this.col = col;
  }
  
  void move(){
    
    if(x < rad){
      x = rad;
      xSpeed *= -0.8;
      //col = color((int)random(50,255), (int)random(50,255), (int)random(50,255));
    }
    if(y < rad){
      y = rad;
      ySpeed *= -0.8;
      xSpeed *= 0.95;
      //col = color((int)random(50,255), (int)random(50,255), (int)random(50,255));
    }
    if(x > width-rad){
      x = width-rad;
      xSpeed *= -0.8;
      //col = color((int)random(50,255), (int)random(50,255), (int)random(50,255));
    }
    if(y > height-rad){
      y = height-rad;
      ySpeed *= -0.8;
      xSpeed *= 0.95;
      //col = color((int)random(50,255), (int)random(50,255), (int)random(50,255));
    }
    ySpeed += 0.5;
    
    if(dragged){
      this.xSpeed = mouseX-this.x;
      this.ySpeed = mouseY-this.y;
    }
    x += xSpeed;
    y += ySpeed;
  }
  
  void show(){
    fill(col);
    ellipse(x, y, 2*rad, 2*rad);
  }
}
