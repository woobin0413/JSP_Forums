package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.beans.Board;
import com.board.controller.CommandAction;
import com.board.dao.BoardDao;

public class CountAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		int idx =Integer.parseInt( request.getParameter("idx"));		//전 페이지로부터 넘어온 idx값을 받고
		
		Board article = BoardDao.getInstance().getArticle(idx);		// 게시글 전체를 가져옵니다.
		String regip = request.getRemoteAddr();	// 현재 조회를 요청한 사용자의 ip를 받고

		if(!regip.equals(article.getRegip())){			// 게시글의 ip와 동일하지 않으면
			int count = article.getCount();					// 게시글의 ip를 받아서 
			article.setCount(++count);						// +1 해주고 게시글빈에 셋팅합니다.
			BoardDao.getInstance().setArticleCount(article);	// 이후 이 빈을 파라미터로 업데이트합니다.
		}
		request.setAttribute("url", "content.do?idx="+idx);

		return "redirect2.jsp";
		}
}
