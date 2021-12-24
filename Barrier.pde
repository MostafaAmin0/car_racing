public class Barrier{
  
  float top_x,top_y;
  float w, h;
  
  public Barrier(float x,float y,float w,float h){
    top_x=x;
    top_y=y;
    this.w=w;
    this.h=h;
  }
  
  void display(){
    noStroke();
    fill(0,0,0,0);
    rect(top_x, top_y,w,h);
  }
  
  float getBottom(){
    return top_y + h;
  }
  float getTop(){
    return top_y;
  }
  float getRight(){
    return top_x + w;
  }
  float getLeft(){
    return top_x ;
  } 
}
