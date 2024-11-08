package model;

public class PlayerStatus {
    private int statusId;
    private int injury;
    private String death;
    private int gameId;
    private int playerId;

    public PlayerStatus(int statusId, int injury, String death, int gameId, int playerId) {
        this.statusId = statusId;
        this.injury = injury;
        this.death = death;
        this.gameId = gameId;
        this.playerId = playerId;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public int getInjury() {
        return injury;
    }

    public void setInjury(int injury) {
        this.injury = injury;
    }

    public String getDeath() {
        return death;
    }

    public void setDeath(String death) {
        this.death = death;
    }

    public int getPlayerId() {
        return playerId;
    }

    public int getGameId() {
        return gameId;
    }

    public void setGameId(int gameId) {
        this.gameId = gameId;
    }

    public void setPlayerId(int playerId) {
        this.playerId = playerId;
    }
}
