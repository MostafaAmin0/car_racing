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
    
    //retry button 
    fill(132, 248, 251);

    strokeWeight(2);
    stroke(0);
    rect(width/2-125,height-100,250,60,25);
    fill(0);
    textSize(40);
    text("Retry",(width/2)-(textWidth("Retry")/2),height-58);
    
    if(mouseX>=width/2-125 && mouseX<=width/2+125 && mouseY>=height-100 && mouseY<=height-40){
      if(mousePressed){
        setup();
      }
    }
    
    
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
