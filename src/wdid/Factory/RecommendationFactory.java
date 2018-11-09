package wdid.Factory;

import wdid.Recommendations.*;
import wdid.Users.User;

public interface RecommendationFactory {
    public RecommendationIterator getRecommendations(User user);
}
