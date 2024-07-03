package SMS;
import java.sql.*;
import java.util.*;
public class dbConnection{
    private Connection con=null;
    private Statement st = null;
    private ResultSet rs = null;

    public dbConnection() {
        try{
            Class.forName("org.sqlite.JDBC");
            this.con = DriverManager.getConnection("jdbc:sqlite:SMS.db");
            this.st = con.createStatement();
        }catch(SQLException | ClassNotFoundException e){
            System.out.println(e+"");
        }
    }

    public ResultSet data(String sql) {
        try{
            this.rs = this.st.executeQuery(sql);
        }catch(SQLException e){
            System.out.println(e+"");
        }
        return this.rs;
    }

    public int indata(String sql) {
        int i=1000;
        try{
            i = this.st.executeUpdate(sql);
            return i;
        }catch(SQLException e){
            System.out.println(e+"");
            return i;
        }
    }

    public int get_id(String sql){
        int i = 0;
        try{
            this.rs = this.st.executeQuery(sql);
            rs.next();
            i = rs.getInt("rowcount");
        }catch(SQLException e){
            System.out.println(e+"");
        }
        return i;
    }

    public void closeConnection(){
        try{
            this.st.close();
            this.con.close();
            }catch(SQLException e){
                System.out.println(e+"");
            }
        }
}