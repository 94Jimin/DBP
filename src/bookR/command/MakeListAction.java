package bookR.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookR.bean.ListDBBean;

public class MakeListAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		int bookCode = Integer.parseInt(request.getParameter("bookCode"));

		ListDBBean listProcess = ListDBBean.getInstance();

		int x = listProcess.confirmListNum(id);
		String listCode = listProcess.generateListCode(id, x); // list 코드 만들기
		listProcess.insertList(id, listCode, bookCode);

		return "/user/makeList.jsp";
	}

}
