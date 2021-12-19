package q1;

public class User extends Thread {

	String name;
	Server server;

	public User(String name, Server server) {
		super();
		this.name = name;
		this.server = server;
	}
	
	public void run()
	{
		while(true)
		{
			server.requisicao(name);
		}
	}
}
