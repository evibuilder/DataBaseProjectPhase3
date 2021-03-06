package phase2;


import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Statistics {

	public Statistics(){}
	
	//returns as a string, a list of the most popular TH
	public String mostPopularTH(int numberOfResults, Statement stmt){
		String result = "";
		String sql = "select h.name, count(h.hid) as totalVisits, h.category "
				+ "from Visit v, Housing h where"
				+ " v.hid = h.hid AND h.category = 'Condo' "
				+ "group by (h.hid) "
				+ "order by (h.hid)";
		
		ResultSet rs = null;
		ResultSetMetaData rsmd = null;
		
		result += "Condo:\n";
		try{
			rs = stmt.executeQuery(sql);
			rsmd = rs.getMetaData();
			int colCount = rsmd.getColumnCount();
		
			//System.out.println("Name  Visits  Category");
			int count = 0;
			while(rs.next() && count < numberOfResults){
				count++;
				for(int i = 1; i <= colCount; i++){
					//System.out.print(rs.getString(i) + "  ");
					result += rs.getString(i) + "  ";
				}
				result += "\n";
			}
		}		 	
		catch(SQLException e)
	 	{
			System.err.println("cannot execute the query");
			System.err.println("error: " + e.getMessage());
	 	}
		
		sql = "select h.name, count(h.hid) as totalVisits, h.category "
				+ "from Visit v, Housing h where"
				+ " v.hid = h.hid AND h.category = 'Studio' "
				+ "group by (h.hid) "
				+ "order by (h.hid)";
		
		rs = null;
		rsmd = null;
		result += "Studio:\n";
		try{
			rs = stmt.executeQuery(sql);
			rsmd = rs.getMetaData();
			int colCount = rsmd.getColumnCount();
			
			int count = 0;
			while(rs.next() && count < numberOfResults){
				count++;
				for(int i = 1; i <= colCount; i++){
					//System.out.print(rs.getString(i) + "  ");
					result += rs.getString(i) + "  ";
				}
				result += "\n";
			}
		}		 	
		catch(SQLException e)
	 	{
			System.err.println("cannot execute the query");
			System.err.println("error: " + e.getMessage());
	 	}
		
		sql = "select h.name, count(h.hid) as totalVisits, h.category "
				+ "from Visit v, Housing h where"
				+ " v.hid = h.hid AND h.category = 'House' "
				+ "group by (h.hid) "
				+ "order by (h.hid)";
		
		rs = null;
		rsmd = null;
		result += "House:\n";
		try{
			rs = stmt.executeQuery(sql);
			rsmd = rs.getMetaData();
			int colCount = rsmd.getColumnCount();
			
			int count = 0;
			while(rs.next() && count < numberOfResults){
				count++;
				for(int i = 1; i <= colCount; i++){
					//System.out.print(rs.getString(i) + "  ");
					result += rs.getString(i) + "  ";
				}
				result += "\n";
			}
		}		 	
		catch(SQLException e)
	 	{
			System.err.println("cannot execute the query");
			System.err.println("error: " + e.getMessage());
	 	}
		return result;
	}
	
	//returns as a string, a list of the most expensive TH
	public String mostExpensiveTH(int numberOfResults, Statement stmt){
		String result = "";
		String sql = "select h.name, avg(cost) as avgCost, h.category "
				+ "from Visit v, Housing h where"
				+ " v.hid = h.hid AND h.category = 'Condo' "
				+ "group by (h.hid) "
				+ "order by (avgCost) DESC";
		
		ResultSet rs = null;
		ResultSetMetaData rsmd = null;
		
		result += "Condo:\n";
		try{
			rs = stmt.executeQuery(sql);
			rsmd = rs.getMetaData();
			int colCount = rsmd.getColumnCount();
		
			//System.out.println("Name  AvgCost  Category");
			int count = 0;
			while(rs.next() && count < numberOfResults){
				count++;
				for(int i = 1; i <= colCount; i++){
					//System.out.print(rs.getString(i) + "  ");
					result += rs.getString(i) + "  ";
				}
				result += "\n";
			}
		}		 	
		catch(SQLException e)
	 	{
			System.err.println("cannot execute the query");
			System.err.println("error: " + e.getMessage());
	 	}
		
		sql = "select h.name, avg(cost) as avgCost, h.category "
				+ "from Visit v, Housing h where"
				+ " v.hid = h.hid AND h.category = 'Studio' "
				+ "group by (h.hid) "
				+ "order by (avgCost) DESC";
		
		rs = null;
		rsmd = null;
		
		result += "Studio:\n";
		try{
			rs = stmt.executeQuery(sql);
			rsmd = rs.getMetaData();
			int colCount = rsmd.getColumnCount();
		
			int count = 0;
			while(rs.next() && count < numberOfResults){
				count++;
				for(int i = 1; i <= colCount; i++){
					//System.out.print(rs.getString(i) + "  ");
					result += rs.getString(i) + "  ";
				}
				result += "\n";
			}
		}		 	
		catch(SQLException e)
	 	{
			System.err.println("cannot execute the query");
			System.err.println("error: " + e.getMessage());
	 	}
		
		sql = "select h.name, avg(cost) as avgCost, h.category "
				+ "from Visit v, Housing h where"
				+ " v.hid = h.hid AND h.category = 'House' "
				+ "group by (h.hid) "
				+ "order by (avgCost) DESC";
		
		rs = null;
		rsmd = null;
		
		result += "House:\n";
		try{
			rs = stmt.executeQuery(sql);
			rsmd = rs.getMetaData();
			int colCount = rsmd.getColumnCount();
		
			int count = 0;
			while(rs.next() && count < numberOfResults){
				count++;
				for(int i = 1; i <= colCount; i++){
					//System.out.print(rs.getString(i) + "  ");
					result += rs.getString(i) + "  ";
				}
				result += "\n";
			}
		}		 	
		catch(SQLException e)
	 	{
			System.err.println("cannot execute the query");
			System.err.println("error: " + e.getMessage());
	 	}
		return result;
	}
	
	//returns as a string, a list of the most highly rated PH
	public String mostHighlyRatedPH(int numberOfResults, Statement stmt){
		String result = "";
		String sql = "select h.name, avg(score) as avgScore, h.category "
				+ "from Feedback f, Housing h where"
				+ " f.hid = h.hid AND h.category = 'Condo' "
				+ "group by (h.hid) "
				+ "order by (avgScore) DESC";
		
		ResultSet rs = null;
		ResultSetMetaData rsmd = null;
		
		result += "Condo:\n";
		try{
			rs = stmt.executeQuery(sql);
			rsmd = rs.getMetaData();
			int colCount = rsmd.getColumnCount();
		
			//System.out.println("Name  avgScore  Category");
			int count = 0;
			while(rs.next() && count < numberOfResults){
				count++;
				for(int i = 1; i <= colCount; i++){
					//System.out.print(rs.getString(i) + "  ");
					result += rs.getString(i) + "  ";
				}
				result += "\n";
			}
		}		 	
		catch(SQLException e)
	 	{
			System.err.println("cannot execute the query");
			System.err.println("error: " + e.getMessage());
	 	}
		
		sql = "select h.name, avg(score) as avgScore, h.category "
				+ "from Feedback f, Housing h where"
				+ " f.hid = h.hid AND h.category = 'Studio' "
				+ "group by (h.hid) "
				+ "order by (avgScore) DESC";
		
		rs = null;
		rsmd = null;
		
		result += "Studio:\n";
		try{
			rs = stmt.executeQuery(sql);
			rsmd = rs.getMetaData();
			int colCount = rsmd.getColumnCount();
		
			int count = 0;
			while(rs.next() && count < numberOfResults){
				count++;
				for(int i = 1; i <= colCount; i++){
					//System.out.print(rs.getString(i) + "  ");
					result += rs.getString(i) + "  ";
				}
				result += "\n";
			}
		}		 	
		catch(SQLException e)
	 	{
			System.err.println("cannot execute the query");
			System.err.println("error: " + e.getMessage());
	 	}
		
		sql = "select h.name, avg(score) as avgScore, h.category "
				+ "from Feedback f, Housing h where"
				+ " f.hid = h.hid AND h.category = 'House' "
				+ "group by (h.hid) "
				+ "order by (avgScore) DESC";
		
		rs = null;
		rsmd = null;
		
		result += "House:\n";
		try{
			rs = stmt.executeQuery(sql);
			rsmd = rs.getMetaData();
			int colCount = rsmd.getColumnCount();
		
			int count = 0;
			while(rs.next() && count < numberOfResults){
				count++;
				for(int i = 1; i <= colCount; i++){
					//System.out.print(rs.getString(i) + "  ");
					result += rs.getString(i) + "  ";
				}
				result += "\n";
			}
		}		 	
		catch(SQLException e)
	 	{
			System.err.println("cannot execute the query");
			System.err.println("error: " + e.getMessage());
	 	}
		return result;
	}
	
	public String mostUsefulUsers(int numberOfResults, Statement stmt){
		String result = "";
		String sql = "SELECT login, AVG(rating) "
				+ "FROM Rates "
				+ "GROUP BY(login) "
				+ "ORDER BY(AVG(rating))DESC "
				+ "LIMIT " + numberOfResults;
		ResultSet rs = null;
		try{
			rs = stmt.executeQuery(sql);

			while(rs.next()){

				result += rs.getString("login") + "\t" + rs.getDouble("AVG(rating)");
				result += "\n";
			}
		}		 	
		catch(SQLException e)
	 	{
			System.err.println("cannot execute the query");
			System.err.println("error: " + e.getMessage());
	 	}
		
		return result;
	}
	
	public String mostTrustedUsers(int numberOfResults, Statement stmt){
		String result = "";
		String sql = "SELECT login2, count(isTrusted) "
				+ "FROM Trust "
				+ "GROUP BY(login2) "
				+ "ORDER BY(count(isTrusted))DESC "
				+ "LIMIT " + numberOfResults;
		ResultSet rs = null;
		try{
			rs = stmt.executeQuery(sql);

			while(rs.next()){

				result += rs.getString("login2") + "\t" + rs.getInt("count(isTrusted)");
				result += "\n";
			}
		}		 	
		catch(SQLException e)
	 	{
			System.err.println("cannot execute the query");
			System.err.println("error: " + e.getMessage());
	 	}
		
		return result;
	}
	
	public String mostUsefulFeedbackTH(int numberOfResults, int hid, Statement stmt){
		String result = "";
		String sql = "SELECT r.fid, avg(r.rating) as avgRating "
				+ "FROM Rates r, Feedback f "
				+ "WHERE r.fid = f.fid AND f.hid = "+hid+" "
				+ "GROUP BY r.fid " 
				+ "ORDER BY avgRating DESC";
		
		ResultSet rs = null;
		
		List<Integer> fids = new ArrayList<Integer>();
		List<Float> ratings = new ArrayList<Float>();
		
		try{
			rs = stmt.executeQuery(sql);

			while(rs.next()){
				int fid = rs.getInt("fid");
				float rating = rs.getFloat("avgRating");
				fids.add(fid);
				ratings.add(rating);
			}
		}		 	
		catch(SQLException e)
	 	{
			System.err.println("cannot execute the query");
			System.err.println("error: " + e.getMessage());
	 	} 
		
		result += "fid\tscore\tcomments\t\t\t  date\taverage rating\n";

		for(int i = 0; i < fids.size() && i < numberOfResults; i++){
			int fid = fids.get(i);
			float rating = ratings.get(i);
			result += usefulFeedbackTHhelper(fid, rating, stmt);
			result += "\n";
		}
		
		return result;
	}
	
	private String usefulFeedbackTHhelper(int fid, float rating, Statement stmt){
		String result = "";
		String sql = "Select * from Feedback where fid = "+fid+"";
		
		ResultSet rs = null;
		
		try{
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				result += rs.getInt("fid") + "\t" + rs.getInt("score") + "\t" + rs.getString("text") + "\t\t\t  " +
						rs.getDate("fbdate").toString() + "\t" + rating;
			}
		}		 	
		catch(SQLException e)
	 	{
			System.err.println("cannot execute the query");
			System.err.println("error: " + e.getMessage());
	 	} 
		
		
		return result;
	}
}