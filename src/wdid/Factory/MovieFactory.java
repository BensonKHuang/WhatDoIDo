package wdid.Factory;

import com.google.gson.*;
import wdid.Recommendations.*;
import wdid.Users.WDIDUser;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class MovieFactory implements RecommendationFactory {
    @Override
    public RecommendationIterator getRecommendations(WDIDUser user, String unused) {
        return new RecommendationIterator(getData());
    }

    public RecommendationIterator getDummyRecommendations() {
        List<Recommendation> dummy = new ArrayList<>();
        for(int i = 1; i <= 5; i++)
            dummy.add(new Movie("Movie " + Integer.toString(i), new Location(0.0, 0.0), "Desc " + Integer.toString(i)));
        return new RecommendationIterator(dummy);
    }

    private static List<Recommendation> getData(){
        StringBuffer json = new StringBuffer();
        try {
            URL url = new URL("https://api.themoviedb.org/3/movie/now_playing?api_key=6cfedfd687303ef665995ed86e258bdc&language=en-US&region=US");
            BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
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
            JsonElement rating  = grab.get("vote_average");

            if(title != null && desc != null){
                Recommendation movie = new Movie(title.getAsString(), new Location(30.2849, -97.7341), desc.getAsString());
                movie.setRating(rating.getAsDouble() / 2);
                res.add(movie);
            }
        }

		return res;
    }
}
