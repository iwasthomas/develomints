package kr.or.share.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.share.model.service.ShareService;
import kr.or.share.model.vo.Share;

@Controller
public class ShareController {
	@Autowired
	private ShareService service;
	
	@RequestMapping(value="/shareList.do")
	public String shareList() {
		return "share/shareList";
	}
	@RequestMapping(value="/shareWriteFrm.do")
	public String shareWriteFrm() {
		return "share/shareWriteFrm";
	}
	@ResponseBody
	@RequestMapping(value="/boardSummerImage.do")
	public String boardSummer(MultipartFile file, HttpServletRequest request) {
		
		String saveRoot = request.getSession().getServletContext().getRealPath("/resources/upload/share/");
		String originalFileName = file.getOriginalFilename(); 	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));

		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
		try {
			FileOutputStream fos = new FileOutputStream(new File(saveRoot + savedFileName));
			// 업로드 속도증가를 위한 보조스트림
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			// 파일 업로드
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/resources/upload/share/" + savedFileName;		
	}
	
	@RequestMapping(value="/insertShareBoard.do")
	public String insertShareBoard(Share s,HttpServletRequest request, MultipartFile files, Model model) {
		if (!files.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/share/");
			// 사용자가 올린 파일명
			String filename = files.getOriginalFilename();
			// 올린 파일명에서 확장자 앞까지 자르기
			String onlyFilename = filename.substring(0, filename.indexOf("."));
			// 올린 파일명에서 확장자 부분 자르기
			String extention = filename.substring(filename.indexOf("."));

			// 실제 업로드할 파일명
			String filepath = null;
			// 중복 파일 뒤에 붙여줄 숫자
			int count = 0;
			// 중복된 파일이 없을 때까지 반복(파일명 중복시 숫자 붙이는 코드)
			while (true) {
				if (count == 0) {
					filepath = onlyFilename + extention;
				} else {
					filepath = onlyFilename + "_" + count + extention;
				}
				// 파일 경로안에 중복된 파일이 있는지 체크
				File checkFile = new File(savePath + filepath);
				if (!checkFile.exists()) {
					break;
				}
				count++;
			}

			// 중복처리가 끝나면 파일 업로드
			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				byte[] bytes = files.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// 중복처리된 파일 이름 넣어주기
			s.setFilepath(filepath);
			s.setFilename(filename);

		}

		int result = service.insertShareBoard(s);

		if (result > 0) {
			model.addAttribute("title", "등록성공");
			model.addAttribute("msg", "글 작성이 완료 되셨습니다.");
			model.addAttribute("loc", "/shareList.do");
			model.addAttribute("icon", "success");
		} else {
			model.addAttribute("title", "변경실패");
			model.addAttribute("msg", "글 작성에 실패하셨습니다.");
			model.addAttribute("loc", "/shareList.do");
			model.addAttribute("icon", "warning");
		}
		return "member/swalMsg";
	}
}
