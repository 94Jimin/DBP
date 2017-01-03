package bookR.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookR.bean.ListDBBean;

public class UserDeleteBookAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String listCode = request.getParameter("listCode");
		int bookCode = Integer.parseInt(request.getParameter("bookCode"));
		String bookName = request.getParameter("bookName");
		System.out.println(id+listCode+bookCode);
		
		ListDBBean listProcess = ListDBBean.getInstance();
		int check=listProcess.deleteListBook(id, listCode, bookCode);
		
		request.setAttribute("listCode", listCode);
		request.setAttribute("bookName", bookName);
		request.setAttribute("check", check);

		return "/user/deleteBook.jsp";
	}

}
