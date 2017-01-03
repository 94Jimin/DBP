package bookR.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookR.bean.KeywordDataBean;
import bookR.bean.KeywordInfoDBBean;
import bookR.bean.KeywordInfoDataBean;

public class ManagerKeywordRegisterProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		//int code = Integer.parseInt(request.getParameter("code"));
		int groupCode = Integer.parseInt(request.getParameter("groupCode"));
		String name = request.getParameter("name");
		int subCode = Integer.parseInt(request.getParameter("subCode"));
		
		KeywordInfoDataBean keywordInfo = new KeywordInfoDataBean();
		//keywordInfo.setCode(code);
		keywordInfo.setGroupCode(groupCode);
		keywordInfo.setName(name);
		keywordInfo.setSubCode(subCode);
		
		KeywordInfoDBBean keywordInfoProcess = KeywordInfoDBBean.getInstance();
		keywordInfoProcess.insertKeywordInfo(keywordInfo);
		
		
		
		
		return "/mngr/keywordRegisterPro.jsp";
	}

}
