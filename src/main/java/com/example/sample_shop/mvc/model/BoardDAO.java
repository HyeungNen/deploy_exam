package com.example.sample_shop.mvc.model;

import java.sql.*;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class BoardDAO {
	// 싱글턴 타입으로 작성
	
	private static BoardDAO instance;
	
	private BoardDAO() {
		
	}
	
	public static BoardDAO getInstance() {
		if(instance == null)
			instance = new BoardDAO();
			return instance;
	}
	
	// 메서드 추가
	public int getListCount(String items, String text) {
		// board 테이블의 전체 레코드 개수 반환
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		int cnt = 0;
		
		String sql;
		
		if(items == null || text == null) {	// 검색어가 없는 경우
			sql = "SELECT count(*) FROM board";
		}
		
		else {
			sql = "SELECT count(*) FROM board WHERE "+ items + "LIKE '%" + text + "%'";
		}
		
		
		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) { // 데이터가 있는 경우
				cnt = resultSet.getInt(1);
			}
			
		} catch (Exception ex) {
			System.out.println("getListCount() 에러 : " + ex);
			
		} finally {
			try {
				
				if(resultSet != null)
					resultSet.close();
				
				if(preparedStatement != null) 
					preparedStatement.close();
				
				if(connection != null)
					connection.close();
				
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
			
		} // finally
		return cnt;
		
	} // 메서드 
	
	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text) { // limit를 쓰는 이유는
		// 게시판에 있는 모든 정보를 불러 오는 것이 아닌 페이지 넘기기 형식으로 하기 때문에 값을 원하는 만큼 들고와서 사용
		
		// board 테이블에 있는 레코드 가져오기
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		int start = (page -1) * limit;
		String sql;
		
		if (items == null || text == null) { // 검색어가 없는 경우
			sql = "SELECT * FROM board ORDER BY num DESC";
		}
		else {
			sql = "SELECT * FROM board WHERE + " + items + " LIKE '%" + text + "%' ORDER BY num DESE ";
		}
		sql += " LIMIT" + start + ", " + limit;
		
		
		ArrayList<BoardDTO> list = new ArrayList<>();
		
		try {
			connection = DBConnection.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				BoardDTO board = new BoardDTO();
				board.setNum(resultSet.getInt("num"));
				board.setMemberId(resultSet.getString("memberId"));
				board.setName(resultSet.getString("Name"));
				board.setSubject(resultSet.getString("Subject"));
				board.setContent(resultSet.getString("Content"));
				board.setAddDate(resultSet.getString("AddDate"));
				board.setHit(resultSet.getInt("Hit"));
				board.setIp(resultSet.getString("Ip"));
				list.add(board);
			}
			return list;
			
		} catch (Exception ex) {
			System.out.println("getBoardList() 에러 : " + ex);
			
		} finally {
			try {
				if(resultSet != null)
					resultSet.close();
				
				if(preparedStatement != null)
					preparedStatement.close();
				
				if(connection != null)
					connection.close();
				
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
			
		} // finally
		return null;
		
	} // ArrayList<Board>
	
} // 클래스
