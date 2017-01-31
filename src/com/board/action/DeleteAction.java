package com.board.action;

import java.io.File;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.beans.Board;
import com.board.controller.CommandAction;
import com.board.dao.BoardDao;

public class DeleteAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		int  idx = Integer.parseInt(request.getParameter("idx"));
		
		Board article = BoardDao.getInstance().getArticle(idx);
		String filename = article.getFilename();
		String uploadFileName = request.getRealPath("/upload") +"/"+ filename;

		File uploadfile = new File (uploadFileName);
		if ( uploadfile.exists()&& uploadfile.isFile() )
		{
			 uploadfile.delete();		
		}
		
		BoardDao.getInstance().deleteArticle(idx);	

		return "delete.jsp";
		}

}