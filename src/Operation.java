import javax.swing.JOptionPane;

public class Operation {

static int result;
static boolean inputTaken;
static String placeholder;

//This function processes a String Input
public static String stringInput(String userEntry)
{
        inputTaken = false;

        while (!inputTaken)
        {
                userEntry = JOptionPane.showInputDialog("Enter" + "[Type EXIT to quit]");

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
public static int intInput(int intEntry)
{
        inputTaken = false;
        String userEntry;

        while (!inputTaken)
        {
                userEntry = JOptionPane.showInputDialog("ENTER" + "[Type EXIT to quit]");

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
public static int dateInput(int userEntry)
{
        inputTaken = false;
        userEntry;

        while (!inputTaken)
        {
                userEntry = JOptionPane.showInputDialog("ENTER" + "(in YYYY-MM-DD format) [Type EXIT to quit]");

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













}
