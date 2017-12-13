import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.math.BigDecimal;
import java.sql.ResultSet;

public class OperationsCode {

    public static void main(String[] args){

	try {
	    Connection conn = Connect.getConnection();
	    // change this to whatever method you want to test.
	    // Make sure the Connect.java points to your database
	    selectExample(conn);
	    conn.close();
	}catch (SQLException e) {
	    e.printStackTrace();
	}
    }

    public static void insertExample(Connection conn) throws SQLException {
	String sql = "INSERT INTO Booking (guestNo, dateArrive, dateDepart, price, roomNo, notes)"
	            + "VALUES (?, ?, ?, ?,?,?)";

	PreparedStatement statement = conn.prepareStatement(sql);
	statement.setInt(1,34);
	statement.setDate(2, java.sql.Date.valueOf("2018-03-07"));
	statement.setDate(3, java.sql.Date.valueOf("2018-03-13"));
	statement.setBigDecimal(4, new BigDecimal("390.50"));
	statement.setInt(5, 325);
	statement.setString(6, "Do not disturb");

	int rowsAffected = statement.executeUpdate();
	if (rowsAffected > 0) {
    	   System.out.println("A new booking was inserted successfully!");
	}
    }

    public static void updateExample(Connection conn) throws SQLException {
	String sql = "UPDATE Booking SET price=?, notes=? WHERE guestNo=?";
	PreparedStatement statement = conn.prepareStatement(sql);

	statement.setBigDecimal(1, new BigDecimal("450.00"));
	statement.setString(2, "Premium toiletry requested");
	statement.setInt(3,34);

	int rowsAffected = statement.executeUpdate();
	if (rowsAffected > 0) {
	   System.out.println("Successfully updated "+rowsAffected+"row(s)");
	}

    }

    public static void deleteExample(Connection conn) throws SQLException {
	String sql = "DELETE FROM Booking WHERE dateArrive=?";

	PreparedStatement statement = conn.prepareStatement(sql);

	statement.setDate(1, java.sql.Date.valueOf("2018-03-07"));
	int rowsAffected = statement.executeUpdate();
	if (rowsAffected > 0) {
	   System.out.println("Successfully deleted "+rowsAffected+"row(s)");
	}

    }

    public static void selectExample(Connection conn) throws SQLException {
	String sql = "SELECT * FROM Booking";

	Statement statement = conn.createStatement();
	ResultSet result = statement.executeQuery(sql);

	while (result.next()){
    	      String guestNo = result.getString(1);
    	      String dateArrive = result.getString(2);
    	      String dateDepart = result.getString("dateDepart");
    	      BigDecimal price = result.getBigDecimal("price");
	      int roomNo = result.getInt("roomNo");
	      String notes = result.getString("notes");

	      System.out.println(guestNo+" - "+dateArrive+" - "+dateDepart+" - "+price+" - "+roomNo+" - "+notes);
	}
    }

}
