package model;

public class DeathLog {
    private int deathLogId;
    private String deathReason;
    private String dateUpdated;
    private int playerId;
    private int gameId;

    public DeathLog(int deathLogId, String deathReason, String date, int playerId, int gameId) {
        this.deathLogId = deathLogId;
        this.deathReason = deathReason;
        this.dateUpdated = date;
        this.playerId = playerId;
        this.gameId = gameId;
    }

    public int getDeathLogId() {
        return deathLogId;
    }

    public void setDeathLogId(int deathLogId) {
        this.deathLogId = deathLogId;
    }

    public String getDeathReason() {
        return deathReason;
    }

    public void setDeathReason(String deathReason) {
        this.deathReason = deathReason;
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

    public int getGameId() {
        return gameId;
    }

    public void setGameId(int gameId) {
        this.gameId = gameId;
    }
}
