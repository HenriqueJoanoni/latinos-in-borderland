package model;

public class PlayerToStatus {
    private int playerToStatusId;
    private int playerId;
    private int statusId;

    public PlayerToStatus(int playerToStatusId, int playerId, int statusId) {
        this.playerToStatusId = playerToStatusId;
        this.playerId = playerId;
        this.statusId = statusId;
    }

    public int getPlayerToStatusId() {
        return playerToStatusId;
    }

    public void setPlayerToStatusId(int playerToStatusId) {
        this.playerToStatusId = playerToStatusId;
    }

    public int getPlayerId() {
        return playerId;
    }

    public void setPlayerId(int playerId) {
        this.playerId = playerId;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }
}
