package wdid.Recommendations;
import wdid.Users.Review;

import java.util.ArrayList;
import java.util.List;

public class Food extends Recommendation {
	
	
	private static Double rating;
	private static List<Review> reviews;

	private Double restaurantRating;
	
	static {
		rating = 0.0;
		reviews = new ArrayList<>();
	}
	
	public Food(String name, Location location, String description, Double rating) {
		super(name, location);
		setDescription(description);
		this.setRestaurantRating(rating);
	}
	
	public static void addReview(Review review) {
		reviews.add(review);
		updateRating(review.getRating());
	}
	public static void updateRating(Double rating) {
		rating = 5.0; //TODO: Update rating
	}
	
	public static Double getRating() {
		return rating;
	}

	public Double getRestaurantRating() {
		return restaurantRating;
	}

	public void setRestaurantRating(Double restaurantRating) {
		this.restaurantRating = restaurantRating;
	}
	
	
	
	
}
