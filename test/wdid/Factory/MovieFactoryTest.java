package wdid.Factory;

import org.junit.jupiter.api.Test;
import wdid.Recommendations.Recommendation;
import wdid.Recommendations.RecommendationIterator;

import static org.junit.jupiter.api.Assertions.*;

class MovieFactoryTest {
    @Test
    void getRecommendations() {
        MovieFactory fac = new MovieFactory();
        RecommendationIterator rec = fac.getDummyRecommendations();
        int i = 1;
        while (rec.hasNext()) {
            Recommendation nxt = rec.next();
            assertEquals(nxt.getName(), "Movie " + Integer.toString(i));
            assertEquals(nxt.getDescription(), "Desc " + Integer.toString(i));
            i++;
        }
    }
}