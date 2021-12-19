package q1;

public class main {

	public static void main(String[] args) {
	Server s = new Server();
		User u1 = new User("u1", s);
		User u2 = new User("u2", s);
		User u3 = new User("u3", s);
		User u4 = new User("u4", s);
		User u5 = new User("u5", s);
		User u6 = new User("u6", s);
		User u7 = new User("u7", s);
		User u8 = new User("u8", s);
		User u9 = new User("u9", s);
		User u10 = new User("u10", s);
		
		u1.start();
		u2.start();
		u3.start();
		u4.start();
		u5.start();
		u6.start();
		u7.start();
		u8.start();
		u9.start();
		u10.start();
		

	}
}
