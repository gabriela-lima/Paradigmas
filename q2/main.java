package q2;

class Main {
  public static void main(String[] args) {
    Monster monstro = new Monster();
    Player p1 = new Player(10, 15, "p1", monstro);
    Player p2 = new Player(5, 20, "p2", monstro);
    Player p3 = new Player(30, 35, "p3", monstro);
    Player p4 = new Player(8, 18, "p4", monstro);
    Player p5 = new Player(2, 50, "p5", monstro);

    p1.start();
    p2.start();
    p3.start();
    p4.start();
    p5.start();
    
    try {
    	
		p1.join();
		p2.join();
		p3.join();
		p4.join();
		p5.join();
		calc(p1, p2, p3, p4, p5);
	} catch (InterruptedException e) {
	}
  }

  public static void calc(Player... numero){
		int maior=-2000000, menor=2000000;
		String big = "", small = "";
		for(int i=0; i<numero.length; i++){
			if(numero[i].damage >= maior){
				maior = numero[i].damage;
				big = numero[i].name;
			}
			if(numero[i].damage <= menor){
				menor = numero[i].damage;
				small = numero[i].name;
			}
		}
		System.out.println("Maior contribuidor: "+big+"\n Menor contribuidor: "+small); 
	}
}

