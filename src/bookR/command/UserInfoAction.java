package bookR.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookR.bean.ListDBBean;
import bookR.bean.ListDataBean;

public class UserInfoAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		String id = request.getParameter("id");
		
		ListDBBean listProcess = ListDBBean.getInstance();
		List<ListDataBean> lists = listProcess.getListList(id);
		
		request.setAttribute("lists", lists);
		return "/user/userInfo.jsp";
	}

}
