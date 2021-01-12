package com.hothiz.fund.project.controller;





import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.nio.channels.SeekableByteChannel;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.hothiz.fund.member.dto.MemberDTO;
import com.hothiz.fund.member.dto.Member_alarmDTO;
import com.hothiz.fund.member.dto.Member_likeDTO;
import com.hothiz.fund.member.dto.Member_messageDTO;
import com.hothiz.fund.project.dao.ProjectDAO;
import com.hothiz.fund.project.dto.ProjectParamDTO;
import com.hothiz.fund.project.dto.ProjectReplyDTO;
import com.hothiz.fund.project.dto.ProjectCommunityDTO;
import com.hothiz.fund.project.dto.ProjectInfoDTO;
import com.hothiz.fund.project.dto.ProjectPagingDTO;
import com.hothiz.fund.project.service.ProjectCommunityService;
import com.hothiz.fund.project.service.ProjectService;


@RestController
@RequestMapping("/discover")
public class ProjectOutputController {
   
   @Autowired
   ProjectService ps;
   @Autowired
   ProjectCommunityService pcs;

   private final String IMAGE_REPO = "D:\\eclipse(spring)\\hoThiz\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\hoThiz\\resources\\img\\community";
   private final String IMAGE_PATH = "/fund/resources/img/community";
   
   ///////////////////////////게시글 목록///////////////////////
   //게시글 화면
   @GetMapping(value="", produces = "application/json;charset=utf-8")
   public ModelAndView projectList(ModelAndView mv,
         ProjectParamDTO paramDto, HttpSession session) {
      
      mv.addObject("alarmCntMap", ps.getAlarmCountList());
      mv.addObject("dDayMap",ps.getDDayMap());          //프젝id__dto(프젝id,d_day,prelaunching_day)
      mv.addObject("memberMap",ps.getMemberInfoList());  //멤버 정보들(닉네임 빼낼라고)
      mv.addObject("likeList",ps.likeProjectList(session,paramDto));
      mv.addObject("alarmList",ps.alarmProjectList(session,paramDto));//좋아하는 게시글/ 혹은 알람신청한 게시글
      mv.addObject("firstList", ps.getParamProjectList(paramDto)); //게시글 목록
      mv.addObject("countProject",ps.getProjectsCnt(paramDto));
      mv.addObject("countAllProject", ps.getAllProjectsCnt());
      mv.addObject("countDonated",ps.getDonatedCntMap());
      
      
      mv.setViewName("project/project_list");

      
      return mv;
   }
   

   //비동기로 값 끌어오기 로직
   @GetMapping(value = "/getData", produces = "application/json;charset=utf-8")
   public String getProjectList(ProjectParamDTO paramDto, HttpSession session) {
      System.out.println("비동기con");
      
      //서비스딴에서 위에서 얻어온것들 다 jsonList안에 넣어준다. ㄷㅅㄷ
      String list = ps.syncGetData(paramDto,session);

      
      return list;
   }
   
   /*
    맵, 밸류 형태로 프로젝트 정보 넘기려면..?
    list<map<프로젝트id,프로젝트info dto>> = new ArrayList<>(); 일케하면 될거같다..??
    ArrayList<map> 해서
    [{project_id : ""} ,
    */
   
   //프로젝트 좋아요 비동기
   //post의 값을 보낼땐 text로 매핑을 해줘야한다ㅜㅜ 겨우풀엇다
   @PostMapping(value="/like", produces="application/text;charset=utf-8")
   public String likeProject(Member_likeDTO likeDto) {   
      String msg = ps.chkLike(likeDto);
      
      
      return msg;
   }
   
   
   //프로젝트 알림
   @PostMapping(value="/alarm", produces="application/text;charset=utf-8" )
   public String chkAlarm(Member_alarmDTO alarmDto) {
      System.out.println("알림신청 들어옴");
      String msg = ps.chkAlarm(alarmDto);
      
      return msg;
      
   }
   
   
   /////////게시글 상세보기////////////////////////
   @GetMapping(value = "/{project_id}")
   public ModelAndView getAProjectDetail(@PathVariable int project_id, 
         ModelAndView mv, ProjectParamDTO paramDto, HttpSession session) {
      String path = "project/project_content/story";
      
      
      //프로젝트 전체 값을 준다음에, 상세보기 페이지에서 받는다.
      //근데 이거...프리런칭인지/아닌지 구분해줘야 됨 =>이거 뷰에서 해버려

      ProjectInfoDTO prjDto=ps.getAProjectDetail(project_id); //프로젝트 상세정보
      MemberDTO memberDto = ps.getAMemberDetail(prjDto.getMember_email()); //프로젝트 발행 멤버
      

      mv.addObject("likeList",ps.likeProjectList(session,paramDto));
      mv.addObject("alarmList",ps.alarmProjectList(session,paramDto));
      mv.addObject("alarmMemberCnt", ps.getAlarmMemCount(project_id)); //알림 몇명 신청?
      mv.addObject("dDayInfo", ps.getADDay(project_id) ); //며칠 남았는지 
      mv.addObject("donatedMemberCnt", ps.getDonatedMemCount(project_id)); //후원자 몇명인지
      mv.addObject("memberInfo", memberDto); //프젝 진행하는 멤버의 정보(프로필정보)
      mv.addObject("projectInfo", prjDto); //프젝 상세정보
      mv.addObject("projectGift", ps.getAProjectGift(project_id));//프젝 기프트 목록 가져오기
      //이런 프로젝트 어떠세요. prj와 같은 태그의 4개 뽑기...
      mv.addObject("morePrjList", ps.getMoreProject(project_id, session));
      mv.addObject("giftIdList", ps.getAProjectGiftId(project_id));
      
      
      
      mv.setViewName(path);

      
      
      return mv;
   }
   
   //프로젝트 커뮤니티
   @GetMapping(value = "/{project_id}/community")
   public ModelAndView getAProjectLive(@PathVariable int project_id, ModelAndView mv, HttpSession session, ProjectParamDTO paramDto) {
      

      ProjectInfoDTO prjDto=ps.getAProjectDetail(project_id); //프로젝트 상세정보
      MemberDTO memberDto = ps.getAMemberDetail(prjDto.getMember_email()); //프로젝트 발행 멤버
      

      //email과 name 키
      
      
      
      mv.addObject("likeList",ps.likeProjectList(session,paramDto));
      mv.addObject("alarmList",ps.alarmProjectList(session,paramDto));
      mv.addObject("alarmMemberCnt", ps.getAlarmMemCount(project_id)); //알림 몇명 신청?
      mv.addObject("dDayInfo", ps.getADDay(project_id) ); //며칠 남았는지 
      mv.addObject("donatedMemberCnt", ps.getDonatedMemCount(project_id)); //후원자 몇명인지
      mv.addObject("memberInfo", memberDto); //프젝 진행하는 멤버의 정보(프로필정보)
      mv.addObject("projectInfo", prjDto); //프젝 상세정보
      mv.addObject("projectGift", ps.getAProjectGift(project_id));//프젝 기프트 목록 가져오기
      //이런 프로젝트 어떠세요. prj와 같은 태그의 4개 뽑기...
      mv.addObject("morePrjList", ps.getMoreProject(project_id, session));
      
      //해당 프젝의 게시글 목록 불러옴.
      mv.addObject("boardList", pcs.getBoardList(project_id));//게시판 리스트
      
      //후원자들
      mv.addObject("donatedMemList",ps.getDonatedMemberList(project_id));

      //해당 프젝 라이브 꺼내와야함.
      mv.setViewName("project/project_content/community");
      
      
      
      
      
      return mv;
   }
   
   
   //notice 탭
   @GetMapping(value = "/{project_id}/notice")
   public ModelAndView getAProjectNotice(@PathVariable int project_id, HttpSession session, ModelAndView mv, ProjectParamDTO paramDto) {
      ProjectInfoDTO prjDto=ps.getAProjectDetail(project_id); //프로젝트 상세정보
      MemberDTO memberDto = ps.getAMemberDetail(prjDto.getMember_email()); //프로젝트 발행 멤버
      


      mv.addObject("likeList",ps.likeProjectList(session,paramDto));
      mv.addObject("alarmList",ps.alarmProjectList(session,paramDto));
      mv.addObject("alarmMemberCnt", ps.getAlarmMemCount(project_id)); //알림 몇명 신청?
      mv.addObject("dDayInfo", ps.getADDay(project_id) ); //며칠 남았는지 
      mv.addObject("donatedMemberCnt", ps.getDonatedMemCount(project_id)); //후원자 몇명인지
      mv.addObject("memberInfo", memberDto); //프젝 진행하는 멤버의 정보(프로필정보)
      mv.addObject("projectInfo", prjDto); //프젝 상세정보
      mv.addObject("projectGift", ps.getAProjectGift(project_id));//프젝 기프트 목록 가져오기
      //이런 프로젝트 어떠세요. prj와 같은 태그의 4개 뽑기...
      mv.addObject("morePrjList", ps.getMoreProject(project_id, session));
      
      //그냥 펀딩 주의사항이요
      mv.setViewName("project/project_content/notice");
      return mv;
   }
   
   
   
   //창작자에게 문의하기
   @PostMapping("/sendMessage")
   public ModelAndView sendMessage( ModelAndView mv, Member_messageDTO msgDto, 
         @RequestParam("project_id") String project_id) {
      System.out.println("메시지 넣으러 옴");
      System.out.println(msgDto.getMember_email());
      System.out.println(msgDto.getMessage_content());
      ps.sendMessage(msgDto);
      
      //String redirect = "/"+project_id+"/community";
      mv.setViewName("redirect:"+project_id);
   
      return mv;
   }
   
   
   
   
   
   //////////////////////////////////////커뮤니티 사진뽑아오기///////////////////////////////////////////////////


   @RequestMapping("/{project_id}/download")
      public void getBoarddownload(@RequestParam("imageFileName") String imageFileName,
                             HttpServletResponse response, HttpSession session, 
                             @PathVariable String project_id, @RequestParam("bno") String bno)throws Exception {
         //System.out.println("다운로드 실행 됩니까???");

         String path = IMAGE_PATH+"\\"+project_id+"\\"+bno; //폴더 경로
         File Folder = new File(path);

         // 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
         if (!Folder.exists()) {
            try{
                Folder.mkdir(); //폴더 생성합니다.
                 } 
                 catch(Exception e){
                e.getStackTrace();
            }        
         }
         OutputStream out = response.getOutputStream();
         String downFile = IMAGE_REPO +"\\"+project_id+"\\"+bno+"\\"+ imageFileName;
         File file = new File(downFile);
         //Content-disposition :파일 다운로드를 처리하는 HTTP헤더 중 하나다
         //Content-disposition : attachment : attachment는 파일을 다운로드하여 브라우저로 표현 하는 의미다
         //fileName는 파일을 다운로드할때의 이름을 지정해 준다.
         response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);
         FileInputStream in = new FileInputStream(file);
         byte[] buffer = new byte[1024 * 8];
         while (true) {//브라우저로 전송
            int count = in.read(buffer);  
            if (count == -1) 
               break;
            out.write(buffer, 0, count);
         }
         in.close(); out.close();
      }
   
   ////////////////////////////////////////////////////////////////////////////////
   
   

   
   
   

   
   //비동기 게시글 가져오기
   @GetMapping(value="/board", produces = "application/json;charset=utf-8")
   public String getBoard(@RequestParam int project_id, @RequestParam int page) {

      String list = pcs.getNoSyncBoardList(project_id,page); 
      return list;
      
   }
   
   
   
   @GetMapping(value="/reply", produces = "application/json;charset=utf-8")
   public String getReply(ProjectReplyDTO reDto) {

      
      return pcs.getReply(reDto);
      
   }
   
   @PostMapping(value="/reply", produces = "application/text;charset=utf-8")
   public String writeReply(ModelAndView mv, ProjectReplyDTO reDto) {
      System.out.println("댓글 저장 컨트롤러");
   
      String reply = pcs.writeReply(reDto);


      return reply;
      
      
   }
   

   @PostMapping("/deleteReply")
   public String deleteReply (ProjectReplyDTO reDto ) {
      
      System.out.println("댓글삭제");
      pcs.deleteReply(reDto);
      String reply= pcs.deleteReply(reDto);
      
      return reply;
   }
   
   
   public void up() {
      ProjectInfoDTO dto = new ProjectInfoDTO();
      int cnt=1;
      dto.setMember_email("crk333@naver.com");
      dto.setMember_name("dwdw");
      dto.setProject_check(2);
      dto.setProject_main_category("game");
      int id=110;      
      for(int i=0;i<10;i++) {
         dto.setProject_title("더미프로젝트"+cnt);
         dto.setProject_summary("더미프로젝트 요약"+cnt);
         dto.setProject_sub_category("mobile-game");
         for(int j=1;j<11;j++) {
            id++;
            dto.setProject_id(id);
            
            
            cnt++;
            
         }
         
      }
   }

   

   

}