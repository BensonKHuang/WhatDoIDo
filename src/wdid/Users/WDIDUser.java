package wdid.Users;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
public class WDIDUser {
	@Id public String email;

	public int gender;
	public int age;
	public boolean  diet[];
	public boolean movie[];

	public WDIDUser() {}
	public WDIDUser(String email, String name) {
		this.email = email;

		this.gender = 0;
		this.age    = 18;
		this.diet   = new boolean[4];
		this.movie  = new boolean[6];
	}
}
