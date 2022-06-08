package cs.dit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class loginController
 */
@WebServlet("*.do")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public loginController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("안녕하세요!!");
		String uri = request.getRequestURI();
		out.println(uri);
		out.println(uri.lastIndexOf("/"));
		out.println(uri.lastIndexOf(".do"));
		
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".do"));
		out.println(com);
		
		if(com != null && com.trim().equals("list")) {
			out.println("list로 들어왔어요.");
		}else if(com != null && com.trim().equals("insertForm")){
			out.println("insertForm으로  들어왔어요.");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
