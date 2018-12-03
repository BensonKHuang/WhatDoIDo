package wdid.Factory;

import org.junit.jupiter.api.Test;
import wdid.Recommendations.Recommendation;
import wdid.Recommendations.RecommendationIterator;

import static org.junit.jupiter.api.Assertions.*;

class FoodFactoryTest {
    @Test
    void getRecommendations() {
        FoodFactory fac = new FoodFactory();
        RecommendationIterator rec = fac.getDummyRecommendations();
        int i = 1;
        while (rec.hasNext()) {
            Recommendation nxt = rec.next();
            assertEquals(nxt.getName(), "Food " + Integer.toString(i));
            assertEquals(nxt.getDescription(), "Desc " + Integer.toString(i));
            i++;
        }
    }
}