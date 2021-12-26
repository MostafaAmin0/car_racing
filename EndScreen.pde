class EndScreen{
  PFont font;
  PImage img;
  
  public EndScreen(){
      font=loadFont("CooperBlack-48.vlw");
      
  }
  
  void display(String winner){
    textFont(font);
    background(255, 254, 242);
      
    //Header
    fill(0);
    textSize(55);
    text("GAME END!",(width/2)-(textWidth("GAME END!")/2),height-400);
    
    // winner
    textSize(30);
    text("Winner is :",(width/2)-(textWidth("Winner is :")/2),height-250);
    text(winner,(width/2)-300,height-150);
    
    if (winner == "Player One"){
      img=loadImage("Car.png");
    }else {
      img=loadImage("Car2.png");
    }
    imageMode(CENTER);
    image(img, (width/2)+200, 440, img.width*0.3, img.height*0.3); 
    
  }
}
