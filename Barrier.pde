public class Barrier{
  
  float center_x, center_y,top_x,top_y;
  float w, h;
  
  public Barrier(float x,float y,float w,float h){
    top_x=x;
    top_y=y;
    this.w=w;
    this.h=h;
    center_x=x+w/2;
    center_y=y+h/2;
  }
  
  void display(){
    rect(top_x, top_y,w,h);
  }
  
  float getBottom(){
    return center_y + h/2;
  }
  float getTop(){
    return center_y - h/2;
  }
  float getRight(){
    return center_x + w/2;
  }
  float getLeft(){
    return center_x - w/2;
  }
    
}
