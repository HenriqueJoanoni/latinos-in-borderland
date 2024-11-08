package model;

public class PlayerGame {
    private int playerGameId;
    private String playerRole;
    private String visaChange;
    private String outcome;
    private int playerId;
    private int gameId;

    public PlayerGame(
            int playerGameId,
            String playerRole,
            String visaChange,
            String outcome,
            int playerId,
            int gameId
    ) {
        this.playerGameId = playerGameId;
        this.playerRole = playerRole;
        this.visaChange = visaChange;
        this.outcome = outcome;
        this.playerId = playerId;
        this.gameId = gameId;
    }

    public int getPlayerGameId() {
        return playerGameId;
    }

    public void setPlayerGameId(int playerGameId) {
        this.playerGameId = playerGameId;
    }

    public String getPlayerRole() {
        return playerRole;
    }

    public void setPlayerRole(String playerRole) {
        this.playerRole = playerRole;
    }

    public String getVisaChange() {
        return visaChange;
    }

    public void setVisaChange(String visaChange) {
        this.visaChange = visaChange;
    }

    public String getOutcome() {
        return outcome;
    }

    public void setOutcome(String outcome) {
        this.outcome = outcome;
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
