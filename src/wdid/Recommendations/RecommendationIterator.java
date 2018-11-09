package wdid.Recommendations;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public class RecommendationIterator implements Iterator<Recommendation> {

    Queue<Recommendation> recommendationsQueue;
    public RecommendationIterator(List<Recommendation> recommendations){
        recommendationsQueue = new LinkedList<>();
        recommendationsQueue.addAll(recommendations);
    }

    @Override
    public boolean hasNext() {
        return !recommendationsQueue.isEmpty();
    }

    @Override
    public Recommendation next() {
        return recommendationsQueue.poll();
    }
}
