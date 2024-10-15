package model;

public class Location {
    private int locationId;
    private String locationName;
    private String locationType;
    private String timeLimit;
    private String hazard;
    private int gameId;

    public Location(
            int locationId,
            String locationName,
            String locationType,
            String timeLimit,
            String hazard,
            int gameId
    ) {
        this.locationId = locationId;
        this.locationName = locationName;
        this.locationType = locationType;
        this.timeLimit = timeLimit;
        this.hazard = hazard;
        this.gameId = gameId;
    }

    public int getLocationId() {
        return locationId;
    }

    public void setLocationId(int locationId) {
        this.locationId = locationId;
    }

    public String getLocationName() {
        return locationName;
    }

    public void setLocationName(String locationName) {
        this.locationName = locationName;
    }

    public String getLocationType() {
        return locationType;
    }

    public void setLocationType(String locationType) {
        this.locationType = locationType;
    }

    public String getTimeLimit() {
        return timeLimit;
    }

    public void setTimeLimit(String timeLimit) {
        this.timeLimit = timeLimit;
    }

    public String getHazard() {
        return hazard;
    }

    public void setHazard(String hazard) {
        this.hazard = hazard;
    }

    public int getGameId() {
        return gameId;
    }

    public void setGameId(int gameId) {
        this.gameId = gameId;
    }
}
