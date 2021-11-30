package kr.or.resume.vo;

import lombok.Data;

@Data
public class Resume {
	private int resumeNo;
	private int memberNo;
	private String resumeTitle;
	private int aducation;
	private int career;
	private int activity;
	private String activityPlace;
	private String activityStart;
	private String activityend;
	private String activityContent;
	private String certiName;
	private String certiIssue;
	private String certiPass;
	private String certiDate;
	private String my_tech;
	private int veterans;
	private int military;
	private String selfintroName;
	private String selfintroContent;
	private int workForm;
	private int money;
	private String workPlace;
}