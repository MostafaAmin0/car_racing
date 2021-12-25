
public class Coin extends Player{
    PImage[] currentImages;
    int index;
    int frame;

  public Coin(PImage img, float scale){
    
      super(img,scale);
      currentImages = new PImage [4];
      currentImages[0]=loadImage("gold1.png");
      currentImages[1]=loadImage("gold2.png");
      currentImages[2]=loadImage("gold3.png");
      currentImages[3]=loadImage("gold4.png");
      
      index=0;
      frame=0;
  }
  
  void display(){
    imageMode(CENTER);
    image(image, center_x, center_y, w, h); 
  }
  
  // frame is increased by 1
  // every 5 frames do:
  //    call advanceToNextImage
  public void updateAnimation(){
       frame++;
       if(frame%5==0){
       advanceToNextImage();
    } 
  }

  // increase index by 1
  // if index is at end of array loop back to 0
  // assign image variable(from Sprite class) to currentImages at index.
  public void advanceToNextImage(){

     index++;
     if(index==currentImages.length){
        index=0;
      }
     
     image =currentImages[index];
  }
  
  
}
