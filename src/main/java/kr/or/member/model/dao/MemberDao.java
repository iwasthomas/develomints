package kr.or.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectOneMember(Member member) {
		return sqlSession.selectOne("member.selectOneMember",member);
	}

	public Member checkPhone(String phone) {
		return sqlSession.selectOne("member.checkPhone",phone);
	}
	
	
}