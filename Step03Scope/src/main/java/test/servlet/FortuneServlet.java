package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//오늘의 운세를 얻어오는 비즈니스 로직을 수행(DB에서 읽어왔다고 가정)
		String fortune = "오늘은 아주 좋은 일이 있을거에요!";
		
		/*
		 * HttpServletRequest 객체의 setAttribute(key, value)메소드를 이용해서 
		 * 응답에 필요한 데이터를 저장할 수 있음
		 * 저장된 데이터는 응답하기 전까지 유효하며 응답을 마친후에는 없어지는 1회성 데이터임 
		 * 저장된 데이터를 얻어내는 방법 : 
		 * HttpServletRequest객체의 getAttribute(key)메소드를 활용
		 * 단, 저장할 때 Object type으로 받았기 떄문에 Object type으로 return됨
		 * 따라서 얻어낼때 원래  type으로 "casting"해야함 
		 * 
		 */
		
		req.setAttribute("fortuneToday", fortune);
		
		//응답을 이 페이지에서 하지않고 jsp 페이지로 위임할 수 있음
		RequestDispatcher rd = req.getRequestDispatcher("/test/fortune.jsp");
		/*
		 * webapp/test/fortune.jsp 페이지에 응답을 대신하도록하고
		 * Servlet에 전달받았던 HttpServletRequest, HttpServletPResponse 객체의 참조값을 전달해줌)
		 */
		rd.forward(req, resp);
	}
}
