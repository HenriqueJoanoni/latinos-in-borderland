import DAO.PlayerDAO;
import model.Player;

public class Main {
    public static void main(String[] args) {
        PlayerDAO playerDAO = new PlayerDAO();

        /** GET PLAYER BY ID */
        Player player = playerDAO.getPlayerById(1);
        if (player != null) {
            System.out.println("Player info: " + player.getPlayerName());
        }

        /** GET ALL PLAYERS */
        System.out.println("All Players being displayed: ");
        for (Player pl : playerDAO.getAllPlayers()) {
            System.out.printf("ID: %d | Name: %s\r\n", pl.getPlayerId(), pl.getPlayerName());
        }
    }
}
