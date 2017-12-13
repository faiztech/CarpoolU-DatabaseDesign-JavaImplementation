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
                //System.out.println(e);
                e.printStackTrace();
        }

}








//adding a university method
public static void addUniversity(Connection conn) throws SQLException
{

        String universityName ="", city ="", state ="";
        int zipcode =0;
        boolean inputTaken = false;

        universityName = Operation.stringInput(1); //initializing universityName,
        city = Operation.stringInput(2); //initializing city,
        state = Operation.stringInput(3); //initializing state,
        zipcode = Operation.intInput(4); //initializing zipcode,




        String sql = "INSERT INTO University (universityName, city, state, zipcode)"
                     + "VALUES (?, ?, ?, ?)";

        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, universityName);
        statement.setString(2, city);
        statement.setString(3, state);
        statement.setInt(4, zipcode);


        int rowsAffected = statement.executeUpdate();
        if (rowsAffected > 0) {
                System.out.println("********** SUCCESS!!, UNIVERSITY ADDED *********");
        }
}


//START HERE
//
// //adding a university method
// public static void addUser(Connection conn) throws SQLException
// {
//
//         String userName ="", password ="", universityName ="";
//         int zipcode =0;
//         boolean inputTaken = false;
//
//         universityName = Operation.stringInput(1); //initializing universityName,
//         city = Operation.stringInput(2); //initializing city,
//         state = Operation.stringInput(3); //initializing state,
//         zipcode = Operation.intInput(4); //initializing zipcode,
//
//
//
//
//         String sql = "INSERT INTO University (universityName, city, state, zipcode)"
//                      + "VALUES (?, ?, ?, ?)";
//
//         PreparedStatement statement = conn.prepareStatement(sql);
//         statement.setString(1, universityName);
//         statement.setString(2, city);
//         statement.setString(3, state);
//         statement.setInt(4, zipcode);
//
//
//         int rowsAffected = statement.executeUpdate();
//         if (rowsAffected > 0) {
//                 System.out.println("********** SUCCESS!!, UNIVERSITY ADDED *********");
//         }
// }



// public static login()
// {
//
//
//
//
//
// }
}
