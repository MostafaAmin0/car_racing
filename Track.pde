public class Track{
Barrier[] barriers;
PImage gameBackground;
  public Track(){
     //now our barriers
    barriers = new Barrier[9];
    barriers[0] = new Barrier(134,0,368,176);
    barriers[1] = new Barrier(134,284,365,201);
    barriers[2] = new Barrier(608,107,243,369);
    barriers[3] = new Barrier(999,353,94,247);
    barriers[4] = new Barrier(998,0,202,253);
    barriers[5] = new Barrier(0,0,25,600);
    barriers[6] = new Barrier(25,592,974,8);
    barriers[7] = new Barrier(0,0,999,8);
    barriers[8] = new Barrier(1191,245,9,355);

    //game background 
     gameBackground=loadImage("Background.png");



  }  
  void display(){
    //display background
     background(gameBackground);
    //now draw any barriers
     for(int i = 0; i< barriers.length ; i++){
       barriers[i].display();
     
     }
     
  }
}
