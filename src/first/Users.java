package first;
public class Users {
	int id;
	private String username;
	private String password;
	public Users(int id,String username,String password) {
	this.id=id;
	this.username=username;
	this.password=password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Users(String username,String password) {
		this.password=password;
		this.username=username;
	}

}
