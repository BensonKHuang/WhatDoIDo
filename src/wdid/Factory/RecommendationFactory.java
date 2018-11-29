package wdid.Factory;

import wdid.Recommendations.*;
import wdid.Users.WDIDUser;

public interface RecommendationFactory {
    public RecommendationIterator getRecommendations(WDIDUser user);
}
