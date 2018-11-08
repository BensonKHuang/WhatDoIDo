package wdid;
import java.util.*;

public class User {
	private String email;
	private String name;
	
	private Map<String, Boolean> preferences;
	
	public User(String email, String name) {
		this.email = email;		
		this.name = name;

		this.preferences = new HashMap<>();
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public Map<String, Boolean> getPreferences() {
		return preferences;
	}
	public void setPreference(String key, Boolean val) {
		this.preferences.put(key, val);
	}
}
