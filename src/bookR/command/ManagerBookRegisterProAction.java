package bookR.command;

import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookR.bean.BookDBBean;
import bookR.bean.BookDataBean;
import bookR.bean.KeywordDBBean;
import bookR.bean.KeywordInfoDBBean;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ManagerBookRegisterProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");

		String filename = "";
		String realFolder = "";
		String saveFolder = "/bookImage";
		String encType = "utf-8";
		int maxSize = 1 * 1024 * 1024;

		MultipartRequest imageUp = null;

		ServletContext context = request.getSession().getServletContext();
		realFolder = context.getRealPath(saveFolder);
		try {
			imageUp = new MultipartRequest(request, realFolder, maxSize,
					encType, new DefaultFileRenamePolicy());

			Enumeration<?> files = imageUp.getFileNames();

			while (files.hasMoreElements()) {
				String name = (String) files.nextElement();

				filename = imageUp.getFilesystemName(name);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		String subject = imageUp.getParameter("subject");
		String writer = imageUp.getParameter("writer");
		String publisher = imageUp.getParameter("publisher");
		int mainCode = Integer.parseInt(imageUp.getParameter("mainCode"));
		int subCode = Integer.parseInt(imageUp.getParameter("subCode"));
		String keywordCode1p = imageUp.getParameter("keywordGroup1");
		String keywordCode2p = imageUp.getParameter("keywordGroup2");
		String keywordCode3p = imageUp.getParameter("keywordGroup3");

		BookDataBean book = new BookDataBean();
		book.setSubject(subject);
		book.setWriter(writer);
		book.setPublisher(publisher);
		book.setImage(filename);
		book.setMainCode(mainCode);
		book.setSubCode(subCode);

		// System.out.println(subject + writer + publisher + mainCode + subCode
		// + filename);

		BookDBBean bookProcess = BookDBBean.getInstance();

		int check=-1;
		if (-1 == bookProcess.registedBookConfirm(mainCode, subCode, subject,
				writer)) {
check = 1;
			bookProcess.insertBook(book);

			int bookCode = bookProcess.getBookCode(subject);
			KeywordDBBean keywordProcess = KeywordDBBean.getInstance();
			if (keywordCode1p != null) {
				int keywordCode1 = Integer.parseInt(keywordCode1p);
				keywordProcess.insertKeyword(keywordCode1, bookCode);
			}
			if (keywordCode2p != null) {
				int keywordCode2 = Integer.parseInt(keywordCode2p);
				keywordProcess.insertKeyword(keywordCode2, bookCode);
			}
			if (keywordCode3p != null) {
				int keywordCode3 = Integer.parseInt(keywordCode3p);
				keywordProcess.insertKeyword(keywordCode3, bookCode);
			}
		} else {
			check=-1;
		}

		request.setAttribute("check", check);
		return "/mngr/bookRegisterPro.jsp";
	}
}
