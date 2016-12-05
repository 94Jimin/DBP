package bookR.bean;

public class ReviewGradeDataBean {
	private String id;
	private int book_code;
	private String review;
	private int grade;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBook_code() {
		return book_code;
	}

	public void setBook_code(int book_code) {
		this.book_code = book_code;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}
}
