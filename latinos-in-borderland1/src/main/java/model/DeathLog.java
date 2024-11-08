package model;

public class DeathLog {
    private int deathLogId;
    private String deathReason;
    private String date;
    private int playerId;

    public DeathLog(int deathLogId, String deathReason, String date, int playerId) {
        this.deathLogId = deathLogId;
        this.deathReason = deathReason;
        this.date = date;
        this.playerId = playerId;
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getPlayerId() {
        return playerId;
    }

    public void setPlayerId(int playerId) {
        this.playerId = playerId;
    }
}
