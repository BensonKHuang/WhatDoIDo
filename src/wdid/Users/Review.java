package wdid.Users;
import wdid.Users.WDIDUser;

import java.util.Date;

public class Review {
	private WDIDUser user;
	private String content;
	private Date date;
	private Double rating;
	
	public Review(WDIDUser user, String content, Double rating) {
		this.user = user;
		this.content = content;
		this.rating = rating;
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

	public Double getRating() {
		return rating;
	}
	public void setRating(Double rating) {
		this.rating = rating;
	}
}
