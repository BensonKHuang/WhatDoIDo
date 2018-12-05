package wdid.Recommendations;
import wdid.Users.Review;

import java.util.ArrayList;
import java.util.List;

public class Movie extends Recommendation {
	private static List<Review> reviews;
	
	static {
		reviews = new ArrayList<>();
	}
	
	public Movie(String name, Location location, String description) {
		super(name, location);
		setDescription(description);
	}

	public static void addReview(Review review) {
		reviews.add(review);
	}
	
}
