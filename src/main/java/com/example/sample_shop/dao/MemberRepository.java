package com.example.sample_shop.dao;
import com.example.sample_shop.dto.Member;
import java.util.*;

public class MemberRepository {
	
	private final ArrayList<Member> members = new ArrayList<>();
	private static final MemberRepository instance = new MemberRepository();
	
	public static MemberRepository getInstance() {
		return instance;
	}
	
	public Member getMemberById(String memberId) {
		Member member= null;	// 못찾는 경우도 있으니까 Null 값을 잡는것이다.
		
		for(Member m : members) {
			if(m.getMemberId().equals(memberId)) {
				member = m;
				break;
			}
		}
		return member;
		
	}
	
	public void addMember(Member member) {
		members.add(member);
	}
}
