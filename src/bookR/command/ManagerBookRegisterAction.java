package bookR.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookR.bean.KeywordInfoDBBean;
import bookR.bean.KeywordInfoDataBean;
import bookR.bean.MainCategoryDBBean;
import bookR.bean.MainCategoryDataBean;
import bookR.bean.SubCategoryDBBean;
import bookR.bean.SubCategoryDataBean;

public class ManagerBookRegisterAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		MainCategoryDBBean mainCategoryProcess = MainCategoryDBBean.getInstance();
		List<MainCategoryDataBean> mainCategoryLists = mainCategoryProcess.getMainCategoryList();
		
		
		request.setAttribute("mainCategoryLists", mainCategoryLists);
		
		
		
		
		return "/mngr/bookRegister.jsp";
	}

}
