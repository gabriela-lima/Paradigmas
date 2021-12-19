package q1;

import java.util.concurrent.Semaphore;

public class Server {
	Semaphore s1 = new Semaphore(3);
	Semaphore s2 = new Semaphore(3);
	public void requisicao(String name)
	{
		int pop =1 + (int) (Math.random() * (3 - 1));
		if(pop == 1)
		{
			try {
				s1.acquire();
				System.out.println("Servidor 1 fazendo a requisicao de usuario "+name+"\n");
				Thread.sleep((long)(Math.random()*500));
				System.out.println("Servidor 1 concluiu a requisicao de usuario "+name+"\n");
				s1.release();
			} catch (InterruptedException e) {
			}
		}
		if(pop == 2)
		{
			try {
				s2.acquire();
				System.out.println("Servidor 2 fazendo a requisicao de usuario "+name+"\n");
				Thread.sleep((long)(Math.random()*500));
				System.out.println("Servidor 2 concluiu a requisicao de usuario "+name+"\n");
				s2.release();
			} catch (InterruptedException e) {
			}
		}
		
	}
}
