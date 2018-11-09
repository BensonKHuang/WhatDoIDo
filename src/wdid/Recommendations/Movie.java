package wdid.Recommendations;
import wdid.Users.Review;

import java.util.ArrayList;
import java.util.List;

public class Movie extends Recommendation {

	private static Double rating;
	private static List<Review> reviews;
	
	private String description;

	
	static {
		rating = 0.0;
		reviews = new ArrayList<>();
	}
	
	public Movie(String name, Location location, String description) {
		super(name, location);
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}
	
	public static void addReview(Review review) {
		reviews.add(review);
		updateRating(review.getRating());
	}
	public static void updateRating(Double rating) {
		rating = 5.0; //TODO: Update rating
	}
	
}
