package bookR.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookR.bean.BookDBBean;
import bookR.bean.BookDataBean;
import bookR.bean.MainCategoryDBBean;
import bookR.bean.MainCategoryDataBean;
import bookR.bean.SubCategoryDBBean;
import bookR.bean.SubCategoryDataBean;

public class BookInfoAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		int code = Integer.parseInt(request.getParameter("book_code"));
		
		BookDBBean bookProcess = BookDBBean.getInstance();
		BookDataBean book = bookProcess.getBookInfo(code);
		
		MainCategoryDBBean mainCategoryProcess = MainCategoryDBBean.getInstance();
		MainCategoryDataBean mainCatetory = mainCategoryProcess.getMainCategory(book.getMain_code());
		
		SubCategoryDBBean subCategoryProcess = SubCategoryDBBean.getInstance();
		SubCategoryDataBean subCatetory = subCategoryProcess.getSubCategory(book.getSub_code());
		
		request.setAttribute("book", book);
		request.setAttribute("mainCategory", mainCatetory.getName());
		request.setAttribute("subCategory", subCatetory.getName());
		
		return "/book/bookInfo.jsp";
	}

}
