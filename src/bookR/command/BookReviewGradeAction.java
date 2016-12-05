package bookR.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookR.bean.ReviewGradeDBBean;
import bookR.bean.ReviewGradeDataBean;

public class BookReviewGradeAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		String id = request.getParameter("id");
		int bookCode = Integer.parseInt(request.getParameter("bookCode"));
		String review = request.getParameter("review");
		int grade = Integer.parseInt(request.getParameter("grade"));

		ReviewGradeDBBean rgProcess = ReviewGradeDBBean.getInstance();
		int x = rgProcess.confirmRG(id, bookCode);

		if (x == -1) { // 둘자 없음
			rgProcess.insertRG(id, bookCode, review, grade);
		} else if (x == 1) { // grade만 존재
			rgProcess.updateRG(id, bookCode, review, grade);
		}

		return "/book/review_grade.jsp";
	}

}
