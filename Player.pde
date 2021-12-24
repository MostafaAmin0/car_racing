
public class Player{
  PImage image;
  float center_x, center_y;
  float speed;
  float max_speed = 4;
  float w, h;
  float direction;
  
  public Player(String filename, float scale, float x, float y){
    image = loadImage(filename);
    w = image.width * scale;
    h = image.height * scale;
    center_x = x;
    center_y = y;
    direction=radians(90);
    speed=0;
  }
  public Player(String filename, float scale){
    this(filename, scale, 0, 0);
  }
  public Player(PImage img, float scale){
    image = img;
    w = image.width * scale;
    h = image.height * scale;
    center_x = 0;
    center_y = 0;
  }
  public void display(){
    pushMatrix();
    imageMode(CENTER);
   translate(center_x,center_y);
   rotate(direction);
   translate(-center_x,-center_y);
   image(image, center_x, center_y, w, h); 
   popMatrix();
  }     
  public void update(){
     center_x =center_x + (speed * cos(direction));
     center_y =center_y + (speed * sin(direction));
  }
  
  public void turnRight(){  
    if(speed>0){
      direction = direction + 1/ (3+(speed));
    }else{
      direction = direction + 1/ (3-(speed));
    }
    direction %= radians(360);
  }
  
  public void turnLeft(){
    if(speed>0){
      direction = direction - 1/ (3+(speed));
    }else{
      direction = direction - 1/ (3-(speed));
    }
    direction %= radians(360);
    
  }
  
  public void up(){
    if (speed<-0.5) {
      speed = 0;
    }
    else if (speed < max_speed){
      speed += 1;    
    }
  }
  
  public void down(){
    if (speed>3) {
      speed = 1;
    }
    if(speed > -max_speed){
      speed -= 0.4;
    }
  }
  
  void setLeft(float left){
    center_x = left + h/2;
  }
  float getLeft(){
    return center_x - h/2;
  }
  void setRight(float right){
    center_x = right - h/2;
  }
  float getRight(){
    return center_x + h/2;
  }
  void setTop(float top){
    center_y = top + h/2;
  }
  float getTop(){
    return center_y - h/2;
  }
  void setBottom(float bottom){
    center_y = bottom - h/2;
  }
  float getBottom(){
    return center_y + h/2;
  }

  
}
