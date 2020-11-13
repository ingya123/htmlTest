package members;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "jsp", pwd = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public String checkId(String id) {
		try {
			
			String sql = "select id from members where id=?";
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				return rs.getString("id");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void singupMember(MemberDTO mem) {
		try {
			String sql = "insert into members values(?,?,?,?,?)";
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, mem.getId());
			ps.setString(2, mem.getPwd());
			ps.setString(3, mem.getName());
			ps.setString(4, mem.getAddr());
			ps.setString(5, mem.getTel());
			rs = ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void memberModify(MemberDTO mem) {
		try {
			String sql = "update members set name=?,addr=?,tel=? where id=?";
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, mem.getName());
			ps.setString(2, mem.getAddr());
			ps.setString(3, mem.getTel());
			ps.setString(4, mem.getId());
			ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteMember(String id) {
		try {
			String sql = "delete from members where id=?";
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public MemberDTO slectMember(String id) {
		MemberDTO d = new MemberDTO();
		try {
			String sql = "select * from members where id=?";
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				d.setId(rs.getString("id"));
				d.setPwd(rs.getString("pwd"));
				d.setName(rs.getString("name"));
				d.setAddr(rs.getString("addr"));
				d.setTel(rs.getString("tel"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return d;
	}
	
	
	public String memberCheck(String id) {
		try {
			String sql = "select pwd from members where id=?";
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				return rs.getString("pwd");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<MemberDTO> memberList() {
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		try {
			String sql = "select * from members";
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberDTO d = new MemberDTO();
				d.setId(rs.getString("id"));
				d.setPwd(rs.getString("pwd"));
				d.setName(rs.getString("name"));
				d.setAddr(rs.getString("addr"));
				d.setTel(rs.getString("tel"));
				list.add(d);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
