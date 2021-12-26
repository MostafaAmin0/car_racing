class StartScreen{
  PFont font;
  PImage img1,img2;

  void startMenu(){
      font=loadFont("CooperBlack-48.vlw");
      textFont(font);
      background(255, 254, 242);
      
      // game name
      fill(0);
      textSize(55);
      text("Car Racing",(width/2)-(textWidth("Car Racing")/2),height-400);
      
      //Start button
      if(mouseX>=width/2-125 && mouseX<=width/2+125 && mouseY>=height-250 && mouseY<=height-190){
         fill(252, 235, 141);
      }
      else {
        fill(255, 226, 46);
      }

      strokeWeight(2);
      stroke(0);
      rect(width/2-125,height-250,250,60,25);
      fill(0);
      textSize(40);
      text("Start",(width/2)-(textWidth("Start")/2),height-207);
      
      
      // Guide button
       if(mouseX>=width/2-125 && mouseX<=width/2+125 && mouseY>=height-150 && mouseY<=height-90){
          fill(216, 254, 255);
       }
       else {
         fill(132, 248, 251);
       }
      rect(width/2-125,height-150,250,60,25);
      fill(0);
      textSize(40);
      text("Guide",(width/2)-(textWidth("Guide")/2),height-107);
      selectGuide();
      selectStart();

  }
  
  void selectGuide(){
    if(mouseX>=width/2-125 && mouseX<=width/2+125 && mouseY>=height-150 && mouseY<=height-90){
      if(mousePressed){
        fill(252, 249, 212);
        strokeWeight(5);
        rect(width/2-300,height-550,600,500,30);
        fill(0);
        text("Guide",(width/2)-(textWidth("Guide")/2),height-500);
        textSize(20);
        text("Your Goal is to go to",(width/2)-(textWidth("Your Goal is to go to")/2),height-450);
        text("the finish line in the shortest time.",(width/2)-(textWidth("the finish line in the shortest time.")/2),height-420);
        text("Collect the coins to increase your speed.",(width/2)-(textWidth("Collect the coins to increase your speed.")/2),height-390);
        text("GOOD LUCK!",(width/2)-(textWidth("GOOD LUCK!")/2),height-90);

        img1=loadImage("Car 1.png");
        img2=loadImage("Car 2.png");

        image(img1,width/2-260,height-350,img1.width*0.2,img1.height*0.2);
        text("Player 1",width/2-200,height-330);
        text("Control keys: (4 Arrows)",width/2-200,height-300);
        
        image(img2,width/2-260,height-200,img2.width*0.2,img2.height*0.2);
        text("Player 2",width/2-200,height-180);
        text("Control keys: (W,S,A,D)",width/2-200,height-150);

      }
    }
  }
  
  void selectStart(){
    if(mouseX>=width/2-125 && mouseX<=width/2+125 && mouseY>=height-250 && mouseY<=height-190){
      if(mousePressed){
        selectedScreen=1;
      }
    }
  }
}
