package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/send2")
public class SendServlet2 extends HttpServlet{
	/*
	 * service()메소드에는 2개의 객체의 참조값이 매개변수에 전달된다
	 * 
	 * HttpServletRequest 객체 -> 요청과 관련된 작업을 처리할 떄 사용함
	 * HttpServletResponse 객체 -> 응답과 관련된 작업을 처리할 떄 사용함
	 */
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//post 방식으로 전송할 때에는 요청 인코딩 설정을 해줘야 한글이 깨지지 않음
		req.setCharacterEncoding("utf-8");
		
		//"msg"라는 파라미터 명으로 전달되는 문자여릉ㄹ 읽어와서 msg라는 지역변수에 담기
		//해당 파라미터 명으로 전달되는 정보가 없으며 null이 리턴
		String msg = req.getParameter("msg");
		//콘솔창에 출력해보기
		System.out.println("msg: "+msg);
		//응답하기
		
		//응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		//응답 컨텐츠 설정
		resp.setContentType("text/html;charset=utf-8");
		//클라이언트에게 문자열을 응답할 수 있는 객체의 참조값 얻어내기
		PrintWriter pw = resp.getWriter();
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'>");
		pw.println("<title>메세지 전송결과 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>클라이언트로부터 메세지 잘 받았음</p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}
