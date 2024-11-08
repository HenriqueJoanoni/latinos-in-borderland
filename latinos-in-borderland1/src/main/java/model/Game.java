package model;

public class Game {
    private int gameId;
    private int gameMasterId;
    private String objective;
    private String cardType;
    private String difficulty;
    private String playerCount;
    private String survivorCount;
    private String gameDate;

    public Game(
            int gameId,
            int gameMasterId,
            String objective,
            String cardType,
            String difficulty,
            String playerCount,
            String survivorCount,
            String gameDate
    ) {
        this.gameId = gameId;
        this.gameMasterId = gameMasterId;
        this.objective = objective;
        this.cardType = cardType;
        this.difficulty = difficulty;
        this.playerCount = playerCount;
        this.survivorCount = survivorCount;
        this.gameDate = gameDate;
    }

    public int getGameId() {
        return gameId;
    }

    public void setGameId(int gameId) {
        this.gameId = gameId;
    }

    public int getGameMasterId() {
        return gameMasterId;
    }

    public void setGameMasterId(int gameMasterId) {
        this.gameMasterId = gameMasterId;
    }

    public String getObjective() {
        return objective;
    }

    public void setObjective(String objective) {
        this.objective = objective;
    }

    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }

    public String getPlayerCount() {
        return playerCount;
    }

    public void setPlayerCount(String playerCount) {
        this.playerCount = playerCount;
    }

    public String getSurvivorCount() {
        return survivorCount;
    }

    public void setSurvivorCount(String survivorCount) {
        this.survivorCount = survivorCount;
    }

    public String getGameDate() {
        return gameDate;
    }

    public void setGameDate(String gameDate) {
        this.gameDate = gameDate;
    }
}
