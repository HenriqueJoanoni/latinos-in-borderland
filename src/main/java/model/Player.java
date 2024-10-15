package model;

public class Player {
    private int playerId;
    private String playerName;
    private int playerAge;
    private String gender;
    private String playerOccupation;

    public Player(int playerId, String playerName, int playerAge, String gender, String playerOccupation) {
        this.playerId = playerId;
        this.playerName = playerName;
        this.playerAge = playerAge;
        this.gender = gender;
        this.playerOccupation = playerOccupation;
    }

    public int getPlayerId() {
        return playerId;
    }

    public void setPlayerId(int playerId) {
        this.playerId = playerId;
    }

    public String getPlayerName() {
        return playerName;
    }

    public void setPlayerName(String playerName) {
        this.playerName = playerName;
    }

    public int getPlayerAge() {
        return playerAge;
    }

    public void setPlayerAge(int playerAge) {
        this.playerAge = playerAge;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPlayerOccupation() {
        return playerOccupation;
    }

    public void setPlayerOccupation(String playerOccupation) {
        this.playerOccupation = playerOccupation;
    }
}
