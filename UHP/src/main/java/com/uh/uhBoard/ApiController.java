package com.uh.uhBoard;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.uh.api.FacebookLog;
import com.uh.api.GoogleLog;
import com.uh.api.KakaoLog;
import com.uh.api.NaverLog;
import com.uh.dao.MemberDao;
import com.uh.vo.MemberVo;

import java.net.URLEncoder;
import java.util.ArrayList;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;



@Controller
public class ApiController {
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
	
	
	
	
	//api로그인 리다이렉트 페이지. 각 플렛폼마다의 리턴페이짐 플렛폼. 사이트에서 지정해둠
		@RequestMapping(value = "/kakaoLog.do", method = RequestMethod.GET)
		public String kakaoLog(Locale locale, Model model,String code) {
			System.out.println("123");
			return "redirect:getEmail.do?platform=member_kakao&code="+code;
		}
		@RequestMapping(value = "/googleLog.do", method = RequestMethod.GET)
		public String googleLog(Locale locale, Model model,String code) throws Exception {
				return "redirect:getEmail.do?platform=member_google&code="+code;		
		}
		@RequestMapping(value = "/naverLog.do", method = RequestMethod.GET)
		public String naverLog(Locale locale, Model model,String code) throws Exception {
			return "redirect:getEmail.do?platform=member_naver&code="+code;
			
		}
		@RequestMapping(value = "/faceLog.do", method = RequestMethod.GET)
		public String faceLog(Locale locale, Model model,String code) throws Exception {
			return "redirect:getEmail.do?platform=member_face&code="+code;
			
		}
		
		
		//api를 통해 로그인 시 해당 getEail.do url로 로그인 한 사람의 정보를 리턴 받는다 
		@RequestMapping(value = "/getEmail.do", method = RequestMethod.GET)
		public String log(Locale locale, Model model,String code,String platform,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws Exception {
			response.setContentType("text/html;charset=UTF-8");
			String returnPage="redirect:main";
	
			ArrayList<MemberVo> list=new ArrayList<MemberVo>();
			
			String accessToken,userEmail;
			if(platform.equals("member_kakao")) {
				accessToken=kLog.getAccessToken(code);
				userEmail=kLog.getEmail(accessToken);	
				
			}else if(platform.equals("member_google")) {
				accessToken=gLog.getAccessToken(code);
				userEmail=gLog.getEmail(accessToken);	
				
			}else if(platform.equals("member_naver")) {
				accessToken=nLog.getAccessToken(code);
				userEmail=nLog.getEmail(accessToken);	
				
			}else{
				accessToken=fLog.getAccessToken(code);
				userEmail=fLog.getEmail(accessToken);	
			}
			//여기 까지 이메일 추출 
			System.out.println("email : " + userEmail);
			
			//해당 플렛폼으로 해당이메일이 있는지 검색.			
			
			  memberVo.setPlatform(platform); 
			  memberVo.setEmail(userEmail);
	
			 list=(ArrayList<MemberVo>)memberDao.selectPlatform(memberVo);
			 if(list.size()==0) {//없음 엾으니까 가입절차에 따른 휴대폰인증
				 return "redirect:phone?platform="+platform+"&email="+userEmail;
			 }else {//있음 있으니까 바로 로그인		
				 return "redirect:api_sign_in?platform="+platform+"&email="+userEmail+"&nick="+URLEncoder.encode(list.get(0).getMember_nick(),"UTF-8");
			 }
				
			
		}
		//바로로근인
		@RequestMapping(value = "/api_sign_in", method = RequestMethod.GET)
		public String apiSignIn(Model model,String platform,String email,String nick,HttpSession session) throws Exception {
			session.setAttribute("nick", nick);
			return "redirect:main";
			
		}
		//가입절차에 따른 휴대폰인증페이지 . 인증 관련 코드는 smsController에서 관리함
		@RequestMapping(value = "/phone", method = RequestMethod.GET)//휴대폰인증
		public String  apiSignUp(Model model,String platform,String email) throws Exception {
	
			return "sign_view/phone";
		}
		
		@RequestMapping(value = "/hasNick", method = RequestMethod.POST)//휴대폰 인증이 끝난후 닉네임을 전에 설정했는지 확인. 다른방식으로 회원이였으면 이미 닉네임이 있을 것이고, 이게 처음 가입이면 닉네임이 없을거다.
		public String  nick(Model model,String platform,String email,String phone_num,RedirectAttributes redirectAttributes,HttpSession session) throws Exception {

			
			redirectAttributes.addFlashAttribute("email",email).addFlashAttribute("platform",platform).addFlashAttribute("phone_num",phone_num);
			
			memberVo.setMember_phone(phone_num);
			ArrayList<MemberVo> list=(ArrayList<MemberVo>)memberDao.selectByPhone(memberVo);
			
				if(list.size()==0) {
					return "redirect:nick";
				}else {
					return "redirect:yesNick";
				}
			
		}
		
		//기존 생성한 닉네임이 있을때
		@RequestMapping(value = "/yesNick")
		public String  yesNick(Model model,HttpServletRequest request,HttpSession session) throws Exception {
			
			Map<String,?> param=RequestContextUtils.getInputFlashMap(request);
			
			String platform=(String)param.get("platform");
			String email=(String )param.get("email");
			String phone_num=(String)param.get("phone_num");

			memberVo.setPlatform(platform);
			memberVo.setEmail(email);
			memberVo.setMember_phone(phone_num);
			memberDao.updateYesNick(memberVo);	
			ArrayList<MemberVo> list=(ArrayList<MemberVo> )memberDao.selectByPhone(memberVo);
			session.setAttribute("nick", list.get(0).getMember_nick());
		
			
			
			return "redirect:main";
		}
		
		//기존 생성한 닉네임이 없을때 닉네임 입력 페이지로 이동해 닉네임을 받아 noNick에서 update를 한다.
		@RequestMapping(value = "/nick")
		public String  nick(Model model,HttpServletRequest request) throws Exception {
			Map<String,?> param=RequestContextUtils.getInputFlashMap(request);
			
			String platform=(String)param.get("platform");
			String email=(String )param.get("email");
			String phone_num=(String)param.get("phone_num");
			String member_name=(String)param.get("member_name");
			String member_id=(String )param.get("member_id");
			String member_pw=(String)param.get("member_pw");

			
			model.addAttribute("platform",platform);
			model.addAttribute("email",email);
			model.addAttribute("phone_num",phone_num);
			model.addAttribute("member_name",member_name);
			model.addAttribute("member_id",member_id);
			model.addAttribute("member_pw",member_pw);


	
			return "sign_view/nick";
			
		}
		//닉네임 중복확인 . 사용가능하면 true, 불가능 flase
		@RequestMapping(value = "/checkNick")
		@ResponseBody
		public String  checkNick(String nick) throws Exception {

			memberVo.setMember_nick(nick);
			if(memberDao.checkNick(memberVo).size()==0) {
				return "true";
			}else {
				return "flase";
			}
		
		}
		
		@RequestMapping(value = "/noNick" , method = RequestMethod.POST)
		public String  noNick(Model model,String phone_num,String platform,String email,String nick,HttpSession session) throws Exception {
	
			memberVo.setPlatform(platform);
			memberVo.setEmail(email);
			memberVo.setMember_nick(nick);
			memberVo.setMember_phone(phone_num);
			memberDao.insertNoNick(memberVo);
			
			session.setAttribute("nick",  nick);
			
			return "redirect:main";
			
		}
		
		
		
		
//		@RequestMapping(value = "/api_.do", method = RequestMethod.GET)
//		public String sigIn(Locale locale, Model model,String email,String platform,String phoneNum,HttpSession session) {
//	
//			ArrayList<MemberVo> list=new ArrayList<MemberVo>();
//			memberVo.setEmail(email);
//			memberVo.setPlatform(platform);
//			memberVo.setPhoneNum(phoneNum);
//			list=(ArrayList<memberVo>)dao.selectPhoneNum(memberVo);
//			if(list.size()==0) {
//				memberDao.insert(memberVo);
//			}else {
//				memberDao.update(memberVo);
//			}
//			list=(ArrayList<Vo>)dao.selectPhoneNum(vo);
//
//			session.setAttribute("IdIdx", list.get(0).getIdx());
//			
//			return "redirect:main";
//		}
//		
//
//		
//		
//		//전체 로그아웃 페이지
//		@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
//		public String logout(Locale locale, Model model,HttpSession session) {
//			session.setAttribute("IdIdx", null);
//			session.setAttribute("email", null);
//			session.setAttribute("platform", null);
//
//
//			return "redirect:home";
//		}

	
	
	
}
