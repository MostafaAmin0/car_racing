final static float COIN_SCALE = 0.3;
final static int NEUTRAL_FACING = 0; 
final static int RIGHT_FACING = 1; 
final static int LEFT_FACING = 2; 

PImage c ;
ArrayList<Player> coins; 
Coin Coin;
Track track;
Player player;

void setup(){
  size(1200,600);
  track=new Track();
  player=new Player("Car.png",0.15,45,60); 
  c = loadImage("gold1.png");
  coins = new ArrayList<Player>();
  coinPlace();
  
  
}

void draw(){
  track.display();
  player.display();
  for(Player cc: coins){
     cc.display();
     ((AnimatedSprite)cc).updateAnimation();
  }
  resolvePlatformCollisions(player,track.barriers);
  resolveCoinCollisions();
  
}


public void resolvePlatformCollisions(Player p, Barrier[] barriers){
  
  p.center_x =p.center_x + (p.speed * cos(p.direction));
  
  ArrayList<Barrier> col_list = checkCollisionList(p,barriers);
  if( col_list.size() >0 ){
    Barrier bar=col_list.get(0);
    if(p.getRight() >= bar.getLeft() && p.getLeft()<bar.getLeft()){
      p.setRight(bar.getLeft());
    }
    else if(p.getLeft() <= bar.getRight() && p.getRight()>bar.getRight()){
      p.setLeft(bar.getRight());
    }
    p.speed=0;
  }
  
  p.center_y =p.center_y + (p.speed * sin(p.direction));
  
  col_list = checkCollisionList(p,barriers);
  if( col_list.size() >0 ){
    Barrier bar=col_list.get(0);
    if(p.getBottom() >= bar.getTop() && p.getTop()<bar.getTop()){
      p.setBottom(bar.getTop());
    }
    else if(p.getTop() <= bar.getBottom() && p.getBottom() > bar.getBottom()){
      p.setTop(bar.getBottom());
    }
    p.speed=0;
  }

  p.update();
}
public void resolveCoinCollisions(){
ArrayList<Player> collision_list = checkCollisionList(player, coins);
  if(collision_list.size() > 0){
    for(Player coin: collision_list){
       coins.remove(coin);
       player.speed = random(4,10);
     
    }}
}

boolean checkCollision(Player p1, Barrier bar){
  boolean noXOverlap1 = p1.getRight() <= bar.getLeft() ;
  boolean noXOverlap2 = p1.getLeft() >= bar.getRight() ;
  boolean noXOverlap = noXOverlap1 ||noXOverlap2 ;
  
  boolean noYOverlap1 = p1.getBottom() <= bar.getTop() ;
  boolean noYOverlap2 = p1.getTop() >= bar.getBottom();
  boolean noYOverlap = noYOverlap1||noYOverlap2;
  
  if(noXOverlap || noYOverlap ){
    return false;
  }
  else{
    return true;
  }
}

public ArrayList<Barrier> checkCollisionList(Player p, Barrier[] bars){
  ArrayList<Barrier> collision_list = new ArrayList<Barrier>();
  for(Barrier b: bars){
    if(checkCollision(p, b))
      collision_list.add(b);
  }
  return collision_list;
}


public boolean checkCollision(Player s1, Player s2){
  boolean noXOverlap = s1.getRight() <= s2.getLeft() || s1.getLeft() >= s2.getRight();
  boolean noYOverlap = s1.getBottom() <= s2.getTop() || s1.getTop() >= s2.getBottom();
  if(noXOverlap || noYOverlap){
    return false;
  }
  else{
    return true;
  }
}

public ArrayList<Player> checkCollisionList(Player s, ArrayList<Player> list){
  ArrayList<Player> collision_list = new ArrayList<Player>();
  for(Player p: list){
    if(checkCollision(s, p))
      collision_list.add(p);
  }
  return collision_list;
}


public ArrayList<Player> co (int n,int x,int x1,int y,int y1){
  for (int i=0;i<n;i++){
    Coin coi = new Coin(c, COIN_SCALE);
    coi.center_x = (float)(random(x,x1));
    coi.center_y = (float)(random(y,y1));
    coins.add(coi);
    
  }
  
  return coins;
    
}


public void coinPlace(){
  
  co(int(random(1,3)),145,520,180,240);
  co(int(random(1,3)),145,480,500,560);
  co(1,620,845,500,560);
  co(1,600,845,30,80);
  co(1,950,1100,270,320);

}



// called whenever a key is pressed.
void keyPressed(){
  if(keyCode == RIGHT){
    player.turnRight();
  }
   if(keyCode == LEFT){
    player.turnLeft();
  }
  if(keyCode == UP ){
    player.up();
  }
   if(keyCode == DOWN ){
    player.down();
  }
}

// called whenever a key is released.
void keyReleased(){
  if(keyCode == RIGHT){
  }
  if(keyCode == LEFT){
  } if(keyCode == UP ){
    player.speed=0;
  }
    if(keyCode == DOWN ){
    player.speed=0;
  }
}
