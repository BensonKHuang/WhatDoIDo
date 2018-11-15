package wdid.Factory;

import wdid.Recommendations.Location;
import wdid.Recommendations.Movie;
import wdid.Recommendations.Recommendation;
import wdid.Recommendations.RecommendationIterator;
import wdid.Users.User;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.*;

public class MovieFactory implements RecommendationFactory {

    @Override
    public RecommendationIterator getRecommendations(User user) {
        return new RecommendationIterator(getData());
    }

    private static List<Recommendation> getData(){
        StringBuilder json = new StringBuilder();
        try {
            URL url = new URL("https://api.themoviedb.org/3/trending/all/day?api_key=6cfedfd687303ef665995ed86e258bdc/");
            BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()));
            String line;

            while ((line = reader.readLine()) != null) {
                json.append(line);
            }
            reader.close();
        } catch(Exception ignored){}

        JSONObject parseJSON = new JSONObject(json);
        JSONArray results = parseJSON.getJSONArray("results");
        int size = results.length();

        List<Recommendation> res = new ArrayList<>();
        for(int i = 0; i < size; i++){
            JSONObject grab = (JSONObject)results.get(i);
            Recommendation movie = new Movie(grab.getString("original_title"), new Location(), grab.getString("overview"));
            res.add(movie);
        }

		return res;
    }
}
