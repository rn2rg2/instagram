
<%@page import="com.multi.instagram.member.MemberDTO"%>
<%@page import="com.multi.instagram.follow.FollowDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="/instagram/common/css/instagram_follow_popup.css">
<%
ArrayList<FollowDTO> followList = (ArrayList<FollowDTO>) request.getAttribute("followlist");
ArrayList<MemberDTO> memberlist = (ArrayList<MemberDTO>) request.getAttribute("memberlist");

%>
<div class="modal-content">
	<div class="modal-header">
		<h4>팔로우</h4>
		<button type="button" class="close" data-dismiss="modal">&times;</button>
	</div>
	<div class="modal-body ">
		<div class="body_box">
			<%
			int size = followList.size();
			for (int i = 0; i < size; i++) {
				FollowDTO f = followList.get(i);
			%>
			<div class="list_image_box list_profile list1">
				<img class="profile_image2" src="/instagram/images/dog_2.jpg">
			</div>
			<div class="list_profile list2">
				<div class="list_profile_text">
				<!-- 닉네임  수정 -->
					<%
					for (int j = 0; j < memberlist.size(); j++) {
						MemberDTO member = memberlist.get(j);
						if (member.getId().equals(f.getFollowing_id())) {
					%>
					<div class="head_font">
						<a
							href="/instagram/myprofile?pageType=user&member_id=<%=f.getFollowing_id()%>"><%=member.getNickname()%></a>
					</div>
					<%
						}
					}
					%>

				</div>
			</div>
			<div class="list_profile list3">
				<button class="bnt2 head_font"
					onclick="location.href='/instagram/follow/disconnectFollow.do?follow_id=<%=f.getFollow_id()%>&pageType=<%=request.getAttribute("pageType")%>&member_id=<%=request.getAttribute("member_id")%>'">삭제</button>
			</div>

			<%
			}
			%>
		</div>
	</div>
</div>
