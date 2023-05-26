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

import test.member.dto.MemberDto;

@WebServlet("/member/list")
public class MemberListServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//비즈니스 로직을 수행해서 얻어닌 데이터(Model)이라고 가정 
		List<MemberDto> list = new ArrayList<>();
		list.add(new MemberDto(1, "김수정", "서울"));
		list.add(new MemberDto(2, "김희진", "춘천"));
		list.add(new MemberDto(3, "김영현", "부여"));
		
		//jsp페이지에 전달될 Model을 request scope에 담기
		req.setAttribute("list", list);
		
		//jsp페이지로 forward 이동
		RequestDispatcher rd = req.getRequestDispatcher("/member/list.jsp");
		rd.forward(req, resp);
	}
}
