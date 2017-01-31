package com.board.dao;

import com.board.db.sqlconfig.IBatisDBConnector;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.board.db.sqlconfig.IBatisDBConnector;

public class CommonDao {
	private SqlMapClient myDB;
	public void SetDB() {
		myDB = IBatisDBConnector.getSqlMapInstance();
	}
	
	protected SqlMapClient GetDB() {
		return myDB;
	}
}