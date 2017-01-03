package bookR.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookR.bean.LogonDBBean;

public class ConfirmIdAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		
		LogonDBBean logonProcess = LogonDBBean.getInstance();
		int check = logonProcess.confirmId(id);
		
		request.setAttribute("check", new Integer(check));
		
		return "/logon/confirmId.jsp";
	}

}
