package wdid.Factory;

import wdid.Recommendations.Location;
import wdid.Recommendations.Movie;
import wdid.Recommendations.Recommendation;
import wdid.Recommendations.RecommendationIterator;
import wdid.Users.User;

import java.util.ArrayList;
import java.util.List;

public class MovieFactory implements RecommendationFactory {

    @Override
    public RecommendationIterator getRecommendations(User user) {
        RecommendationIterator iterator = new RecommendationIterator(getDummy());
        return iterator;
        // TODO: Add API here
    }

    private static List<Recommendation> getDummy(){
        List<Recommendation> res = new ArrayList<>();
		Location location = new Location();
		Recommendation movie = new Movie("BLACK MIRROR", location, "WOW IT'S FOOKIN GOOD MOVIE");
		res.add(movie);
		return res;
    }
}
