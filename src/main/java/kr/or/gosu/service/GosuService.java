package kr.or.gosu.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.gosu.dao.GosuDao;
import kr.or.gosu.vo.Gosu;
import kr.or.gosu.vo.GosuFeedback;
import kr.or.gosu.vo.GosuNotice;
import kr.or.gosu.vo.GosuPhoto;
import kr.or.gosu.vo.GosuProject;
import kr.or.gosu.vo.GosuRequest;
import kr.or.gosu.vo.GosuRequestCost;
import kr.or.gosu.vo.GosuRequestCount;
import kr.or.gosu.vo.GosuRequestProject;
import kr.or.gosu.vo.GosuRequestProjectSub;
import kr.or.gosu.vo.GosuRequestReview;
import kr.or.gosu.vo.GosuReview;
import kr.or.gosu.vo.GosuTalk;

@Service
public class GosuService {
	@Autowired
	private GosuDao dao;

	@Transactional
	public int insertGosu(Gosu g, ArrayList<GosuPhoto> photoList, ArrayList<GosuProject> projectList) {
		System.out.println(g.getGgsouNo());
		int gosuResult = dao.insertGosu(g);
		System.out.println(g.getGgsouNo());
		int photoResult = 0;
		int projectResult = 0;

		if (gosuResult > 0) {
			for (GosuPhoto gph : photoList) {
				gph.setGgsouNo(g.getGgsouNo());
				photoResult += dao.insertGPhoto(gph);
			}
			for (GosuProject gpr : projectList) {
				gpr.setGgsouNo(g.getGgsouNo());
				projectResult += dao.insertGProject(gpr);
			}
		} else {
			return -1;
		}
		return projectResult;
	}

	public ArrayList<Gosu> selectGosuList() {
		ArrayList<Gosu> list = dao.selectGosuList();
		for (Gosu g : list) {
			int gosuNo = g.getGsouNo();

			g.setGosuId(dao.selectGosuId(gosuNo));
			g.setGosuImg(dao.selectGosuImg(gosuNo));
		}
		return list;
	}

	public Gosu selectGosuOne(int ggosuNo) {
		Gosu gosu = dao.selectGosuOne(ggosuNo);
		gosu.setGosuId(dao.selectGosuId(gosu.getGsouNo()));
		gosu.setGosuImg(dao.selectGosuImg(gosu.getGsouNo()));
		return gosu;
	}

	public ArrayList<GosuProject> selectGosuProject(int gNo) {
		ArrayList<GosuProject> gList = dao.selectGosuProject(gNo);
		return gList;
	}

	public ArrayList<GosuPhoto> selectGosuPhoto(int gNo) {
		ArrayList<GosuPhoto> gList = dao.selectGosuPhoto(gNo);
		return gList;
	}
	@Transactional
	public int insertGosuNotice(GosuNotice gNotice) {
		int result = dao.insertGosuNotice(gNotice);
		return result;
	}

	public GosuNotice selectGosuNoticeOne(int gnoticeNo) {
		GosuNotice gNotice = dao.selectGosuNoticeOne(gnoticeNo);
		gNotice.setWriteImg(dao.selectGosuImg(gNotice.getWriteId()));
		return gNotice;
	}

	public ArrayList<GosuNotice> selectGosuNoticeList() {
		ArrayList<GosuNotice> list = dao.selectGosuNoticeList();
		return list;
	}

	public ArrayList<GosuNotice> selectGosuNoticeList2() {
		ArrayList<GosuNotice> list = dao.selectGosuNoticeList2();
		return list;
	}

	public ArrayList<Gosu> selectNewGosuList() {
		ArrayList<Gosu> list = dao.selectNewGosuList();
		return list;
	}

	public int selectGosuCount() {
		int gosuCount = dao.selectGosuCount();
		return gosuCount;
	}

	public GosuProject selectGProject(int pNo) {
		GosuProject gList = dao.selectGProject(pNo);
		return gList;
	}
	@Transactional
	public int insertGosuFeedback(GosuFeedback gf) {
		int result = dao.insertGosuFeedback(gf);
		return result;
	}

	public GosuFeedback selectFeedbackOne(int fbNo) {
		GosuFeedback gosuFeedback = dao.selectFeedbackOne(fbNo);
		return gosuFeedback;
	}

	public ArrayList<GosuFeedback> selectGosuFeedbackList(String memberId) {
		ArrayList<GosuFeedback> list = dao.selectGosuFeedbackList(memberId);
		for (GosuFeedback g : list) {
			int ggosuNo = g.getGgosuNo();
			g.setGosuId(dao.selectGosuId2(ggosuNo));
			g.setGosuImg(dao.selectGosuImg(g.getGosuId()));
		}
		return list;
	}
	@Transactional
	public int insertGosuTalk(GosuTalk gt) {
		int result = dao.insertGosuTalk(gt);
		GosuFeedback gosuFeedback = dao.selectFeedbackOne(gt.getFeedbackNo());
		if (gosuFeedback.getFeedbackNum() == 1) {
			int feedbackNumResult = dao.updateFeedbackNum(gt.getFeedbackNo());
		}
		return result;
	}

	public ArrayList<GosuTalk> selectGosuTalk(int fbNo) {
		ArrayList<GosuTalk> list = dao.selectGosuTalk(fbNo);
		for (GosuTalk g : list) {
			String writer = g.getWriter();
			g.setGosuImg(dao.selectGosuImg(writer));
			g.setMemberImg(dao.selectGosuImg(writer));
		}
		return list;
	}

	public ArrayList<GosuFeedback> selectGosuFeedbackList2(String memberId) {
		ArrayList<GosuFeedback> list = dao.selectGosuFeedbackList2(memberId);
		for (GosuFeedback g : list) {
			g.setMemberId(dao.selectMemberId(g.getFeedbackNo()));
			g.setMemberImg(dao.selectGosuImg(g.getMemberId()));
		}
		return list;
	}
	@Transactional
	public int talkStop(int feedbackNo) {
		int result = dao.talkStop(feedbackNo);
		return result;
	}

	public Gosu selectgosuWriteList(String gosuId) {
		Gosu list = dao.selectgosuWriteList(gosuId);

		return list;
	}
	@Transactional
	public int insertGosuRequest(GosuRequest gr) {
		int result = dao.insertGosuRequest(gr);
		return result;
	}

	public ArrayList<GosuRequest> selectMemberRequestList() {
		ArrayList<GosuRequest> list = dao.selectMemberRequestList();
		for (GosuRequest g : list) {
			g.setRequestWriterImg(dao.selectGosuImg(g.getRequestWriterNo()));
			g.setRequestWriterId(dao.selectGosuId(g.getRequestWriterNo()));
		}
		return list;
	}

	public GosuRequest selectGosuRequestContent(int mrn) {
		GosuRequest gosuRequest = dao.selectGosuRequestContent(mrn);	
		gosuRequest.setRequestWriterId(dao.selectGosuId(gosuRequest.getRequestWriterNo()));
		
		return gosuRequest;
	}
	@Transactional
	public int gosuRequestCostInsert(GosuRequestCost grc) {
		int result = dao.gosuRequestCostInsert(grc);
		return result;
	}

	public ArrayList<GosuRequestCost> selectGosuRequestCostList(String memberId) {
		ArrayList<GosuRequestCost> list = dao.selectGosuRequestCostList(memberId);
		for (GosuRequestCost g : list) {
			g.setGosuImg(dao.selectGosuImg(g.getGosuNo()));
			g.setGosuId(dao.selectGosuId(g.getGosuNo()));
		}
		return list;
	}

	public GosuRequestCost selectRequestNoGosuNo(GosuRequestCost grc) {
		GosuRequestCost requestNoGosuNo = dao.selectRequestNoGosuNo(grc);	
		return requestNoGosuNo;
	}

	public GosuRequestCost selectGosuRequestCost(int costNo) {
		GosuRequestCost gosuRequestCost = dao.selectGosuRequestCost(costNo);
		gosuRequestCost.setGosuId(dao.selectGosuId(gosuRequestCost.getGosuNo()));
		return gosuRequestCost;
	}

	public GosuRequestCount selectGosuCountRequestCount() {
		GosuRequestCount gosuRequestCount = new GosuRequestCount();
		gosuRequestCount.setCountGosu(dao.selectGosuCount());
		gosuRequestCount.setCountRequest(dao.selectRequestCount());		
		return gosuRequestCount;
	}
	@Transactional
	public int insertGosuRequestProjectSub(GosuRequestProjectSub grps) {
		int result = dao.insertGosuRequestProjectSub(grps);
		return result;
	}

	public ArrayList<GosuRequestProject> selectGosuRequestProjectOne(int rpsNo) {
		ArrayList<GosuRequestProject> list = dao.selectGosuRequestProjectOne(rpsNo);
	
		return list;
	}

	public GosuRequestProjectSub selectGosuRequestProjectSub(int rpsNo) {
		GosuRequestProjectSub grps = dao.selectGosuRequestProjectSub(rpsNo);	
		return grps;
	}

	public ArrayList<GosuRequestProjectSub> selectGosuRequestProjectSubList(int memberNo) {
		ArrayList<GosuRequestProjectSub> list = dao.selectGosuRequestProjectSubList(memberNo);
	
		return list;
	}

	public ArrayList<GosuRequestProjectSub> selectGosuRequestProjectSubList2(int memberNo) {
		ArrayList<GosuRequestProjectSub> list = dao.selectGosuRequestProjectSubList2(memberNo);
	
		return list;
	}

	public int insertGosuRequestProject(GosuRequestProject grp) {
		int result = dao.insertGosuRequestProject(grp);
		return result;
	}

	@Transactional
	public int talkStop2(int requestProjectSubNo) {
		int result = dao.talkStop2(requestProjectSubNo);
		return result;
	}
	@Transactional
	public int insetReviewOne(GosuReview gr) {
		int result = dao.insetReviewOne(gr);
		return result;
	}

	public GosuReview selectGosuReviewOne(GosuReview gr) {
		GosuReview gosuReviewOne = dao.selectGosuReviewOne(gr);	
		return gosuReviewOne;
	}

	public ArrayList<GosuReview> selectGosuReviewList(int ggsouNo) {
		ArrayList<GosuReview> list = dao.selectGosuReviewList(ggsouNo);
		return list;
	}

	public GosuReview selectReviewCountAVG(int ggsouNo) {
		GosuReview gosuReviewOne = new GosuReview();
		
		gosuReviewOne.setReviewCount(dao.selectReviewCount(ggsouNo));	
		gosuReviewOne.setReviewAvg(dao.selectReviewAvg(ggsouNo));
		return gosuReviewOne;
	}
	@Transactional
	public int insertRequestReviewAjax(GosuRequestReview grr) {
		int result = dao.insertRequestReviewAjax(grr);
		return result;
	}

	public GosuRequestReview selectGosuRequestReviewOne(GosuRequestReview grr2) {
		GosuRequestReview gosuReviewOne = dao.GosuRequestReview(grr2);	
		return gosuReviewOne;
	}


}
