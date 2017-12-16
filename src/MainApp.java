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
            login(conn);
                //Ride.requestRide(conn,"faiz","123456",60625);

                conn.close();
        }catch (SQLException e)
        {
                //System.out.println(e);
                e.printStackTrace();
        }

}



//This function shows the login menu
public static void loginMenu(Connection conn, String userName, String registrationNo, int destZip) throws SQLException
{
        //Frame frame = new JFrame("InputDialog Example #3");

        String[] options = new String[] {"Add a Car", "Create a Ride [for DRIVERS]", "Request A Ride / View Requested Ride Status [for RIDERS]", "View Previous Rides [for BOTH]", "View Requests/ Accept a Request","Exit"};
        String choice = (String)JOptionPane.showInputDialog(null,   "Welcome to Carpool - U. \n An Amazing Platform that helps you reach your University  \n Please select an option to proceed \n *NOTE: Right now only rides to the University are supported.* \n  *And, the default time for the start of all the rides is 9:00AM* \n"
                                                            , "MAIN MENU",
                                                            JOptionPane.PLAIN_MESSAGE,
                                                            null, options, options[0]);
        System.out.println(choice);
        if (choice == "Add a Car")
        {
                addCar(conn, userName);



        }
        else if(choice == "Create a Ride [for DRIVERS]")
        {


                try{

                        Ride.createRide(conn, userName, registrationNo, destZip);
                }
                catch (Exception e) {
                        System.out.println(e.toString());
                        JOptionPane.showMessageDialog(null, "Oh, looks like you don't have your car added yet. \n Lets add a car first!" + "\n Click Ok to Proceed");

                        addCar(conn, userName);
                        //e.printStackTrace();
                }

        }
        else if(choice ==  "Request A Ride [for RIDERS]") { Ride.requestRide(conn, userName, registrationNo,destZip);  }
        else if(choice ==  "View Previous Rides") {}
        else if(choice ==  "View Ride Request Status") {}
        else if(choice ==  "Exit")
        { System.exit(0);}

}


//After login this function will get all the user data and sent it to login Menu
public static void getUserDataShowMenu(Connection conn, String userName) throws SQLException
{

        String universityName = "";
        String lastName = "";
        String firstName = "";
        int phoneNo = 0;
        String registrationNo ="";
        int destZip =0;

        String sql = "SELECT universityName, lastName, firstName, phoneNo FROM User WHERE userName = \'" + userName + "\'";

        Statement statement = conn.createStatement();
        ResultSet result = statement.executeQuery(sql);
        while (result.next()) {

                universityName = result.getString(1);
                lastName = result.getString("lastName");
                firstName = result.getString("firstName");
                phoneNo = result.getInt("phoneNo");
        }
        sql = "SELECT registrationNo FROM Car WHERE owner = \'" + userName + "\'";

        statement = conn.createStatement();
        ResultSet result2 = statement.executeQuery(sql);
        while (result2.next()) {

                registrationNo = result2.getString("registrationNo");
        }
        sql = "SELECT zipcode FROM University WHERE universityName = \'" + universityName + "\'";

        statement = conn.createStatement();
        ResultSet result3 = statement.executeQuery(sql);

        while (result3.next()) {

                destZip = result3.getInt("zipcode");
        }

        loginMenu(conn, userName, registrationNo, destZip);
}


// add a car method
public static void addCar(Connection conn, String userName) throws SQLException
{
        JOptionPane.showMessageDialog(null, "Let's add your Car" + "\n Click Ok to Proceed");


        String registrationNo ="", owner ="", make ="", model ="", color ="";
        int year =0;

        registrationNo = Operation.stringInput(12);
        //owner = Operation.stringInput(13);
        make = Operation.stringInput(14);
        model = Operation.stringInput(15);
        color = Operation.stringInput(17);
        year = Operation.intInput(16);




        String sql = "INSERT INTO Car (registrationNo, owner, make, model, year, color)"
                     + "VALUES (?, ?, ?, ?, ? ,?)";

        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, registrationNo);
        statement.setString(2, userName);
        statement.setString(3, make);
        statement.setString(4, model);
        statement.setInt(5, year);
        statement.setString(6, color);


        int rowsAffected = statement.executeUpdate();
        if (rowsAffected > 0) {
                System.out.println("********** SUCCESS!!, CAR ADDED *********");
        }
}


//login method
public static void login(Connection conn) throws SQLException {

    String userName = "", password = "";

    userName = Operation.stringInput(5);
    password = Operation.stringInput(6);
    password = "\'" + password + "\'";


    System.out.println(userName + " trying to log in...");


    String sql = "SELECT COUNT(*) FROM User WHERE userName = \'" + userName +"\' AND password = SHA(" + password + ")";


    Statement statement = conn.createStatement();
    ResultSet result = statement.executeQuery(sql);


        while (result.next()) {

            int count = result.getInt(1);


            if (count == 0) {
                Object[] options = {"Create an Account", "Try Again", "Exit"};

                int choice = JOptionPane.showOptionDialog(null, //Component parentComponent
                        "We could not find a user with those credentials." + "\n Choose an option to proceed", //Object message,
                        "No User Found", //String title
                        JOptionPane.YES_NO_CANCEL_OPTION, //int optionType
                        JOptionPane.INFORMATION_MESSAGE, //int messageType
                        null, //Icon icon,
                        options, //Object[] options,
                        "Try Again"); //Object initialValue
                if (choice == 0) {
                    addUser(conn);
                } else if (choice == 1) {
                    login(conn);
                } else {
                    System.exit(0);
                }
            } else {
                System.out.println("Login success");


                getUserDataShowMenu(conn, userName);

            }

        }


    }



//select a university method
public static void selectUniversity(Connection conn) throws SQLException
{


        int zipcode = 0;
        String universityName = "";

        zipcode = Operation.intInput(4);


        String sql = "SELECT universityName FROM University WHERE zipcode = \'" + zipcode + "\'";

        Statement statement = conn.createStatement();
        ResultSet result = statement.executeQuery(sql);

        while (result.next()) {
                //    String guestNo = result.getString(1);
                universityName += "\n     " + result.getString(1);

        }

        if(universityName == "")
        {
                Object[] options = { "Add University","Search with different zipcode", "Exit"};

                int choice = JOptionPane.showOptionDialog(null, //Component parentComponent
                                                          "There are no universities having that zipcode at the moment" + "\n Choose an option to proceed", //Object message,
                                                          "No Universities Found", //String title
                                                          JOptionPane.YES_NO_CANCEL_OPTION, //int optionType
                                                          JOptionPane.INFORMATION_MESSAGE, //int messageType
                                                          null, //Icon icon,
                                                          options, //Object[] options,
                                                          "Add University");//Object initialValue
                if(choice == 0 ) {
                        addUniversity(conn);
                }else
                if(choice == 1 )
                {
                        selectUniversity(conn);
                } else
                {
                        System.exit(0);
                }
        }

        else
        {
                Object[]  options = { "Create an Account","Exit"};

                int choice = JOptionPane.showOptionDialog(null,          //Component parentComponent
                                                          "There are universities around " + zipcode + "\n Please type in the exact name while registering. [SEE NAMES BELOW]" + universityName,          //Object message,
                                                          "Universities Found",         //String title
                                                          JOptionPane.YES_NO_OPTION,         //int optionType
                                                          JOptionPane.INFORMATION_MESSAGE,         //int messageType
                                                          null,         //Icon icon,
                                                          options,         //Object[] options,
                                                          "Create an Account");        //Object initialValue
                if(choice == 0 ) {
                        addUser(conn);
                }else{
                        System.exit(0);
                }
        }

        System.out.println("***SELECT UNIVERSITY CALLED***");

}


//adding a university method
public static void addUniversity(Connection conn) throws SQLException
{
        JOptionPane.showMessageDialog(null, "Let's add your University" + "\n Click Ok to Proceed", "Add University",JOptionPane.PLAIN_MESSAGE);


        String universityName ="", city ="", state ="";
        int zipcode =0;

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


//adding a user method
public static void addUser(Connection conn) throws SQLException
{

    Object[] options = { "View Supported Universities","Create an Account"};

    int choice = JOptionPane.showOptionDialog(null, //Component parentComponent
            "Would you like to view supported Universities before creating an Account ?" + "\n Choose an option to proceed", //Object message,
            "CREATE ACCOUNT MENU", //String title
            JOptionPane.YES_NO_CANCEL_OPTION, //int optionType
            JOptionPane.INFORMATION_MESSAGE, //int messageType
            null, //Icon icon,
            options, //Object[] options,
            "Create an Account");//Object initialValue
    if(choice == 0 ) {

        selectUniversity(conn);
    } else






        JOptionPane.showMessageDialog(null, "Let's create an account for you." + "\n Click Ok to Proceed","Add User",JOptionPane.PLAIN_MESSAGE);

        String userName ="", password ="", universityName ="", lastName = "", firstName ="";
        int phoneNo =0;

        userName = Operation.stringInput(5); //initializing universityName,
        password = Operation.stringInput(6); //initializing city,
        universityName = Operation.stringInput(7); //initializing state,
        lastName = Operation.stringInput(8); //initializing state,
        firstName = Operation.stringInput(9); //initializing state,
        phoneNo = Operation.intInput(10); //initializing zipcode,

        String sql = "INSERT INTO User (userName, password, universityName, lastName, firstName, phoneNo)"
                     + "VALUES (?, SHA(?), ?, ?, ?, ?, ?)";

        PreparedStatement statement = conn.prepareStatement(sql);

        statement.setString(1, userName);
        statement.setString(2, password);
        statement.setString(3, universityName);
        statement.setString(4, lastName);
        statement.setString(5, firstName);
        statement.setInt(6, phoneNo);


        int rowsAffected = statement.executeUpdate();
        if (rowsAffected > 0) {
                System.out.println("********** SUCCESS!!, USER ADDED *********");
        }

    JOptionPane.showMessageDialog(null, "You account has been created successfully. \n Click Ok to Sign In");




}




////
//public static void deleteUser(Connection conn, String userName) throws SQLException
//    {
//
//        Object[] options = { "View Supported Universities","Create an Account"};
//
//        int choice = JOptionPane.showOptionDialog(null, //Component parentComponent
//                "Would you like to view supported Universities before creating an Account ?" + "\n Choose an option to proceed", //Object message,
//                "CREATE ACCOUNT MENU", //String title
//                JOptionPane.YES_NO_CANCEL_OPTION, //int optionType
//                JOptionPane.INFORMATION_MESSAGE, //int messageType
//                null, //Icon icon,
//                options, //Object[] options,
//                "Create an Account");//Object initialValue
//        if(choice == 0 ) {
//
//            selectUniversity(conn);
//        } else
//
//
//
//
//
//
//            JOptionPane.showMessageDialog(null, "Let's create an account for you." + "\n Click Ok to Proceed","Add User",JOptionPane.PLAIN_MESSAGE);
//
//        String userName ="", password ="", universityName ="", lastName = "", firstName ="";
//        int phoneNo =0;
//
//        userName = Operation.stringInput(5); //initializing universityName,
//        password = Operation.stringInput(6); //initializing city,
//        universityName = Operation.stringInput(7); //initializing state,
//        lastName = Operation.stringInput(8); //initializing state,
//        firstName = Operation.stringInput(9); //initializing state,
//        phoneNo = Operation.intInput(10); //initializing zipcode,
//
//        String sql = "INSERT INTO User (userName, password, universityName, lastName, firstName, phoneNo)"
//                + "VALUES (?, SHA(?), ?, ?, ?, ?, ?)";
//
//        PreparedStatement statement = conn.prepareStatement(sql);
//
//        statement.setString(1, userName);
//        statement.setString(2, password);
//        statement.setString(3, universityName);
//        statement.setString(4, lastName);
//        statement.setString(5, firstName);
//        statement.setInt(6, phoneNo);
//
//
//        int rowsAffected = statement.executeUpdate();
//        if (rowsAffected > 0) {
//            System.out.println("********** SUCCESS!!, USER ADDED *********");
//        }
//
//        JOptionPane.showMessageDialog(null, "You account has been created successfully. \n Click Ok to Sign In");
//
//
//
//
//    }


}
