package bookR.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookR.bean.ReviewGradeDBBean;

public class ConfirmReviewAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		int bookCode  = Integer.parseInt(request.getParameter("bookCode"));
		
		ReviewGradeDBBean RGProcess = ReviewGradeDBBean.getInstance();
		int x = RGProcess.confirmRG(id, bookCode);
		
		request.setAttribute("check", x);
		
		return "/book/confirmReview.jsp";
	}

}
