package model;

public class PlayerStatus {
    private int statusId;
    private String death;
    private String dateUpdated;
    private int playerId;

    public PlayerStatus(int statusId, String death, String dateUpdated, int playerId) {
        this.statusId = statusId;
        this.death = death;
        this.dateUpdated = dateUpdated;
        this.playerId = playerId;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public String getDeath() {
        return death;
    }

    public void setDeath(String death) {
        this.death = death;
    }

    public String getDateUpdated() {
        return dateUpdated;
    }

    public void setDateUpdated(String dateUpdated) {
        this.dateUpdated = dateUpdated;
    }

    public int getPlayerId() {
        return playerId;
    }

    public void setPlayerId(int playerId) {
        this.playerId = playerId;
    }
}
