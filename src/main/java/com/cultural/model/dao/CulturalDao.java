package com.cultural.model.dao;

import static com.cultural.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cultural.common.JDBCTemplate;
import com.cultural.model.vo.Cultural;
import com.cultural.model.vo.CulturalDetail;
import com.cultural.model.vo.CulturalList;

public class CulturalDao {

	public List<CulturalList> selectAll(Connection conn) {
		List<CulturalList> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM CULTURAL_LIST ORDER BY CNO";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int count = 1;
				int cno = rs.getInt(count++);
				int seq = rs.getInt(count++);
				String title = rs.getString(count++);
				Date startDate = rs.getDate(count++);
				Date endDate = rs.getDate(count++);
				String place = rs.getString(count++);
				String realmName = rs.getString(count++);
				String area = rs.getString(count++);
				String thumbnail = rs.getString(count++);
				Double gpsX = rs.getDouble(count++);
				Double gpsY = rs.getDouble(count++);

				CulturalList info = new CulturalList(cno, seq, title, startDate, endDate, place, realmName, area,
						thumbnail, gpsX, gpsY);
				list.add(info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	public List<Integer> selectBySeq(Connection conn) {
		List<Integer> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT SEQ FROM CULTURAL_LIST";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int count = 1;
				int seq = rs.getInt(count++);
				list.add(seq);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return list;
	}

	public List<Cultural> selectByJoin(Connection conn) {
		List<Cultural> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select CNO, SEQ, TITLE, STARTDATE, ENDDATE, PLACE, REALMNAME, AREA, THUMBNAIL, subTitle, "
					+ "price, contents1, contents2, url, phone, imgUrl, gpsX, gpsY, placeUrl, placeAddr, placeSeq "
					+ "from cultural_list natural join cultural_detail;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int count = 1;
				int cno = rs.getInt(count++);
				int seq = rs.getInt(count++);
				String title = rs.getString(count++);
				Date startDate = rs.getDate(count++);
				Date endDate = rs.getDate(count++);
				String place = rs.getString(count++);
				String realmName = rs.getString(count++);
				String area = rs.getString(count++);
				String thumbnail = rs.getString(count++);
				String subTitle = rs.getString(count++);
				String price = rs.getString(count++);
				String contents1 = rs.getString(count++);
				String contents2 = rs.getString(count++);
				String url = rs.getString(count++);
				String phone = rs.getString(count++);
				String imgUrl = rs.getString(count++);
				Double gpsX = rs.getDouble(count++);
				Double gpsY = rs.getDouble(count++);
				String placeUrl = rs.getString(count++);
				String placeAddr = rs.getString(count++);
				int placeSeq = rs.getInt(count++);

				Cultural info = new Cultural(cno, seq, title, startDate, endDate, place, realmName, area, thumbnail,
						subTitle, price, contents1, contents2, url, phone, imgUrl, gpsX, gpsY, placeUrl, placeAddr,
						placeSeq);

				list.add(info);
			}

		} catch (Exception e) {

		} finally {

		}

		return list;
	}

	public CulturalList selectOne(Connection conn, int cno) {
		CulturalList info = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM CULTURAL_LIST WHERE CNO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int count = 1;
				int cno2 = rs.getInt(count++);
				int seq = rs.getInt(count++);
				String title = rs.getString(count++);
				Date startDate = rs.getDate(count++);
				Date endDate = rs.getDate(count++);
				String place = rs.getString(count++);
				String realmName = rs.getString(count++);
				String area = rs.getString(count++);
				String thumbnail = rs.getString(count++);
				Double gpsX = rs.getDouble(count++);
				Double gpsY = rs.getDouble(count++);

				info = new CulturalList(cno2, seq, title, startDate, endDate, place, realmName, area, thumbnail, gpsX,
						gpsY);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return info;
	}

	public List<CulturalList> selectByName(Connection conn, String cname) {
		List<CulturalList> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM CULTURAL_LIST WHERE title ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + cname + "%");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int count = 1;
				int cno = rs.getInt(count++);
				int seq = rs.getInt(count++);
				String title = rs.getString(count++);
				Date startDate = rs.getDate(count++);
				Date endDate = rs.getDate(count++);
				String place = rs.getString(count++);
				String realmName = rs.getString(count++);
				String area = rs.getString(count++);
				String thumbnail = rs.getString(count++);
				Double gpsX = rs.getDouble(count++);
				Double gpsY = rs.getDouble(count++);

				CulturalList info = new CulturalList(cno, seq, title, startDate, endDate, place, realmName, area,
						thumbnail, gpsX, gpsY);
				list.add(info);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return list;
	}

	public int insert(Connection conn, CulturalList culturalList) {
		try {
			String sql = "INSERT INTO " + "CULTURAL_LIST(cno, seq, title, startDate, endDate, place, "
					+ "								realmName, area, thumbnail, gpsX, gpsY) " + "VALUES(0, "
					+ "		?, ?, ?, ?, ?, " + "		?, ?, ?, ?, ?) ";

			PreparedStatement pstmt = conn.prepareStatement(sql);

			int cnt = 1;
			pstmt.setInt(cnt++, culturalList.getSeq());
			pstmt.setString(cnt++, culturalList.getTitle());
			pstmt.setDate(cnt++, new Date(culturalList.getStartDate().getTime()));
			pstmt.setDate(cnt++, new Date(culturalList.getEndDate().getTime()));
			pstmt.setString(cnt++, culturalList.getPlace());
			pstmt.setString(cnt++, culturalList.getRealmName());
			pstmt.setString(cnt++, culturalList.getArea());
			pstmt.setString(cnt++, culturalList.getThumbnail());
			pstmt.setDouble(cnt++, culturalList.getGpsX());
			pstmt.setDouble(cnt++, culturalList.getGpsY());

			int result = pstmt.executeUpdate();
			pstmt.close();
			return result;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1;
	}

	public int insertDetail(Connection conn, CulturalDetail culturalDetail) {
		try {
			String sql = "INSERT INTO " + "CULTURAL_DETAIL(seq, title, startDate, endDate, place, realmName, "
					+ "					area, subTitle, price, contents1, contents2, "
					+ "					url, phone, imgUrl, gpsX, gpsY, placeUrl,"
					+ "					placeAddr, placeSeq" + ") " + "VALUES(?, ?, ?, ?, ?, ?,"
					+ "		?, ?, ?, ?, ?," + "		?, ?, ?, ?, ?, ?, ?, ?) ";

			PreparedStatement pstmt = conn.prepareStatement(sql);

			int cnt = 1;
			pstmt.setInt(cnt++, culturalDetail.getSeq());
			pstmt.setString(cnt++, culturalDetail.getTitle());
			pstmt.setDate(cnt++, new Date(culturalDetail.getStartDate().getTime()));
			pstmt.setDate(cnt++, new Date(culturalDetail.getEndDate().getTime()));
			pstmt.setString(cnt++, culturalDetail.getPlace());
			pstmt.setString(cnt++, culturalDetail.getRealmName());
			pstmt.setString(cnt++, culturalDetail.getArea());
			pstmt.setString(cnt++, culturalDetail.getSubTitle());
			pstmt.setString(cnt++, culturalDetail.getPrice());
			pstmt.setString(cnt++, culturalDetail.getContents1());
			pstmt.setString(cnt++, culturalDetail.getContents2());
			pstmt.setString(cnt++, culturalDetail.getUrl());
			pstmt.setString(cnt++, culturalDetail.getPhone());
			pstmt.setString(cnt++, culturalDetail.getImgUrl());
			pstmt.setDouble(cnt++, culturalDetail.getGpsX());
			pstmt.setDouble(cnt++, culturalDetail.getGpsY());
			pstmt.setString(cnt++, culturalDetail.getPlaceUrl());
			pstmt.setString(cnt++, culturalDetail.getPlaceAddr());
			pstmt.setInt(cnt++, culturalDetail.getPlaceSeq());

			int result = pstmt.executeUpdate();
			pstmt.close();
			return result;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1;
	}

	public int insertCultural(Connection conn, Cultural cultural) {

		try {
			String sql = "insert into cultural(CNO, SEQ, TITLE, STARTDATE, ENDDATE, PLACE, REALMNAME, AREA, THUMBNAIL, subTitle, "
					+ "price, contents1, contents2, url, phone, imgUrl, gpsX, gpsY, placeUrl, placeAddr, placeSeq) "
					+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			int cnt = 1;
			pstmt.setInt(cnt++, cultural.getCno());
			pstmt.setInt(cnt++, cultural.getSeq());
			pstmt.setString(cnt++, cultural.getTitle());
			pstmt.setDate(cnt++, new Date(cultural.getStartDate().getTime()));
			pstmt.setDate(cnt++, new Date(cultural.getEndDate().getTime()));
			pstmt.setString(cnt++, cultural.getPlace());
			pstmt.setString(cnt++, cultural.getRealmName());
			pstmt.setString(cnt++, cultural.getArea());
			pstmt.setString(cnt++, cultural.getThumbnail());
			pstmt.setString(cnt++, cultural.getSubTitle());
			pstmt.setString(cnt++, cultural.getPrice());
			pstmt.setString(cnt++, cultural.getContents1());
			pstmt.setString(cnt++, cultural.getContents2());
			pstmt.setString(cnt++, cultural.getUrl());
			pstmt.setString(cnt++, cultural.getPhone());
			pstmt.setString(cnt++, cultural.getImgUrl());
			pstmt.setDouble(cnt++, cultural.getGpsX());
			pstmt.setDouble(cnt++, cultural.getGpsY());
			pstmt.setString(cnt++, cultural.getPlaceUrl());
			pstmt.setString(cnt++, cultural.getPlaceAddr());
			pstmt.setInt(cnt++, cultural.getPlaceSeq());

			int result = pstmt.executeUpdate();
			pstmt.close();
			return result;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1;
	}

	public static void main(String[] args) throws SQLException {
		Connection conn = JDBCTemplate.openConnection();
//		List<CulturalList> list = new CulturalDao().selectAll(conn);
		System.out.println("정보");
//		for (CulturalList info : list) {
//			System.out.println(info);
//		}
//		List<Integer> list2 = new CulturalDao().selectBySeq(conn);
//		for (int i : list2) {
//			System.out.println(i);
//		}
		List<Cultural> list3 = new CulturalDao().selectByJoin(conn);
		for (Cultural c : list3) {
			System.out.println("공연/전시 정보 : " + c);
		}

	}

}
