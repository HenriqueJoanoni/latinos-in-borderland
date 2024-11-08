package DAO;

import model.Player;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PlayerDAO extends BaseDAO {

    /**
     * CREATE NEW PLAYER INTO DATABASE
     *
     * @param player Player
     * @return SQLException | boolean
     */
    public boolean createNewPlayer(Player player) {
        String sql = "INSERT INTO player (" +
                "player_id, " +
                "player_name, " +
                "player_age, " +
                "player_gender, " +
                "player_occupation)" +
                "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, player.getPlayerId());
            stmt.setString(2, player.getPlayerName());
            stmt.setInt(3, player.getPlayerAge());
            stmt.setString(4, player.getGender());
            stmt.setString(5, player.getPlayerOccupation());

            int inserted = stmt.executeUpdate();
            return inserted > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    /**
     * RETRIEVE A PLAYER BY ID
     *
     * @param playerId int
     * @return SQLException | Player
     */
    public Player getPlayerById(int playerId) {
        String query = "SELECT * FROM player WHERE player_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, playerId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Player(
                        rs.getInt("player_id"),
                        rs.getString("player_name"),
                        rs.getInt("player_age"),
                        rs.getString("player_gender"),
                        rs.getString("player_occupation")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * RETRIEVE ALL PLAYERS FROM DATABASE
     *
     * @return SQLException | List<Player>
     */
    public List<Player> getAllPlayers() {
        List<Player> players = new ArrayList<>();
        String query = "SELECT * FROM player";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Player player = new Player(
                        rs.getInt("player_id"),
                        rs.getString("player_name"),
                        rs.getInt("player_age"),
                        rs.getString("player_gender"),
                        rs.getString("player_occupation")
                );
                players.add(player);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return players;
    }

    /**
     * UPDATE PLAYER INTO DATABASE
     *
     * @param player Player
     * @return SQLException | boolean
     */
    public boolean updatePlayer(Player player) {
        String query = "UPDATE player SET " +
                "player_name = ?, " +
                "player_age = ?, " +
                "player_gender = ?, " +
                "player_occupation = ? " +
                "WHERE player_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, player.getPlayerName());
            stmt.setInt(2, player.getPlayerAge());
            stmt.setString(3, player.getGender());
            stmt.setString(4, player.getPlayerOccupation());
            stmt.setInt(5, player.getPlayerId());

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * DELETE PLAYER FROM DATABASE
     *
     * @param playerId int
     * @return SQLException | boolean
     */
    public boolean deletePlayer(int playerId) {
        String query = "DELETE FROM player WHERE player_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, playerId);
            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
