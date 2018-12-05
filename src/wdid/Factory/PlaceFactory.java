package wdid.Factory;

import com.google.appengine.repackaged.com.google.gson.JsonArray;
import com.google.appengine.repackaged.com.google.gson.JsonElement;
import com.google.appengine.repackaged.com.google.gson.JsonObject;
import com.google.appengine.repackaged.com.google.gson.JsonParser;
import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.model.GeocodingResult;
import wdid.Recommendations.*;
import wdid.Users.WDIDUser;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class PlaceFactory implements RecommendationFactory {
    @Override
    public RecommendationIterator getRecommendations(WDIDUser user, String param) {
        if (user.getPlace() != null) {
            GeocodingResult res = getGeocoding(user.getPlace());
            user.setLatitude(res.geometry.location.lat);
            user.setLongitude(res.geometry.location.lng);
        }
        return new RecommendationIterator(getData(user, param));
    }

    public RecommendationIterator getDummyRecommendations() {
        List<Recommendation> dummy = new ArrayList<>();
        for (int i = 1; i <= 5; i++)
            dummy.add(new Place("Place " + Integer.toString(i), new Location(0.0, 0.0), "Desc " + Integer.toString(i)));
        return new RecommendationIterator(dummy);
    }

    private GeocodingResult getGeocoding(String place) {
        GeoApiContext context = new GeoApiContext.Builder().apiKey("AIzaSyCjJ9D9zTYhgy0ffR_7sNdHQuzue__ailA").build();
        GeocodingResult[] results = GeocodingApi.geocode(context, place).awaitIgnoreError();

        return results.length > 0 ? results[0] : null;
    }

    public List<Recommendation> getData(WDIDUser user, String param) {
        Double longitude = user.getLongitude();
        Double latitude = user.getLatitude();
        StringBuffer json = new StringBuffer();
        try {
            String urlString =
                    String.format(
                            "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&radius=5000&type=" + param + "&key=AIzaSyCjJ9D9zTYhgy0ffR_7sNdHQuzue__ailA",
                            latitude, longitude);
            URL url = new URL(urlString);
            BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
            String line;

            while ((line = reader.readLine()) != null) {
                json.append(line);
            }
            reader.close();
        } catch (Exception ignored) {
        }

        JsonObject parseJSON = new JsonParser().parse(json.toString()).getAsJsonObject();
        JsonArray results = parseJSON.get("results").getAsJsonArray();
        int size = results.size();

        List<Recommendation> res = new ArrayList<>();
        for (int i = 0; i < size; i++) {
            JsonObject grab = results.get(i).getAsJsonObject();

            JsonElement title = grab.get("name");
            JsonElement desc = grab.get("vicinity");
            JsonElement rating = grab.get("rating");

            JsonElement geometry = grab.get("geometry");
            JsonElement location;

            double lat = 30.288189;
            double lng = -97.735487;
            if (geometry != null && (location = geometry.getAsJsonObject().get("location")) != null) {
                lat = location.getAsJsonObject().get("lat").getAsDouble();
                lng = location.getAsJsonObject().get("lng").getAsDouble();
            }
            if (title != null && desc != null && rating != null) {
                Recommendation place =
                        new Place(
                            title.getAsString(),
                            new Location(lat, lng),
                            desc.getAsString()
                        );
                place.setRating(rating.getAsDouble());
                res.add(place);
            }
        }

        return res;
    }
}
