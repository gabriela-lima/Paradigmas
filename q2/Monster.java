package q2;
public class Monster
{
  int hp = 2000;
  int totalhp = 2000;

  public synchronized void ataque(Player player, int damage)
{
  hp = hp - damage;
  System.out.println("Player " + player.name + " causou "+ damage + " de dano\n");
  System.out.println("O monstro tem " +hp + " de vida restante\n");
  if(hp<= 0)
  {
    System.out.println("O monstro morreu e player " + player.name + " o matou\n");
  }
  if(hp<= totalhp*0.3)
  {
	   if(((int)(Math.random()*(10 - 1))) + 1 >=  8)
	   {
		   hp = hp + 50;
		   System.out.println("Monstro se curou em 50, a vida dele agora eh: "+hp+"\n");
	   }
  }
}

}
