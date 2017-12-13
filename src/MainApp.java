import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;

public class MainApp
{

public static void main(String[] args) {

        try {
                Connection conn = Connect.getConnection();
                // change this to whatever method you want to test.
                // Make sure the Connect.java points to your database
                addUniversity(conn);
                conn.close();
        }catch (SQLException e)
        {
                e.printStackTrace();
        }

}






//adding a university method
public static void addUniversity(Connection conn) throws SQLException
{


        String universityName ="", city ="", state ="";
        int zipcode =0;
        boolean inputTaken = false;

        universityName = Operation.stringInput(universityName);
        city = Operation.stringInput(city);
        state = Operation.stringInput(state);
        zipcode = Operation.intInput(zipcode);




        String sql = "INSERT INTO University (universityName, city, state, zipcode)"
                     + "VALUES (?, ?, ?, ?)";

        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, universityName);
        statement.setString(2, city);
        statement.setString(3, state);
        statement.setInt(4, zipcode);



        int rowsAffected = statement.executeUpdate();
        if (rowsAffected > 0) {
                System.out.println("SUCCESS!!, YOU ARE AMAZING");
        }
}



// public static login()
// {
//
//
//
//
//
// }
}
