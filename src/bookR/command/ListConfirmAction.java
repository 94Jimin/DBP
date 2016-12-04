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
		int[] codes = listProcess.getBookCodeList(listCode);
		
		BookDBBean bookProcess = BookDBBean.getInstance();
		List<BookDataBean> books = new ArrayList<BookDataBean>();
		//String bookSubject[] = null;
		
		/*if (codes.length>0){
			books = bookProcess.getBooksInfo(codes);
			request.setAttribute("books", books);
		}*/
		//books = bookProcess.getBooksInfo(codes);
		for (int list : codes){
			//bookSubject[i] = bookProcess.getBookSubject(list);
			books.add(bookProcess.getBookInfo(list));
		}
		
		request.setAttribute("books", books);

		return "/user/listConfirm.jsp";
	}

}
