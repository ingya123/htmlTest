package testBoard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "jsp", pwd = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	public BoardDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<BoardDTO> list(int num){
		//String sql = "select * from paging";
		//String sql = "select * from paging order by num desc";
		String sql = "select B.* from(select rownum rn, A.* from"
				+ " (select * from paging order by num desc)A)B"
				+ " where rn between ? and ?";
		ArrayList<BoardDTO> listDto = new ArrayList<BoardDTO>();
		
		int start = (num-1) *3 + 1;
		int end = start+2;
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setPdate(rs.getString("pdate"));
				dto.setCount(rs.getInt("count"));
				listDto.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listDto;
	}
	public void insert(BoardDTO dto) {
		//sysdate : 현재 날짜가 들어간다
		String sql = "insert into paging(num,title,pdate,count)"+
						"values(test_num.nextval,?,sysdate,0)";
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void count(String num) {
		String sql="update paging set count=count+1 where num="+num;
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int getTotalPage() {
		String sql = "select count(*) from paging";
		int totPage = 0;
		int tmp = 0;
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next())
				totPage = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		tmp = totPage;
		totPage = totPage / 3;
		tmp = tmp %3 ;
		if(tmp==0) {
			return totPage;
		}else {
			return totPage+1;
		}
	}
}
