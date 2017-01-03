package bookR.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookR.bean.SubCategoryDBBean;
import bookR.bean.SubCategoryDataBean;

public class GetSubCategory implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		int mainCode = Integer.parseInt(request.getParameter("mainCode"));
		//System.out.println("소분류 가져오기"+mainCode);
		
		SubCategoryDBBean subCatagoryProcess = SubCategoryDBBean.getInstance();
		List<SubCategoryDataBean> subCategoryLists = subCatagoryProcess.getSubCategoryList(mainCode);
		
		request.setAttribute("subCategoryLists", subCategoryLists);
		
		return "/mngr/bookRegisterGetSubCategory.jsp";
	}

}
