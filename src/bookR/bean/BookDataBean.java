package bookR.bean;

public class BookDataBean {
	private int code;
	private String subject;
	private String writer;
	private String publisher;
	private int main_code;
	private int sub_code;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getMain_code() {
		return main_code;
	}

	public void setMain_code(int main_code) {
		this.main_code = main_code;
	}

	public int getSub_code() {
		return sub_code;
	}

	public void setSub_code(int sub_code) {
		this.sub_code = sub_code;
	}

}
