package bookR.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookR.bean.LogonDataBean;
import bookR.bean.LogonDBBean;

public class SignUpProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		
		LogonDataBean member = new LogonDataBean();
		member.setId(request.getParameter("id"));
		member.setPasswd(request.getParameter("passwd"));
		member.setName(request.getParameter("name"));
		member.setGender(request.getParameter("gender"));
		member.setFavorite(request.getParameter("favorite"));
		//System.out.println(id);
		LogonDBBean dbPro = LogonDBBean.getInstance();
		dbPro.insertMember(member);

		request.setAttribute("id", id);

		return "/logon/signUpPro.jsp";
	}
}
