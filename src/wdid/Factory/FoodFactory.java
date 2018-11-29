package wdid.Factory;

import com.google.appengine.repackaged.com.google.gson.JsonArray;
import com.google.appengine.repackaged.com.google.gson.JsonElement;
import com.google.appengine.repackaged.com.google.gson.JsonObject;
import com.google.appengine.repackaged.com.google.gson.JsonParser;
import wdid.Recommendations.*;
import wdid.Users.WDIDUser;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class FoodFactory implements RecommendationFactory{

    @Override
    public RecommendationIterator getRecommendations(WDIDUser user) {
        return new RecommendationIterator(getData());
    }

    public List<Recommendation> getData(){
        StringBuffer json = new StringBuffer();
        try {
            URL url = new URL("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=30.288189,-97.735487&radius=1500&type=restaurant&key=AIzaSyCjJ9D9zTYhgy0ffR_7sNdHQuzue__ailA");
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

            JsonElement title = grab.get("name");
            JsonElement desc  = grab.get("vicinity");
            JsonElement rating  = grab.get("rating");

            JsonElement geometry = grab.get("geometry");
            JsonElement location;

            double lat = 30.288189;
            double lng = -97.735487;
            if(geometry != null && (location = geometry.getAsJsonObject().get("location")) != null) {
                lat = location.getAsJsonObject().get("lat").getAsDouble();
                lng = location.getAsJsonObject().get("lng").getAsDouble();
            }
            if(title != null && desc != null && rating != null){
                Recommendation food = new Food(title.getAsString(), new Location(lat, lng), desc.getAsString(), rating.getAsDouble());
                res.add(food);
            }
        }

        return res;
    }
}
