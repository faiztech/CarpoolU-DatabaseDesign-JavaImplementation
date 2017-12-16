import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;


public class Ride {


        public static void viewRequestsDriver(Connection conn, String userName, String registrationNo, int destZip) throws SQLException {


                int counter = 0, rideID = 0;

                String[] rideRequests = new String[100];
                int[] rideIDIndex = new int[100];
                for (int i = 0; i < 100; i++) {
                        rideRequests[i] = "";
                        rideIDIndex[i] = 0;

                }


                //retrieving ride request data
                String sql = "SELECT Ride.rideID,RideRequest.requestedBy, Ride.sourceZip, RideRequest.requestStatus  FROM RideRequest, Ride WHERE (Ride.rideID = RideRequest.rideID) AND driver = \'" + userName + "\'";


                Statement statement = conn.createStatement();
                ResultSet result = statement.executeQuery(sql);

                while (result.next()) {

                        //rideIDIndex[counter] = result2.getInt ("rideID");

                        rideRequests[counter] += "   REQUESTED BY:  \'" + result.getString("requestedBy") + " ||  STARTING FROM:  " + result.getString("sourceZip") + " || DRIVER:  " + result.getString("driver")
                                + " || REQUEST STATUS:  ";

                        if (result.getInt("requestStatus") == 0)
                                rideRequests[counter] += "  PENDING...  ";
                        else
                                rideRequests[counter] += "  ACCEPTED  ";
                        counter++;
                }

                //if no requests
                if (counter == 0) {

                        JOptionPane.showMessageDialog(null, "Sorry there are no requests for your rides right now. \n Click Ok to Proceed");


                } else {


                        String requests = (String) JOptionPane.showInputDialog(null, "Here are the requests for your rides. \n Please select one to accept it."
                                , "Requests Available",
                                JOptionPane.PLAIN_MESSAGE,
                                null, rideRequests, rideRequests[0]);

                        for (int i = 0; i < 100; i++) {
                                if (rideRequests[i] == requests)
                                        rideID = rideIDIndex[i];


                        }
                        acceptRide(conn, userName, rideID, registrationNo, destZip);
                        System.out.println(rideID);
                }

        MainApp.loginMenu(conn,userName,registrationNo,destZip);

        //  return rideID;


//                JOptionPane.showMessageDialog(null, "Here are the statuses of your requested rides: \n "+rideRequestStatus+"\n Click Ok to Proceed");
//                MainApp.loginMenu(conn, userName, registrationNo, destZip);


}


//UPDATING HERE
public static void acceptRide(Connection conn, String userName,int rideID, String registrationNo, int destZip) throws SQLException
{



        String sql = "UPDATE RideRequest SET requestStatus= 1 WHERE rideID=?";
        PreparedStatement statement = conn.prepareStatement(sql);

        statement.setInt(1,rideID);


        int rowsAffected = statement.executeUpdate();
        if (rowsAffected > 0) {
                System.out.println("********** SUCCESS!!, REQUEST ACCEPTED *********");


}








}








//name explains
public static int requestRide2(Connection conn, String userName,String registrationNo, int destZip) throws SQLException
{

        int sourceZip = 0, counter = 0, rideID = 0;
        String universityName ="";
        String [] rideRequests = new String[100];
        int [] rideIDIndex = new int[100];
        for (int i= 0; i <100; i++ ) {
                rideRequests[i] = "";
                rideIDIndex[i] = 0;

        }



        String sql = " SELECT universityName FROM User WHERE userName = \'" +userName +"\'";
        Statement statement = conn.createStatement();
        ResultSet result = statement.executeQuery(sql);

        while (result.next()) {

                universityName = result.getString("universityName");
        }


        sourceZip = Operation.intInput(21);
        JOptionPane.showMessageDialog(null, "By default: We have already taken the destination to be your University \n" + universityName + "\n Click Ok to Proceed");

        //retrieving ride request data
        sql = "SELECT rideID, date, driver, rideStatus FROM Ride WHERE (sourceZip = " + sourceZip + " AND destZip = (SELECT zipcode FROM UNIVERSITY WHERE universityName = \'"+universityName+"\'))";

        //  SELECT date, driver, rideStatus FROM Ride WHERE (sourceZip = 60000 AND destZip = (SELECT zipcode FROM UNIVERSITY WHERE universityName = "Northeastern Illinois University"));


        statement = conn.createStatement();
        ResultSet result2 = statement.executeQuery(sql);

        while (result2.next()) {
                rideIDIndex[counter] = result2.getInt ("rideID");

                rideRequests[counter] += "  DATE:  " +result2.getString("date") + " || DRIVER:  " +result2.getString("driver") + " || STATUS:  ";

                if(result2.getInt("rideStatus") == 0)
                        rideRequests[counter] += "AVAILABLE  ";
                else
                        rideRequests[counter] += "NOT AVAILABLE  ";
                counter++;
        }

        if(counter ==0)
        {
                Object[] options = { "Back to Main Menu", "Exit"};

                int choice = JOptionPane.showOptionDialog(null, //Component parentComponent
                                                          "Sorry, there are no rides available at the moment \n Please check back later." + "\n Choose an option to proceed", //Object message,
                                                          "No Rides Found", //String title
                                                          JOptionPane.YES_NO_CANCEL_OPTION, //int optionType
                                                          JOptionPane.INFORMATION_MESSAGE, //int messageType
                                                          null, //Icon icon,
                                                          options, //Object[] options,
                                                          "Back to Main Menu"); //Object initialValue
                if(choice == 0 ) {
                        MainApp.loginMenu(conn, userName, registrationNo, destZip);
                }else

                        System.exit(0);
        }


        else {
                String ride = (String)JOptionPane.showInputDialog(null,   "Here are the Rides available right now \n Please select one to book it."
                                                                  , "Rides Available",
                                                                  JOptionPane.PLAIN_MESSAGE,
                                                                  null, rideRequests, rideRequests[0]);

                for (int i= 0; i < 100; i++ ) {
                        if(rideRequests[i] == ride)
                                rideID = rideIDIndex[i];


                }
                createRideRequest(conn, userName, rideID, registrationNo, destZip);
                System.out.println(rideID);
        }

        MainApp.loginMenu(conn, userName, registrationNo, destZip);

        return rideID;



}


public static void createRideRequest(Connection conn, String userName, int rideID, String registrationNo, int destZip) throws SQLException {

                String sql = "INSERT INTO RideRequest (requestedBy, rideID)"
                        + "VALUES (?, ?)";

                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, userName);

                statement.setInt(2, rideID);


                int rowsAffected = statement.executeUpdate();
                if (rowsAffected > 0) {
                        System.out.println("********** SUCCESS!!, RIDE REQUEST ADDED SUCCESSFULLY *********");


                }

                JOptionPane.showMessageDialog(null, "You have successfully Requested the Ride \n Click Ok to Proceed");

                MainApp.loginMenu(conn, userName, registrationNo, destZip);


        }



public static void viewRequestStatusRider(Connection conn, String userName, String registrationNo, int destZip) throws SQLException {


                String  rideRequestStatus = "";

                //retrieving ride request data
                String sql = "SELECT Ride.rideID, Ride.sourceZip, Ride.driver, RideRequest.requestStatus, RideRequest.requestedBy FROM RideRequest, Ride WHERE (Ride.rideID = RideRequest.rideID) AND requestedBy = \'" + userName +"\'";



                Statement statement = conn.createStatement();
                ResultSet result = statement.executeQuery(sql);

                while (result.next()) {
                        //rideIDIndex[counter] = result2.getInt ("rideID");

                        rideRequestStatus += "  STARTING FROM:  " +result.getString("sourceZip") + " || DRIVER:  " +result.getString("driver") + " || REQUESTED BY:  " +result.getString("requestedBy") + " || REQUEST STATUS:  " ;

                        if(result.getInt("requestStatus") == 0)
                                rideRequestStatus += "  PENDING...  ";
                        else
                                rideRequestStatus += "  ACCEPTED  ";
                }

              JOptionPane.showMessageDialog(null, "Here are the status' of your requested rides: \n "+rideRequestStatus+"\n Click Ok to Proceed");
               MainApp.loginMenu(conn, userName, registrationNo, destZip);


        }



//this function allows to request a ride that are Available
public static void requestRide(Connection conn, String userName,String registrationNo, int destZip) throws SQLException
{
        Object[] options = { "Request an Available Ride","View Request Status", "Exit"};
        int rideID = 0;

        int choice = JOptionPane.showOptionDialog(null,   //Component parentComponent
                                                  "Please choose an option to proceed",   //Object message,
                                                  "Request Ride Menu",   //String title
                                                  JOptionPane.YES_NO_CANCEL_OPTION,   //int optionType
                                                  JOptionPane.INFORMATION_MESSAGE,   //int messageType
                                                  null,   //Icon icon,
                                                  options,   //Object[] options,
                                                  "Request an Available Ride");   //Object initialValue
        if(choice == 0 ) {

               rideID = requestRide2(conn,userName,registrationNo,destZip);
        }else
        if(choice == 1 )
        {
                viewRequestStatusRider(conn, userName, registrationNo, destZip);
                //login(conn);
                //find a way to get ride ID here

        } else
        {
                System.exit(0);
        }
}


//MySQLIntegrityConstraintViolationException
public static void createRide(Connection conn, String userName,String registrationNo, int destZip) throws SQLException
{
        JOptionPane.showMessageDialog(null, "Let's create a Ride" + "\n Click Ok to Proceed");


        String date = "";
        int sourceZip =0, seatsAvl = 0;

        date = Operation.stringInput(20);
        sourceZip = Operation.intInput(21);


        String sql = "INSERT INTO Ride (driver, registrationNo, date, sourceZip, destZip)"
                     + "VALUES (?, ?, ?, ?, ?)";

        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, userName);
        statement.setString(2, registrationNo);
        statement.setString(3, date);
        statement.setInt(4, sourceZip);
        statement.setInt(5, destZip);



        int rowsAffected = statement.executeUpdate();
        if (rowsAffected > 0) {
                System.out.println("********** SUCCESS!!, RIDE ADDED *********");
        }
}



}
