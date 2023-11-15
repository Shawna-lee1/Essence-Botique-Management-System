package comp421;
import java.sql.* ;

public class SQL {
	Statement statement;
		public SQL() throws SQLException
		{
		try {
			    DriverManager.registerDriver(new org.postgresql.Driver());
			} catch (Exception cnfe)
      {
			  System.out.println("Class not found");
			    }	 
