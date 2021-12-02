package kr.or.contest.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.or.contest.vo.Contest;

@Repository
public class ContestDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertContest(Contest c) {
		int result = sqlSession.insert("contest.insertContest",c);
		return result;
	}

	public ArrayList<Contest> contestAllList() {
		List<Contest> list = sqlSession.selectList("contest.contestAllList");
		return (ArrayList<Contest>)list;
	}

	public ArrayList<Contest> newContestList() {
		List<Contest> list = sqlSession.selectList("contest.newContestList");
		return (ArrayList<Contest>)list;
	}

	public ArrayList<Contest> hotContestList() {
		List<Contest> list = sqlSession.selectList("contest.hotContestList");
		return (ArrayList<Contest>)list;
	}
}
