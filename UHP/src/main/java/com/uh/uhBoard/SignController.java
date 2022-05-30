package com.uh.uhBoard;


import java.util.ArrayList;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.uh.api.FacebookLog;
import com.uh.api.GoogleLog;
import com.uh.api.KakaoLog;
import com.uh.api.NaverLog;
import com.uh.dao.MemberDao;
import com.uh.vo.MemberVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SignController {
	
	@Autowired
	MemberDao memberDao;
	@Autowired
	MemberVo memberVo;
	@Autowired
	FacebookLog fLog;
	@Autowired
	GoogleLog gLog;
	@Autowired
	NaverLog nLog;
	@Autowired
	KakaoLog kLog;
	
	
	
	
	@RequestMapping(value = "/sign_in", method = RequestMethod.GET)
	public String sign_in(Locale locale, Model model) {
		model.addAttribute("kakaoLoginUrl", kLog.getLoginUrl());
		model.addAttribute("naverLoginUrl",nLog.getLoginUrl());
		model.addAttribute("googleLoginUrl",gLog.getLoginUrl());
		model.addAttribute("faceLoginUrl",fLog.getFaceUrl());
		
		return "/sign_view/sign_in";
	}
	@RequestMapping(value = "/sign_in.do", method = RequestMethod.GET)
	public String sign_in_do(Locale locale, Model model,String id, String password,HttpSession session) throws Exception {
		
		memberVo.setMember_id(id);
		memberVo.setMember_pw(password);
		memberVo=memberDao.login(memberVo);
		
		if(memberVo!=null) {
			session.setAttribute("nick", memberVo.getMember_nick());
		return "redirect:main";
		}
		else 
			return "redirect:sign_in";
		
	}
	

	@RequestMapping(value = "/sign_up")
	public String sign_up(Locale locale, Model model) {

		
		return "/sign_view/sign_up";
	}
	@RequestMapping(value = "/notSignIn")
	public String notSignIn(Locale locale, Model model) {

		
		return "/sign_view/notSignIn";
	}
	
	
	@RequestMapping(value = "/find_id", method = RequestMethod.GET)
	public String find_id(Locale locale, Model model) {
		
		
		return "/sign_view/find_id";
	}
	
	@RequestMapping(value = "/sign_agree", method = RequestMethod.GET)
	public String sign_agree(Locale locale, Model model) {

		
		return "/sign_view/sign_agree";
	}
	@RequestMapping(value = "/sign_up.do", method = RequestMethod.GET)
	public String sign_up_do(String member_name,String member_id,String member_pw,String member_phone,RedirectAttributes redirectAttributes) throws Exception {

		redirectAttributes.addFlashAttribute("member_id",member_id).addFlashAttribute("member_pw",member_pw).addFlashAttribute("member_name",member_name).addFlashAttribute("phone_num",member_phone);
		
		memberVo.setMember_phone(member_phone);
		ArrayList<MemberVo> list =(ArrayList<MemberVo>)memberDao.selectByPhone(memberVo);
		if(list.size()==0) {
			return "redirect:nick?api=false";
		}else {
			memberVo.setMember_name(member_name);
			memberVo.setMember_id(member_id);
			memberVo.setMember_pw(member_pw);
			memberVo.setMember_phone(member_phone);
			
			memberDao.updateSignUp(memberVo);
			return "redirect:sign_in";
		}

	
	}
	@RequestMapping(value = "/sign_up_nick.do")
	public String sign_up_nick(String member_name,String member_id,String member_pw,String phone_num,String nick) throws Exception {
			
	
		
		memberVo.setMember_name(member_name);
		memberVo.setMember_nick(nick);
		memberVo.setMember_id(member_id);
		memberVo.setMember_pw(member_pw);
		memberVo.setMember_phone(phone_num);
		
		memberDao.insert(memberVo);
	
		return "redirect:sign_in";

	}
	@RequestMapping(value = "/checkId.do", method = RequestMethod.GET)
	@ResponseBody
	public String checkId(Locale locale, Model model,String id) throws Exception {
		memberVo.setMember_id(id);
		System.out.println(id);
		ArrayList<MemberVo> list=(ArrayList<MemberVo> )memberDao.checkId(memberVo);
		if(list.size()==0) {
			return "true";
		}else {
			return "false";
		}
	
	}

	
	
	
	
	@RequestMapping(value = "/sign_out", method = RequestMethod.GET)
	public String sign_out(Locale locale, Model model,HttpSession session) {
		session.invalidate();
		
		return "redirect:main";
	}
	
	
}
