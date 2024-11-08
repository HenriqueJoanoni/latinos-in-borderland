package model;

public class InjuryLog {
    private int injuryId;
    private String injuryType;
    private String severity;
    private int playerId;

    public InjuryLog(int injuryId, String injuryType, String severity, int playerId) {
        this.injuryId = injuryId;
        this.injuryType = injuryType;
        this.severity = severity;
        this.playerId = playerId;
    }

    public int getInjuryId() {
        return injuryId;
    }

    public void setInjuryId(int injuryId) {
        this.injuryId = injuryId;
    }

    public String getInjuryType() {
        return injuryType;
    }

    public void setInjuryType(String injuryType) {
        this.injuryType = injuryType;
    }

    public String getSeverity() {
        return severity;
    }

    public void setSeverity(String severity) {
        this.severity = severity;
    }

    public int getPlayerId() {
        return playerId;
    }

    public void setPlayerId(int playerId) {
        this.playerId = playerId;
    }
}
