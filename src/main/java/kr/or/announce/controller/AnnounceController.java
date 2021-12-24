package kr.or.announce.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.announce.service.AnnounceService;
import kr.or.announce.vo.Announce;
import kr.or.announce.vo.AnnounceList;
import kr.or.announce.vo.AnnounceListPageData;
import kr.or.announce.vo.AnnounceView;
import kr.or.announce.vo.Application;
import kr.or.resume.vo.Resume;

@Controller
public class AnnounceController {
	@Autowired
	private AnnounceService service;

	@RequestMapping(value="/announceManage.do")
	public String announceManage(Model model, int memberNo) {
		/* ArrayList<Announce> list = service.selectAllannounce(memberNo); */
		Announce announce = service.selectAllannounce(memberNo);
		int comNo = service.selectComNo(memberNo);
		if(comNo != 0) {
			System.out.println("comNo : " +comNo);
			model.addAttribute("comNo", comNo);
		} else {
			model.addAttribute("comNo", 0);
		}
		int announceCount = service.selectAllAnnounceCount(memberNo);
		if(announce != null) {
			int count = service.selectAnnounceCount(announce.getAnnounceNo());
			System.out.println("count : " +count);
			model.addAttribute("count", count);
		}
		System.out.println("announceCount : " +announceCount);
		model.addAttribute("announceCount", announceCount);
		System.out.println("announce : " +announce);
		model.addAttribute("a", announce);
		return "jobSearch/announceManage";
	}
	
	@RequestMapping(value="/insertAnnounce.do")
	public String insertAnnounce(Announce a, int memberNo, Model model) {
		System.out.println("여기 AnnounceController");
		System.out.println(memberNo);
		int result = service.insertAnnounce(a);
		if(result != 0) {
			model.addAttribute("msg","구인공고 등록성공");
		} else {
			model.addAttribute("msg","구인공고 등록실패");			
		}
		model.addAttribute("loc","/announceManage.do?memberNo="+memberNo);
		return "common/msg";
	}
	
	@RequestMapping(value="/applicationStatus.do")
	public String applicationStatus(Model model, int announceNo, int reqPage) {
		AnnounceListPageData apd = service.selectApplyAnnounce(announceNo, reqPage);
		System.out.println("status : "+apd);
		System.out.println("list : "+apd.getList());
		/* String memberName = service.selectMemberName(apd.getList()); */
		model.addAttribute("list", apd.getList());
		model.addAttribute("pageNavi", apd.getPageNavi());
		model.addAttribute("start", apd.getStart());
		model.addAttribute("count", apd.getCount());
		return "jobSearch/applicationStatus";
	}
	
	@RequestMapping(value="/updateAnnounceFrm.do")
	public String updateAnnounceFrm(int announceNo, Model model) {
		Announce announce = service.selectOneAnnounce(announceNo);
		model.addAttribute("a", announce);
		return "jobSearch/updateAnnounceFrm";
	}
	
	@RequestMapping(value="/updateAnnounce.do")
	public String updateAnnounce(Model model, Announce a) {
		int result = service.updateAnnounce(a);
		if(result > 0) {
			model.addAttribute("msg","구인공고 수정완료");
		} else {
			model.addAttribute("msg","구인공고 수정실패");
		}
		model.addAttribute("loc", "/announceManage.do?memberNo="+a.getMemberNo());
		return "common/msg";
		
	}
	
	@RequestMapping(value="/deleteAnnounce.do")
	public String deleteAnnounce(Announce a, Model model) {
		System.out.println("deleteAnnounce a : "+a);
		int result = service.deleteAnnounce(a.getAnnounceNo());
		if(result > 0) {
			model.addAttribute("msg","구인공고가 삭제되었습니다.");
		} else {
			model.addAttribute("msg","구인공고 삭제 에러");			
		}
		model.addAttribute("loc","/announceManage.do?memberNo="+a.getMemberNo());
		return "common/msg";
	}
	
	@RequestMapping(value="/announceView.do")
	public String announceView(int announceNo, int memberNo, Model model) {
		AnnounceView announce = service.selectAnnounceView(announceNo);
		/* int resumeNo = service.selectResumeNo(announceNo); */
		if(memberNo != 0) {
			Resume r = service.selectCeoResume(memberNo);
			model.addAttribute("r", r);
			System.out.println("r : "+r);
		}
		System.out.println("view : "+announce);
		model.addAttribute("a", announce);
		return "jobSearch/announceView";
	}
	
	@RequestMapping(value="/insertApplication.do")
	public String insertApplication(Application app, Model model) {
		System.out.println("app : "+app);
		int result = service.insertApplication(app);
		if(result > 0) {
			model.addAttribute("title","지원완료되었습니다.");
			model.addAttribute("loc","jobSearchList.do?reqPage=1");
			model.addAttribute("icon","success");
		} else {
			model.addAttribute("title","지원신청 에러발생 삐융삐융");
			model.addAttribute("loc","jobSearchList.do?reqPage=1");
			model.addAttribute("icon","fail");
		}
		return "member/swalMsg";
	}
	
}
