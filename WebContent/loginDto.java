package cs.dit;
/**
 * 패키지명 : cs.dit
 * 파일명 : LoginDto.java
 * 작성자 : junmin
 * 프로그램 설명 : login DB테이블의 데이터를 담는 클래스 
 * 변경이력: 2022-04-28 /최초작성 /이준민
 */
public class loginDto {
	private String id;
	private String name;
	private String pwd;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public loginDto(String id, String name, String pwd) {} //매개변수가 없는 생성자
	
}
