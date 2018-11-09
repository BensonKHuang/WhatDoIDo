package wdid.Factory;

import wdid.Recommendations.*;
import wdid.Users.User;

import java.util.ArrayList;
import java.util.List;

public class FoodFactory implements RecommendationFactory{

    @Override
    public RecommendationIterator getRecommendations(User user) {
        RecommendationIterator iterator = new RecommendationIterator(getDummy());
        return iterator;
        // TODO: Add API here
    }

    public List<Recommendation> getDummy(){
        List<Recommendation> res = new ArrayList<>();
        Location location = new Location();
        Recommendation food = new Food("Mac D's", location, "WOW THIS IS FOOKIN GOOD FOOD", 4.9);
        res.add(food);
        return res;
    }
}
