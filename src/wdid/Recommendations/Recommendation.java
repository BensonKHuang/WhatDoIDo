package wdid.Recommendations;
import java.util.ArrayList;
import java.util.List;

public abstract class Recommendation {
	
	private String name;
	private Location location;
	public String description;
	
	public Recommendation(String name, Location location) {
		this.name = name;
		this.location = location;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Location getLocation() {
		return location;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public void setLocation(Location location) {
		this.location = location;
	}
	
	
}
