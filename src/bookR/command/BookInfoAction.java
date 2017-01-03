package bookR.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookR.bean.BookDBBean;
import bookR.bean.BookDataBean;
import bookR.bean.ListDBBean;
import bookR.bean.ListDataBean;
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
		MainCategoryDataBean mainCatetory = mainCategoryProcess.getMainCategory(book.getMainCode());
		
		SubCategoryDBBean subCategoryProcess = SubCategoryDBBean.getInstance();
		SubCategoryDataBean subCatetory = subCategoryProcess.getSubCategory(book.getSubCode());
		
		request.setAttribute("book", book);
		request.setAttribute("mainCategory", mainCatetory.getName());
		request.setAttribute("subCategory", subCatetory.getName());
		
		ReviewGradeDBBean rgProcess = ReviewGradeDBBean.getInstance();
		List<ReviewGradeDataBean> rgLists = rgProcess.getRG(bookCode);
		request.setAttribute("rgLists", rgLists);
		
		
		int grade = rgProcess.getGrade(id, bookCode);
		String review = rgProcess.getReview(id, bookCode);
				
		request.setAttribute("grade", grade);
		request.setAttribute("review", review);
		
		//bookList의 리스트를 받아오는 코드가 필요..
		ListDBBean listProcess = ListDBBean.getInstance();
		List<ListDataBean> myLists = listProcess.getListList(id);
		//bookcode가 들어있는 list_code를 알아오는 함수..
		String listCode = listProcess.getListCode(bookCode, id);
		
		request.setAttribute("myLists", myLists);
		request.setAttribute("listCode", listCode);
		
		
		return "/book/bookInfo.jsp";
	}

}
