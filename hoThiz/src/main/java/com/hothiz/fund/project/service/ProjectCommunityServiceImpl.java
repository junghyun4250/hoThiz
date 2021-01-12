package com.hothiz.fund.project.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.project.dao.ProjectDAO;
import com.hothiz.fund.project.dto.ProjectCommunityDTO;
import com.hothiz.fund.project.dto.ProjectPagingDTO;
import com.hothiz.fund.project.dto.ProjectParamDTO;
import com.hothiz.fund.project.dto.ProjectReplyDTO;

@Service
public class ProjectCommunityServiceImpl implements ProjectCommunityService {

   
   @Autowired
   ProjectDAO dao;
   
   
   @Override
   public void writeOnCommunity(ProjectCommunityDTO coDto) {
      dao.writeOnBoard(coDto);
      
   }
   
   
   public String getLastBno(int project_id) {
      
      String chk = dao.getLastBno(project_id);
      
      if(chk==null) chk="0";
      
      return chk;
   }
   
   

   //처음 게시글들
   @Override
   public ArrayList<ProjectCommunityDTO> getBoardList(int project_id){
      ProjectPagingDTO pageDto = new ProjectPagingDTO();
      pageDto.setPER_PAGE_PROJECT(5);pageDto.setStartRownum();pageDto.setEndRownum();
   
      ArrayList<ProjectCommunityDTO> list = dao.getBoardList(project_id, pageDto);
      
      SimpleDateFormat brdDate = new SimpleDateFormat("yyyy.MM.dd");
      
      for(ProjectCommunityDTO dto : list) {
         dto.setDateFormat(brdDate.format(dto.getRegdate()));
      }
      
      
      
      return list;
      
   }
   
   
   
   
   //비동기 게시글
   @Override
   public String getNoSyncBoardList(int project_id, int page){
      ProjectPagingDTO pageDto = new ProjectPagingDTO(page);
      pageDto.setPER_PAGE_PROJECT(5);pageDto.setStartRownum();pageDto.setEndRownum();
      
      ArrayList<ProjectCommunityDTO> list = dao.getBoardList(project_id,pageDto);
      SimpleDateFormat brdDate = new SimpleDateFormat("yyyy.MM.dd");
      
      
      for(ProjectCommunityDTO dto : list) {
         dto.setDateFormat(brdDate.format(dto.getRegdate()));

      }
      return jsonMapper(list);
      
   }
   
   
   //비동기 댓글
   @Override
   public String getReply(ProjectReplyDTO reDto){
      ArrayList<ProjectReplyDTO> list = dao.getReplyOnBoard(reDto);
      
      //맵에 넣자..게시글 번호 : {댓글 쓴사람 : ____, 댓글 내용 : _____< }
      SimpleDateFormat brdDate = new SimpleDateFormat("yyyy.MM.dd");
      
      for(ProjectReplyDTO dto : list) {
         dto.setDateFormat(brdDate.format(dto.getRegdate()));

      }
      
      
      //ReplyDTO에 해당하는 유저네임 넣어주자.
      
      ArrayList<MemberDTO> mem = dao.getMemberList();
      
      for(ProjectReplyDTO d : list) {
         for(MemberDTO m : mem) {
            if(d.getMember_email().equals( m.getMember_email())) {
               d.setMember_name(m.getMember_name());
            } ///만약 이메일 같으면 이름을 넣어주라. data안에 있음.
            
            
         }
         
      }
      
      
      return jsonMapper(list);
      
   }
   
   //비동기 댓글 저장하고 가장 최근댓글 가져올거임
   public String writeReply(ProjectReplyDTO reDto) {
      dao.writeReplyOnBoard(reDto);
      

      
      return getReply(reDto);
      
   }
   
   
   
   @Override
   public String deleteReply (ProjectReplyDTO reDto) {
      dao.deleteReply(reDto);

      return getReply(reDto);
   }
   
   
   @Override
   public String editReply(ProjectReplyDTO reDto) {
      return getReply(reDto);

   }
   
   
   
   //JSON으로 파싱하는 메소드(비동기시 필수)====================================
   @Override
   public String jsonMapper(Object obj) {
      ObjectMapper mapper = new ObjectMapper();
      String jsonStr = null;

      try {
         jsonStr = mapper.writeValueAsString(obj);
      } catch (JsonProcessingException e) {
         e.printStackTrace();
      }
      
      return jsonStr;   
   }





}