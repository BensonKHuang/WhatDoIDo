package wdid.Factory;

import wdid.Recommendations.*;
import wdid.Users.User;

import java.util.ArrayList;
import java.util.List;

public class FoodFactory implements RecommendationFactory{

    @Override
    public RecommendationIterator getRecommendations(User user) {
        return new RecommendationIterator(getData());
        // TODO: Add API here
    }

    public List<Recommendation> getData(){
        List<Recommendation> res = new ArrayList<>();
        Location location = new Location();
        Recommendation food = new Food("Mac D's", location, "sux", 4.9);
        res.add(food);
        return res;
    }
}
