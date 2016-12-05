package bookR.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookR.bean.BookDBBean;
import bookR.bean.BookDataBean;
import bookR.bean.MainCategoryDBBean;
import bookR.bean.MainCategoryDataBean;
import bookR.bean.ReviewGradeDBBean;
import bookR.bean.ReviewGradeDataBean;
import bookR.bean.SubCategoryDBBean;
import bookR.bean.SubCategoryDataBean;

public class BookInfoAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		int bookCode = Integer.parseInt(request.getParameter("book_code"));
		String id = request.getParameter("id");
		
		BookDBBean bookProcess = BookDBBean.getInstance();
		BookDataBean book = bookProcess.getBookInfo(bookCode);
		
		MainCategoryDBBean mainCategoryProcess = MainCategoryDBBean.getInstance();
		MainCategoryDataBean mainCatetory = mainCategoryProcess.getMainCategory(book.getMain_code());
		
		SubCategoryDBBean subCategoryProcess = SubCategoryDBBean.getInstance();
		SubCategoryDataBean subCatetory = subCategoryProcess.getSubCategory(book.getSub_code());
		
		request.setAttribute("book", book);
		request.setAttribute("mainCategory", mainCatetory.getName());
		request.setAttribute("subCategory", subCatetory.getName());
		
		ReviewGradeDBBean rgProcess = ReviewGradeDBBean.getInstance();
		List<ReviewGradeDataBean> rgLists = rgProcess.getRG(bookCode);
		int grade = rgProcess.getGrade(id, bookCode);
		String review = rgProcess.getReview(id, bookCode);
		
		
		request.setAttribute("rgLists", rgLists);
		request.setAttribute("grade", grade);
		request.setAttribute("review", review);
		return "/book/bookInfo.jsp";
	}

}
