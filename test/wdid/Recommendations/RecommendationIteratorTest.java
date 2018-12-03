package wdid.Recommendations;

import org.junit.jupiter.api.AfterEach;
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
        recommendation1 = new Food("McDonald's", new Location(0.0, 0.0), "a good place", 5.0);
        recommendation2 = new Food("Burger King", new Location(0.0, 0.0), "a good place", 5.0);

        List<Recommendation> recommendationList = new ArrayList<>();
        recommendationList.add(recommendation1);
        recommendationList.add(recommendation2);

        recommendationIterator = new RecommendationIterator(recommendationList);
    }

    @Test
    void hasNext_isTrue() {
        assertEquals(recommendationIterator.hasNext(), true);
        recommendationIterator.next();
        assertEquals(recommendationIterator.hasNext(), true);
    }

    @Test
    void hasNext_isFalse() {
        while(recommendationIterator.hasNext()){
            recommendationIterator.next();
        }
        assertEquals(recommendationIterator.hasNext(), false);
    }

    @Test
    void next_contains() {
        assertEquals(recommendationIterator.next(), recommendation1);
        assertEquals(recommendationIterator.next(), recommendation2);
    }

    @Test
    void next_name() {
        assertEquals(recommendationIterator.next().getName(), recommendation1.getName());
        assertEquals(recommendationIterator.next().getName(), recommendation2.getName());

    }



}