package bookR.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookR.bean.BookDBBean;
import bookR.bean.BookDataBean;
import bookR.bean.KeywordDBBean;

public class SearchKeywordResultAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");

		String keyword1p = request.getParameter("keyword1");
		String keyword2p = request.getParameter("keyword2");
		String keyword3p = request.getParameter("keyword3");
		int keyword1=0;
		int keyword2=0;
		int keyword3=0;
		if (keyword1p=="")
			keyword1=0;
		else
			keyword1=Integer.parseInt(keyword1p);
		if (keyword2p=="")
			keyword2=0;
		else
			keyword2=Integer.parseInt(keyword2p);
		if (keyword3p=="")
			keyword3=0;
		else
			keyword3=Integer.parseInt(keyword3p);
		//System.out.println(keyword1 + " " + keyword2 + " " + keyword3 + " ");
		KeywordDBBean keywordProcess = KeywordDBBean.getInstance();
		List<BookDataBean> lists = keywordProcess.getSearchResult(keyword1,
				keyword2, keyword3);

		if (lists != null){
			BookDBBean bookProcess = BookDBBean.getInstance();
			List<BookDataBean> books = new ArrayList<BookDataBean>();
			for (int i = 0; i < lists.size(); i++)
				books.add(bookProcess.getBook(lists.get(i).getCode()));

			request.setAttribute("books", books);
		}
		

		return "/search/keywordResult.jsp";
	}

}
