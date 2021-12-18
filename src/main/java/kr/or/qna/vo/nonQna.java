package kr.or.qna.vo;

import lombok.Data;

@Data
public class nonQna {
	private int nonQnaNo;
	private int category;
	private String email;
	private String qnaPw;
	private String qnaTitle;
	private String qnaContent;
	private String regDate;
	private String qnaAnswer;
	private String answerDate;
	
	public String getType() {
		if(category == 7) {
			return "로그인관련";
		}else if(category == 8) {
			return "계정관련";
		}else if(category == 9) {
			return "결제관련";
		}else if(category == 10) {
			return "환불관련";
		}else if(category == 11) {
			return "공모전관련";
		}else if(category == 12) {
			return "구인잡관련";
		}else if(category == 13) {
			return "커뮤니티관련";
		}else if(category == 40) {
			return "기타문의";
		}else if(category == 21) {
			return "신고";
		}else if(category == 22) {
			return "기능/작동 오류";
		}else if(category == 20) {
			return "이벤트";
		}
		return null;
	}
	
	public String getState() {
		if (qnaAnswer != null && qnaAnswer.length() != 0) {
			return "답변 완료";
		} else {
			return "답변 대기";
		}
	}
	
	public String getQnaContentBr() {
		return qnaContent.replaceAll("\r\n", "<br>");
	}
	
}
