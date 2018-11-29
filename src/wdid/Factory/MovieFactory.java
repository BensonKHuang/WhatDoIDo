package wdid.Factory;

import com.google.appengine.repackaged.com.google.gson.*;
import wdid.Recommendations.Location;
import wdid.Recommendations.Movie;
import wdid.Recommendations.Recommendation;
import wdid.Recommendations.RecommendationIterator;
import wdid.Users.WDIDUser;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class MovieFactory implements RecommendationFactory {

    @Override
    public RecommendationIterator getRecommendations(WDIDUser user) {
        return new RecommendationIterator(getData());
    }

    private static List<Recommendation> getData(){
        StringBuffer json = new StringBuffer();
        try {
            URL url = new URL("https://api.themoviedb.org/3/trending/all/day?api_key=6cfedfd687303ef665995ed86e258bdc");
            BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()));
            String line;

            while ((line = reader.readLine()) != null) {
                json.append(line);
            }
            reader.close();
        } catch(Exception ignored){}

        JsonObject parseJSON = new JsonParser().parse(json.toString()).getAsJsonObject();
        JsonArray results = parseJSON.get("results").getAsJsonArray();
        int size = results.size();

        List<Recommendation> res = new ArrayList<>();
        for(int i = 0; i < size; i++){
            JsonObject grab = results.get(i).getAsJsonObject();

            JsonElement title = grab.get("original_title");
            JsonElement desc  = grab.get("overview");

            if(title != null && desc != null){
                Recommendation movie = new Movie(title.getAsString(), new Location(30.2849, -97.7341), desc.getAsString());
                res.add(movie);
            }
        }

		return res;
    }
}
