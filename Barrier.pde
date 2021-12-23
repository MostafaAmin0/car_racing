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
    noStroke();
    fill(0,0,0,0);
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
  
   ////takes a pvector and sees if its within this barrier, ie a crash
   //  boolean contains(PVector p){
   //      if(p.x>top_x && p.x<top_x+w && p.y>top_y && p.y< top_y+h){
   //         return true; 
   //      }
   //      return false;
   //  }
   //  //ambitious little method here that will check all four corners of a rectangle (our car) 
   //  //to see if that point is contained within the obstacle to detect a collision
   //  boolean contains(PVector p, float width, float height, float direction){
        
   //        //first corner
   //        //set square middle to origin        
   //        float corner1x = (p.x+width/2)-p.x;
   //        float corner1y = (p.y+height/2)-p.y;
            
   //         // now apply rotation
   //         float rotatedX = corner1x*cos(radians(360-direction)) - corner1y*sin(radians(360-direction));
   //         float rotatedY = corner1x*sin(radians(360-direction)) + corner1y*cos(radians(360-direction));
   //         // translate back
   //         float xx = rotatedX + (p.x);
   //         float yy = rotatedY + (p.y);
             
   //          if(xx>top_x && xx< top_x+w && yy>top_y && yy<top_y+h){
   //              return true;
   //          }
             
   //          //second corner
   //           //set square middle to origin        
   //         corner1x = (p.x-width/2)-p.x;
   //         corner1y = (p.y-height/2)-p.y;
            
   //         // now apply rotation
   //          rotatedX = corner1x*cos(radians(360-direction)) - corner1y*sin(radians(360-direction));
   //          rotatedY = corner1x*sin(radians(360-direction)) + corner1y*cos(radians(360-direction));
   //         // translate back
   //          xx = rotatedX + (p.x);
   //          yy = rotatedY + (p.y);
             
   //          if(xx>top_x && xx< top_x+w && yy>top_y && yy<top_y+h){
   //              return true;
   //          }
            
   //         //third
   //          //set square middle to origin        
   //         corner1x = (p.x-width/2)-p.x;
   //         corner1y = (p.y+height/2)-p.y;
            
   //         // now apply rotation
   //          rotatedX = corner1x*cos(radians(360-direction)) - corner1y*sin(radians(360-direction));
   //          rotatedY = corner1x*sin(radians(360-direction)) + corner1y*cos(radians(360-direction));
   //         // translate back
   //          xx = rotatedX + (p.x);
   //          yy = rotatedY + (p.y);
             
   //          if(xx>top_x && xx< top_x+w && yy>top_y && yy<top_y+h){
   //              return true;
   //          }
             
   //          //fourth
   //           //set square middle to origin        
   //         corner1x = (p.x+width/2)-p.x;
   //         corner1y = (p.y-height/2)-p.y;
            
   //         // now apply rotation
   //          rotatedX = corner1x*cos(radians(360-direction)) - corner1y*sin(radians(360-direction));
   //          rotatedY = corner1x*sin(radians(360-direction)) + corner1y*cos(radians(360-direction));
   //         // translate back
   //          xx = rotatedX + (p.x);
   //          yy = rotatedY + (p.y);
             
   //          if(xx>top_x && xx< top_x+w && yy>top_y && yy<top_y+h){
   //              return true;
   //          }
             
   //          //going to check middle of sides as well
             
   //          //fifth
   //          //fourth
   //           //set square middle to origin        
   //         corner1x = (p.x+width/2)-p.x;
   //         corner1y = p.y-p.y;
            
   //         // now apply rotation
   //          rotatedX = corner1x*cos(radians(360-direction)) - corner1y*sin(radians(360-direction));
   //          rotatedY = corner1x*sin(radians(360-direction)) + corner1y*cos(radians(360-direction));
   //         // translate back
   //          xx = rotatedX + (p.x);
   //          yy = rotatedY + (p.y);
             
   //          if(xx>top_x && xx< top_x+w && yy>top_y && yy<top_y+h){
   //              return true;
   //          }
             
   //          //sixth
            
   //           //set square middle to origin        
   //         corner1x = (p.x-width/2)-p.x;
   //         corner1y = p.y-p.y;
            
   //         // now apply rotation
   //          rotatedX = corner1x*cos(radians(360-direction)) - corner1y*sin(radians(360-direction));
   //          rotatedY = corner1x*sin(radians(360-direction)) + corner1y*cos(radians(360-direction));
   //         // translate back
   //          xx = rotatedX + (p.x);
   //          yy = rotatedY + (p.y);
             
   //          if(xx>top_x && xx< top_x+w && yy>top_y && yy<top_y+h){
   //              return true;
   //          }
             
             
   //      return false;
   //  }
    
}
