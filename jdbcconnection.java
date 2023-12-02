import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
 
public class JdbcPostgresqlConnection {
 
    public static void main(String[] args) {
        // create database connection on localhost
    	String connectionURL = "jdbc:postgresql://localhost:5433/essence_boutique";
    	String userName = "postgres";
    	String passWord = "Spoon49!";
    	
    	try {
			Connection conn = DriverManager.getConnection(connectionURL, userName, passWord);
			System.out.println("Postgres server has been connected");
			
			/*String sqlCode = "customers";
			Statement blank = conn.createStatement();
			int countRows = blank.executeUpdate(sqlCode);
			
			if(countRows > 15) {
				System.out.println("A new customer has been added!");
			}
			*/
			conn.close();
    	} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Postgres connection error.");
			e.printStackTrace();
		}
    }
}
    
        
