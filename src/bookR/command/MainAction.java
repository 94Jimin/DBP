package bookR.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookR.bean.MainCategoryDBBean;
import bookR.bean.MainCategoryDataBean;

public class MainAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setAttribute("type", new Integer(0));

		List<MainCategoryDataBean> MainList = null;
		
		MainCategoryDBBean MCList = MainCategoryDBBean.getInstance();
		
		MainList = MCList.getMainCategoryList();
		request.setAttribute("MCList", MainList);

		return "/main.jsp";
	}

}
