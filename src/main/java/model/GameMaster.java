package model;

public class GameMaster {
    private int gameMasterId;
    private String gameMasterRole;

    public GameMaster(int gameMasterId, String gameMasterRole) {
        this.gameMasterId = gameMasterId;
        this.gameMasterRole = gameMasterRole;
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
}
