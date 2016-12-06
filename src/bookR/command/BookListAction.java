package bookR.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookR.bean.ListDBBean;
import bookR.bean.ListDataBean;

public class BookListAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		int bookCode = Integer.parseInt(request.getParameter("bookCode"));
		String listCode = request.getParameter("listCode");

		ListDBBean listProcess = ListDBBean.getInstance();
		
		listProcess.insertList(id, listCode, bookCode);

		return "/book/list.jsp";
	}

}
