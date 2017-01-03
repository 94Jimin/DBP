package bookR.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookR.bean.BookDBBean;
import bookR.bean.BookDataBean;
import bookR.bean.ListDBBean;
import bookR.bean.ListDataBean;

public class ListConfirmAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		String listCode = request.getParameter("listCode");

		ListDBBean listProcess = ListDBBean.getInstance();
		List<ListDataBean> lists = listProcess.getBookCodeList(listCode);

		BookDBBean bookProcess = BookDBBean.getInstance();
		List<BookDataBean> books = bookProcess.getMyListBook(lists);

		request.setAttribute("books", books);
		request.setAttribute("listCode", listCode);

		return "/user/listConfirm.jsp";
	}

}
