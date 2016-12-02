package bookR.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookR.bean.BookDBBean;
import bookR.bean.BookDataBean;
import bookR.bean.MainCategoryDBBean;
import bookR.bean.MainCategoryDataBean;

public class MainAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// request.setAttribute("type", new Integer(0));

		int main_code = Integer.parseInt(request.getParameter("main_code"));
		System.out.println(main_code);

		List<MainCategoryDataBean> MainList = null;
		BookDataBean bookList[] = null;

		MainCategoryDBBean MCList = MainCategoryDBBean.getInstance();
		BookDBBean bookProcess = BookDBBean.getInstance();

		MainList = MCList.getMainCategoryList();
		bookList = bookProcess.getBooks(main_code, 3);

		request.setAttribute("MCList", MainList);
		request.setAttribute("bookList", bookList);

		return "/main.jsp";
	}

}
