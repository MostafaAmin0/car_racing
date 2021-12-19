public class Track{
  Barrier[] barriers;
  
  public Track(){
     //now our barriers
    barriers = new Barrier[1];
    barriers[0] = new Barrier(100,100,10,400);
    //barriers[1] = new Barrier(0,0,width,height);
    //barriers[1] = new Barrier(180,500,440,30);
    //barriers[2] = new Barrier(1000,500,150,30);
    //barriers[3] = new Barrier(640,400,380,30);
    //barriers[4] = new Barrier(1000,160,30,400);
    //barriers[5] = new Barrier(610,180,30,350);
    //barriers[6] = new Barrier(1000,1000,30,100);
  }  
  void display(){
    
    //now draw any barriers
     for(int i = 0; i< barriers.length ; i++){
       barriers[i].display();
     
     }
  }
}
