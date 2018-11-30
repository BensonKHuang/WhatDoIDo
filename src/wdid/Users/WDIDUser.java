package wdid.Users;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;
import lombok.Getter;
import lombok.Setter;

@Entity
public class WDIDUser {
	@Id @Getter @Setter private String email;

	@Getter @Setter private int gender,  age;
	public boolean  diet[], movie[];
	@Getter @Setter private Float latitude, longitude;

	public WDIDUser() {}
	public WDIDUser(String email, String name) {
		this.email = email;
		this.gender = 0;
		this.age    = 18;
		this.diet   = new boolean[4];
		this.movie  = new boolean[6];
		this.latitude = null;
		this.longitude = null;
	}
}
