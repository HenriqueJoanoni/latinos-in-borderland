package model;

public class GameMaster {
    private int gameMasterId;
    private String gameMasterRole;
    private int gameId;
    private int playerId;

    public GameMaster(int gameMasterId, String gameMasterRole, int gameId, int playerId) {
        this.gameMasterId = gameMasterId;
        this.gameMasterRole = gameMasterRole;
        this.gameId = gameId;
        this.playerId = playerId;
    }

    public int getGameMasterId() {
        return gameMasterId;
    }

    public void setGameMasterId(int gameMasterId) {
        this.gameMasterId = gameMasterId;
    }

    public String getGameMasterRole() {
        return gameMasterRole;
    }

    public void setGameMasterRole(String gameMasterRole) {
        this.gameMasterRole = gameMasterRole;
    }

    public int getGameId() {
        return gameId;
    }

    public void setGameId(int gameId) {
        this.gameId = gameId;
    }

    public int getPlayerId() {
        return playerId;
    }

    public void setPlayerId(int playerId) {
        this.playerId = playerId;
    }
}
