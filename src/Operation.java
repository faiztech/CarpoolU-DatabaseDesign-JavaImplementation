import javax.swing.JOptionPane;

public class Operation {

static int result;
static boolean inputTaken;
static String placeholder;



//This function processes a String Input
public static String stringInput(int code)
{
        inputTaken = false;
        String userEntry = "";


        placeholder = Placeholder(code);

        while (!inputTaken)
        {
                userEntry = JOptionPane.showInputDialog("Enter " + placeholder + " [Type EXIT to quit]");

                if (userEntry.isEmpty())
                {
                        JOptionPane.showMessageDialog(null, "Error you did not enter a value, please try again.", "Error",
                                                      JOptionPane.ERROR_MESSAGE);
                } else if (userEntry.equals("EXIT"))
                {
                        result = JOptionPane.showConfirmDialog(null,
                                                               "Are you sure you want to exit?",
                                                               "Confirm EXIT", JOptionPane.YES_NO_CANCEL_OPTION);
                        if (result == JOptionPane.YES_OPTION) System.exit(0);

                        inputTaken = true;
                }
                else
                {
                        inputTaken = true;
                }
        }
        return userEntry;
}


//This function processes an Integer Input
public static int intInput(int code)
{
        inputTaken = false;
        placeholder = Placeholder(code);
        String userEntry = "";
        int intEntry =0;


        while (!inputTaken)
        {
                userEntry = JOptionPane.showInputDialog("ENTER " +placeholder+ " [Type EXIT to quit]");

                if (userEntry.isEmpty())
                {
                        JOptionPane.showMessageDialog(null, "Error you did not enter a value, please try again.", "Error",
                                                      JOptionPane.ERROR_MESSAGE);
                } else if (userEntry.equals("EXIT"))
                {
                        result = JOptionPane.showConfirmDialog(null,
                                                               "Are you sure you want to exit?",
                                                               "Confirm EXIT", JOptionPane.YES_NO_CANCEL_OPTION);
                        if (result == JOptionPane.YES_OPTION) System.exit(0);

                        inputTaken = true;
                }
                else
                {
                        intEntry = Integer.parseInt(userEntry);

                        inputTaken = true;
                }

        }
        return intEntry;
}

//"2018-03-07"


//This function processes a Date Input
public static String dateInput(int code)
{
        inputTaken = false;
        placeholder = Placeholder(code);
        String userEntry = "";

        while (!inputTaken)
        {
                userEntry = JOptionPane.showInputDialog("ENTER " + placeholder +"(in YYYY-MM-DD format) [Type EXIT to quit]");

                if (userEntry.isEmpty())
                {
                        JOptionPane.showMessageDialog(null, "Error you did not enter a value, please try again.", "Error",
                                                      JOptionPane.ERROR_MESSAGE);
                } else if (userEntry.equals("EXIT"))
                {
                        result = JOptionPane.showConfirmDialog(null,
                                                               "Are you sure you want to exit?",
                                                               "Confirm EXIT", JOptionPane.YES_NO_CANCEL_OPTION);
                        if (result == JOptionPane.YES_OPTION) System.exit(0);

                        inputTaken = true;
                }
                else
                {
                        inputTaken = true;
                }

        }
        return userEntry;
}

// This function processes the placeholder
public static String Placeholder (int value)
{
        String string;
        switch(value)
        {
        case 1:   string = "the name of your University.";
                break;
        case 2:  string = "the name of the city in which your University is located.";
                break;
        case 3:  string = "the name of the state in which your University is located.";
                break;
        case 5:  string = "username.";
                break;
        case 6:  string = "password.";
                break;
        case 7:  string = "the name of your University.";
                break;
        case 8:  string = "your Last Name.";
                break;
        case 9:  string = "your First Name";
                break;
        case 11: string = "your License Number.";
                break;
        case 12: string = "your Registation Number.";
                break;
        case 14: string = "the make of your car.";
                break;
        case 15: string = "the model of your car.";
                break;
        case 17: string = "the color of your car.";
                break;
        case 20: string = "the date on which you will be travelling.";
                break;
        case 25: string = "your username.";
                break;
        case 4:   string = "the zipcode where your University is located [Integers only].";
                break;
        case 10:  string = "your phone number.";
                break;
        case 16:  string = "the make year.";
                break;
        case 18:  string = "ride ID.";
                break;
        case 21:  string = "the zipcode from where you will be travelling.";
                break;
        case 22:  string = "the zipcode to where you will be travelling.";
                break;
        case 23:  string = "the number of seats you are willing to offer.";
                break;
        case 24:  string = "request ID";
                break;
        case 26: string = "ride ID.";
                break;

        default: string = "value";
                break;
        }

        return string;
}












}
