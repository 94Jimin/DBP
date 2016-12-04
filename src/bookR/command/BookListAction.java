package bookR.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookListAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		int book = Integer.parseInt(request.getParameter("book"));
		
		
		
		
		return "/book/list.jsp";
	}

}
