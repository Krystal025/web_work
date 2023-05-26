package test.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/friend/list")
public class FriendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//get방식으로 요청하면 호출되는 메소드 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//링크를 눌렀으니 여기에 코딩하면 됨 
		
		//비즈니스 로직을 수행해서 얻어낸 데어터(Model)라고 가정 
		List<String> list = new ArrayList<>();
		list.add("김수정");
		list.add("김희진");
		list.add("김영현");
		list.add("최유진");
		list.add("이진영");
		list.add("남지선");
		
		//"list"라는 키값으로 List<String>을 request scope 에 담기 
		request.setAttribute("list", list);
		
		//"/test/friend.jsp"로 응답을 위임할 수 있는 요청전달자 (RequestDispatcher)객체의 참조값 얻어내기
		RequestDispatcher rd = request.getRequestDispatcher("/test/friend.jsp");
		//필요한 객체를 전달하면서 forward이동하기 (응답 위임)
		rd.forward(request, response);
	}

	//post방식으로 요청하면 호출되는 메소드 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
