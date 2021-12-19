
public class Player{
  PImage image;
  float center_x, center_y;
  float change_x, change_y;
  float w, h;
  float direction;
  public Player(String filename, float scale, float x, float y){
    image = loadImage(filename);
    w = image.width * scale;
    h = image.height * scale;
    center_x = x;
    center_y = y;
    change_x = 0;
    change_y = 0;
    direction=radians(90);
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
    change_x = 0;
    change_y = 0;
  }
  public void display(){
    pushMatrix();
   translate(center_x,center_y);
   rotate(direction);
   translate(-center_x,-center_y);
   image(image, center_x, center_y, w, h); 
   popMatrix();
  }     
  public void update(){
     center_x += change_x;
     center_y += change_y;
  }
  
  public void turnRight(){
      //direction += 1/change_x;
      //direction %= radians(360);  
      //println(direction * 180 / PI);
      
    if (direction >= radians(270) || direction <= radians(90)){
      println("alo");
      
      if(direction >= radians(340) || direction <= radians(20)){
        direction = radians(0);
      }else if (direction > radians(20) && direction<=radians(90)){
        direction -= 1/change_x;
        direction %= radians(360); 
      }else if (direction < radians(340) && direction >=radians(270)){
        direction += 1/change_x;
        direction %= radians(360); 
      }  
      
    }
    else {
      direction += 1/change_x;
      direction %= radians(360); 
    }  
      
    //if (direction >= radians(0) && direction <= radians(25)){
    //  direction=radians(0);
    //  println("alo");
    //}else {
    //  direction += 1/change_x;
    //  direction %= radians(360); 
    //}
    
    //else if(direction > radians(10) && direction <= radians(180) ){
    //  direction += 1/change_x;
    //  direction %= radians(360);
    //}
    //else if (direction > radians(180) && direction < radians(350)){
    //  direction -= 1/change_x;
    //  direction %= radians(360);
    //}
  }
  public void turnLeft(){
    direction -= 1/change_x;
  }
  public void up(){
    //direction -= 1/change_x;
  }
  public void down(){
    //direction =0;
  }
  
  void setLeft(float left){
    center_x = left + w/2;
  }
  float getLeft(){
    return center_x - w/2;
  }
  void setRight(float right){
    center_x = right - w/2;
  }
  float getRight(){
    return center_x + w/2;
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
