package cs.dit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * 패키지명 : cs.dit
 * 파일명 : loginDao.java
 * 작성자 : junmin
 * 프로그램 설명 : dbcp로 데이터베이스 연동
 * 변경이력 : 
 * - getConnection : dbcp에서 Connection 얻어오기
 * - list() : login테이블에서 가져온 레코드를 dto로 만들어 전달
 * - checkUser() : 유효한 사용자인지 아닌지 판별하는 메소드
 */

public class loginDao {
	private Connection getConnection() throws Exception {
		//DBCP로 변경
		Context initCtx = new InitialContext(); //Context객체 생성
		Context envCtx = (Context)initCtx.lookup("java:comp/env");//JNDI에 등록된 Naming 자원들을 모두 가져옴
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jmlee");//DataSource 객체 얻어냄
		Connection con = ds.getConnection();//Connection 객체 얻어냄
		
		return con;
	
	}
	public void insert(loginDto dto) {
		String sql = "insert into login(id, name, pwd) values(?, ?, ?)";
		
		try(Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
		)
		{
		
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPwd());
		
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	//list() : 데이터조회
	//메소드 작성 시 고려사항
	//1. public / private
	//2. 반환 데이터(output)
	//3. 입력 데이터(input)
	
	public ArrayList<loginDto> list(){
		ArrayList<loginDto> dtos = new ArrayList<loginDto>();
		String sql = "select id, name, pwd from login";
		try(
			Connection con = getConnection();
			java.sql.Statement stmt = con.createStatement();
				
		)
		{
			
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				//1. 레코드셋에서 데이터를 가져온다.
				String id = rs.getString("id");
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				//2. 그 데이터들을 loginDot로 만든다.
				loginDto dto = new loginDto(id, name, pwd);
				//3. 그 loginDto를 배열(Arraylist)에 추가한다.
				dtos.add(dto);
			}
		}	catch (Exception e) {
			e.printStackTrace();
		}
		return dtos;
		
	}
	public int checkUser(String id, String pwd){
		String sql = "select pwd from login where id=? and pwd=?";
		int check = 0;
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
					
			)
			{
				
				pstmt.setNString(1, id);
				pstmt.setNString(2, pwd);
				try(ResultSet rs = pstmt.executeQuery();){
					
				}
		
		return 0;
		
	}
	
	}
