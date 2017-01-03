package bookR.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookR.bean.KeywordInfoDBBean;
import bookR.bean.KeywordInfoDataBean;

public class GetKeywordAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");

		int subCode = Integer.parseInt(request.getParameter("subCode"));
		
		KeywordInfoDBBean keywordInfoProcess = KeywordInfoDBBean.getInstance();
		List<KeywordInfoDataBean> keywordInfo1 = keywordInfoProcess.getGroupKeyword(1,subCode);
		List<KeywordInfoDataBean> keywordInfo2 = keywordInfoProcess.getGroupKeyword(2,subCode);
		List<KeywordInfoDataBean> keywordInfo3 = keywordInfoProcess.getGroupKeyword(3,subCode);

		request.setAttribute("keywordInfo1", keywordInfo1);
		request.setAttribute("keywordInfo2", keywordInfo2);
		request.setAttribute("keywordInfo3", keywordInfo3);

		return "/search/getKeyword.jsp";
	}

}
