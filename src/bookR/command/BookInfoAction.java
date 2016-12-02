package bookR.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookInfoAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		int code = Integer.parseInt(request.getParameter("book_code"));
		
		return "/book/bookInfo.jsp";
	}

}
