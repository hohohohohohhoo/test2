package kr.co.dw.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.dw.domain.MemberDTO;

public class LoginHandlerInterceptor extends HandlerInterceptorAdapter{

	@Override  //member컨트롤러의 로그인으로 가야함
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = modelAndView.getModel();
		MemberDTO login = (MemberDTO)map.get("login");
		
		HttpSession session = request.getSession();
		
		session.setAttribute("login",login);
	}

	
	
}
