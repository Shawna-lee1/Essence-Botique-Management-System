import java.sql.* ;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

class cntJDBC
{
    public static void main ( String [ ] args ) throws SQLException
    {
      
  String tableName="";
        String sqlState="00000";
        int sqlCode = 0; 

  if ( args.length > 0 ) {
      tableName += args[0];
  }
  else {
      tableName += "example3.tbl";
  }
    }
}