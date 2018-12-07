package wdid.Users;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;
import wdid.Users.WDIDUser;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
public class Review implements Comparable<Review>{
	@Id Long id;
	@Index private WDIDUser user;
	@Index private String content;
	@Index private Date date;

	private Review(){}

	public Review(WDIDUser user, String content) {
		this.user = user;
		this.content = content;
		this.date = new Date();
	}

	public WDIDUser getUser() {
		return user;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public String getDateString() {
		DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
		return df.format(this.date);
	}

	@Override
	public int compareTo(Review o) {
		if(date.after(o.date)){
			return -1;
		}
		else if (date.before(o.date)){
			return 1;
		}
		return 0;
	}
}
