package q2;

public class Player extends Thread
{
  int damage;
  int min;
  int max;
  String name;
  Monster monstro;

  public Player(int min, int max, String name, Monster monstro)
  {
    this.damage = 0;
    this.min = min;
    this.max = max;
    this.name = name;
    this.monstro = monstro;
  }

    public int aleatorio(int min, int max)
    {
      int var = min + (int) (Math.random() * (max - min));
      return var;
    }

    public void run()
    {
      while(monstro.hp > 0)
      {
        try
        {
        	int pop = aleatorio(min, max);
          monstro.ataque(this, pop);
          damage = pop + damage;
         Thread.sleep((long)(Math.random()*500));
        }
        catch(InterruptedException e)
        {

        }
        
      }
    }
}