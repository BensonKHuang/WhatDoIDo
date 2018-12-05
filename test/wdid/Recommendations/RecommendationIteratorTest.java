package wdid.Recommendations;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class RecommendationIteratorTest {

    RecommendationIterator recommendationIterator;
    Recommendation recommendation1;
    Recommendation recommendation2;

    @BeforeEach
    public void init(){
        recommendation1 = new Place("McDonald's", new Location(0.0, 0.0), "a good place");
        recommendation2 = new Place("Burger King", new Location(0.0, 0.0), "a good place");

        List<Recommendation> recommendationList = new ArrayList<>();
        recommendationList.add(recommendation1);
        recommendationList.add(recommendation2);

        recommendationIterator = new RecommendationIterator(recommendationList);
    }

    @Test
    void hasNext_isTrue() {
        assertTrue(recommendationIterator.hasNext());
        recommendationIterator.next();
        assertTrue(recommendationIterator.hasNext());
    }

    @Test
    void hasNext_isFalse() {
        while(recommendationIterator.hasNext()){
            recommendationIterator.next();
        }
        assertFalse(recommendationIterator.hasNext());
    }

    @Test
    void next_contains() {
        assertEquals(recommendation1, recommendationIterator.next());
        assertEquals(recommendation2, recommendationIterator.next());
    }

    @Test
    void next_name() {
        assertEquals(recommendation1.getName(), recommendationIterator.next().getName());
        assertEquals(recommendation2.getName(), recommendationIterator.next().getName());

    }



}