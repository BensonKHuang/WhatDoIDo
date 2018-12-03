package wdid.Recommendations;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class RecommendationTest {

    Recommendation recommendation;

    @BeforeEach
    public void init(){
        recommendation = new Food("McDonald's", new Location(0.0, 0.0), "a good place", 5.0);

    }
    @Test
    void name_set_get() {
        recommendation.setName("Popeye's");
        assertEquals(recommendation.getName(), "Popeye's");
    }

    @Test
    void getLocation() {
        assertEquals(recommendation.getLocation().getLatitude(), (Double)0.0);
    }

    @Test
    void getDescription() {
        assertEquals(recommendation.getDescription(), "a good place");
    }
}