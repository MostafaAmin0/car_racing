final static float COIN_SCALE = 0.3;
final static int NEUTRAL_FACING = 0; 
final static int RIGHT_FACING = 1; 
final static int LEFT_FACING = 2; 

PImage c ;
ArrayList<Coin> coins; 
Coin Coin;
Track track;
Player player1;
Player player2;
HashMap<String,Boolean> keymap = new HashMap<String,Boolean>();;

startScreen screen;
EndScreen endScreen;
int selectedScreen=0;
Player winner;


void setup(){
  track=new Track();
  c = loadImage("gold1.png");
  coins = new ArrayList<Coin>();
  coinPlace();
  player1=new Player("Car.png",0.15,45,60); 
  player2=new Player("Car 2.png",0.15,110,60);
  keymap.put("w",false);
  keymap.put("s",false);
  keymap.put("a",false);
  keymap.put("d",false);
  keymap.put("up",false);
  keymap.put("left",false);
  keymap.put("right",false);
  keymap.put("down",false);
  screen=new startScreen();
  endScreen=new EndScreen();
}

void settings() {
  size(1200, 600);
}

void gameScreen(){
  track.display();
  
  for(Player cc: coins){
     cc.display();
     ((Coin)cc).updateAnimation();
  }

  player1.display();
  player2.display();
  move();
  resolvePlatformCollisions(player1,track.barriers);
  resolvePlatformCollisions(player2,track.barriers);
  resolveCoinCollisions(player1);
  resolveCoinCollisions(player2);
  checkWin();
}

void draw(){  

  if(selectedScreen==0){
    screen.startMenu();
  }
  else if(selectedScreen==1){
    gameScreen();
  }else if (selectedScreen == 2){
    endScreen.display(winner);
  }

}


public void resolvePlatformCollisions(Player p, Barrier[] barriers){
  
  p.center_x =p.center_x + (p.speed * cos(p.direction));
  
  ArrayList<Barrier> col_list = checkCollisionList(p,barriers);
  if( col_list.size() >0 ){
    Barrier bar=col_list.get(0);
    if(p.getRight() >= bar.getLeft() && p.getLeft()<bar.getLeft()){
      p.setRight(bar.getLeft()-1);
    }
    else if(p.getLeft() <= bar.getRight() && p.getRight()>bar.getRight()){
      p.setLeft(bar.getRight()+1);
    }
    p.speed=0;
  }
  
  p.center_y =p.center_y + (p.speed * sin(p.direction));
  
  col_list = checkCollisionList(p,barriers);
  if( col_list.size() >0 ){
    Barrier bar=col_list.get(0);
    if(p.getBottom() >= bar.getTop() && p.getTop()<bar.getTop()){
      p.setBottom(bar.getTop()-1);
    }
    else if(p.getTop() <= bar.getBottom() && p.getBottom() > bar.getBottom()){
      p.setTop(bar.getBottom()+1);
    }
    p.speed=0;
  }

  p.update();
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


public void resolveCoinCollisions(Player player){
ArrayList<Coin> collision_list = checkCoinCollisionList(player, coins);
  if(collision_list.size() > 0){
    for(Player coin: collision_list){
       coins.remove(coin);
       player.speed = random(2,3);
    }
  }
}

public boolean checkCoinCollision(Player p, Coin c){
  boolean noXOverlap = p.getRight() <= c.getLeft() || p.getLeft() >= c.getRight();
  boolean noYOverlap = p.getBottom() <= c.getTop() || p.getTop() >= c.getBottom();
  if(noXOverlap || noYOverlap){
    return false;
  }
  else{
    return true;
  }
}

public ArrayList<Coin> checkCoinCollisionList(Player p, ArrayList<Coin> list){
  ArrayList<Coin> collision_list = new ArrayList<Coin>();
  for(Coin c: list){
    if(checkCoinCollision(p, c))
      collision_list.add(c);
  }
  return collision_list;
}


public ArrayList<Coin> co (int n,int x,int x1,int y,int y1){
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
    keymap.put("right",true);
  }
   if(keyCode == LEFT){
    keymap.put("left",true);
  }
  if(keyCode == UP ){
    keymap.put("up",true);
  }
   if(keyCode == DOWN ){
    keymap.put("down",true);
  }
  
    //player 2
  if(key == 'w'){
    keymap.put("w",true);
  }
  if(key == 's'){
    keymap.put("s",true);
  }
  if(key == 'd'){
    keymap.put("d",true);
  }
  if(key == 'a'){
    keymap.put("a",true);
  }
}

// called whenever a key is released.
void keyReleased(){
 if(keyCode == RIGHT){
    keymap.put("right",false);
  }
   if(keyCode == LEFT){
    keymap.put("left",false);
  }
  if(keyCode == UP ){
    keymap.put("up",false);
  }
   if(keyCode == DOWN ){
    keymap.put("down",false);
  }
  
    //player 2
  if(key == 'w'){
    keymap.put("w",false);
  }
  if(key == 's'){
    keymap.put("s",false);
  }
  if(key == 'd'){
    keymap.put("d",false);
  }
  if(key == 'a'){
    keymap.put("a",false);
  }
}


void move(){
  if(keymap.get("right")){
    player1.turnRight();
  }
  if(keymap.get("left")){
    player1.turnLeft();
  }
  if(keymap.get("up")){
    println(player1.speed);
    player1.up();
  }
  if(keymap.get("down")){
    player1.down();
  }
  //or use xnor
  if (keymap.get("up") == keymap.get("down")){
    player1.speed=0;
  }
  
  //player 2
  if(keymap.get("d")){
    player2.turnRight();
  }
  if(keymap.get("a")){
    player2.turnLeft();
  }
  if(keymap.get("w")){
    player2.up();
  }
  if(keymap.get("s")){
    player2.down();
  }
  // or use xnor
  if(keymap.get("w") == keymap.get("s")){
    player2.speed=0;
  }  

}

Player checkFinishLine(){
  if(player1.getLeft() > 1093 && player1.getRight() < 1191 && player1.getTop() > 583){
    return player1;
  }
  if(player2.getLeft() > 1093 && player2.getRight() < 1191 && player2.getTop() > 583){
    return player2;
  }
  
  return null;
}

void checkWin(){
  winner = checkFinishLine();
  if(winner != null){
    if(winner == player1){
      selectedScreen=2;      
    }
    else if(winner == player2){
      selectedScreen=2;
    }
  }
}
