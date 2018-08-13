package DH.controller;

import DH.entity.User;
import DH.entity.Vote;
import DH.entity.VoteLog;
import DH.entity.VoteOption;
import DH.service.VoteLogService;
import DH.service.VoteOptionService;
import DH.service.VoteService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Description: 投票界面
 * @Author: daihong
 * @Date: 2018-7-30
 */
@Controller
@RequestMapping("voting")
public class VotingController {

    @Autowired
    private VoteService voteService;

    @Autowired
    private VoteOptionService voteOptionService;

    @Autowired
    private VoteLogService voteLogService;


    /**
     * 进入可以投票界面
     *
     * @param map 保存一些投票界面用的数据
     * @return 返回投票界面
     */
    @RequestMapping("/vote")
    public String voting(Map<String, Object> map,@RequestParam(value = "tag",defaultValue = "1")String tag,HttpSession session) {
        if(tag.equals("exit")){
            session.removeAttribute("user");
        }
        List<Vote> votes1 = voteService.voteList();
        for (int i = 0; i < votes1.size(); i++) {
            Vote vote = votes1.get(i);
            int i1 = voteLogService.addVoteSum(vote.getVoteId());
            vote.setVoteTurnout(i1);
            voteService.updateSum(vote);
            List<VoteOption> voteOptions = voteOptionService.voteOptions(vote.getVoteId().toString());
            for (int j = 0; j < voteOptions.size(); j++) {
                VoteOption voteOption = voteOptions.get(j);
                int i2 = voteLogService.addVoteOptionSum(voteOption.getOptionId());
                voteOptionService.voteOptionSum(voteOption.getOptionId(), i2);
            }
        }
        Calendar c = Calendar.getInstance();
        Date date1 = new Date();
        c.setTime(date1);
        date1 = c.getTime();
        java.sql.Date voteTime = new java.sql.Date(date1.getTime());
        voteService.updateVoteTime(voteTime);
        List<Vote> votes = voteService.votes(1, 3);
        PageInfo<Vote> info = new PageInfo<>(votes);
        System.out.println(info.toString());
        map.put("info", info);
        System.out.println(info);
        List<Vote> voteList = new ArrayList<>();
        List<String> dateString = new LinkedList<>();
        for (int i = 0; i < votes.size(); i++) {
            Vote vote = votes.get(i);
            Date date = vote.getEndTime();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            dateString.add(simpleDateFormat.format(date));
            voteList.add(vote);
        }
        map.put("dateString", dateString);
        map.put("voteList", voteList);
        return "voting";
    }

    /**
     * 获取翻页时的json数据
     *
     * @param pageIndex 获取是否翻页的数据
     * @return 返回json数据
     */
    @ResponseBody
    @RequestMapping(value = "/vote1", method = RequestMethod.GET)
    public PageInfo<Vote> voteLists(@RequestParam(value = "pageIndex", defaultValue = "1") String pageIndex) {
        List<Vote> voteList = voteService.votes(Integer.parseInt(pageIndex), 3);
        PageInfo<Vote> pageInfo = new PageInfo<>(voteList);
        System.out.println(pageInfo.toString());
        List<Vote> votes = new ArrayList<>();
        for (Vote vote : voteList) {
            System.out.println(vote);
            votes.add(vote);
        }
        PageInfo<Vote> page = new PageInfo<>(votes);
        page.setPages(pageInfo.getPages());
        page.setPageNum(pageInfo.getPageNum());
        System.out.println(page.toString());
        return page;
    }


    /**
     * 显示具体投票的内容
     *
     * @param voteId 投票id
     * @param map    保存页面所需的内容
     * @return 返回具体投票页面
     */
    @RequestMapping("/voteOption")
    public String voteOptions(String voteId, Map<String, Object> map, HttpServletRequest request, HttpSession session,String auto) {
        User user = (User) request.getSession().getAttribute("user");
        Vote vote = voteService.selectVoteName(Integer.parseInt(voteId));
        List<VoteOption> voteOptions = voteOptionService.voteOptions(voteId);
        map.put("vote", vote);
        List<VoteLog> voteLogs = voteLogService.voteLogList(vote, user);
        if (vote.getVoteChange() == 0) {
            if (voteLogs.size() == 0) {
                map.put("voteLogList", 0);
            } else {
                Integer voteLog = voteLogs.get(0).getVoteOption().getOptionId();
                map.put("voteLogList", voteLog);
                map.put("voted", 1);
            }
        } else if (vote.getVoteChange() == 1) {
            List<Integer> voteLogList = new ArrayList<>();
            for (VoteLog voteLog : voteLogs) {
                voteLogList.add(voteLog.getVoteOption().getOptionId());
                map.put("voted", 1);
            }
            if (voteLogs.size() != 0) {
                List<VoteOption> voteOptions1 = voteOptionService.voteNoOptions(vote.getVoteId(), voteLogList);
                map.put("voteLogLists1", voteOptions1);
            }
            map.put("voteLogLists", voteLogList);
        }
        map.put("auto",auto);
        Date date = vote.getEndTime();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        map.put("voteTime", simpleDateFormat.format(date));
        map.put("voteOptions", voteOptions);
        session.removeAttribute("vote");
        session.removeAttribute("voteLogList");
        session.removeAttribute("voted");
        session.removeAttribute("voteLogLists1");
        session.removeAttribute("voteLogLists");
        session.removeAttribute("voteTime");
        session.removeAttribute("voteOptions");
        session.removeAttribute("auto");
        return "votingPage";

    }

    /**
     * 点击投票是否成功
     * @param optionId 获取投票id
     * @param request
     * @param session
     * @param vote
     * @return 返回投票页面
     */
    @RequestMapping(value = "/voteStart", method = RequestMethod.POST)
    public String voteStart( String[] optionId, HttpServletRequest request, HttpSession session, @Valid Vote vote,String auto) {
        User user = (User) request.getSession().getAttribute("user");
        List<VoteLog> voteLogList = new ArrayList<>();
        for (String option : optionId) {
            VoteLog voteLog = new VoteLog();
            voteLog.setUser(user);
            voteLog.setVote(vote);
            Calendar c = Calendar.getInstance();
            Date date = new Date();
            c.setTime(date);
            date = c.getTime();
            java.sql.Date time = new java.sql.Date(date.getTime());
            voteLog.setLogDate(time);
            VoteOption voteOption = new VoteOption();
            voteOption.setOptionId(Integer.parseInt(option));
            voteLog.setVoteOption(voteOption);
            voteLogList.add(voteLog);
        }
        voteLogService.insertLog(voteLogList);
        voteLogService.addVoteSum(vote.getVoteId());
        voteService.updateSum(vote);
        for (VoteLog votelog : voteLogList) {
            int i = voteLogService.addVoteOptionSum(votelog.getVoteOption().getOptionId());
            voteOptionService.voteOptionSum(vote.getVoteId(), i);
        }

        Vote vote1 = voteService.selectVoteName(vote.getVoteId());
        session.setAttribute("vote", vote1);


        if (vote1.getVoteChange() == 0) {
            Integer voteLog = voteLogList.get(0).getVoteOption().getOptionId();
            session.setAttribute("voteLogList", voteLog);
            session.setAttribute("voted", 1);
        } else if (vote1.getVoteChange() == 1) {
            List<Integer> voteLogList1 = new ArrayList<>();
            for (VoteLog voteLog : voteLogList) {
                voteLogList1.add(voteLog.getVoteOption().getOptionId());
                session.setAttribute("voted", 1);
            }
            List<VoteOption> voteOptions1 = voteOptionService.voteNoOptions(vote.getVoteId(), voteLogList1);
            session.setAttribute("voteLogLists1", voteOptions1);
            session.setAttribute("voteLogLists", voteLogList1);
        }
        Date date = vote1.getEndTime();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        session.setAttribute("voteTime", simpleDateFormat.format(date));
        List<VoteOption> voteOptions = voteOptionService.voteOptions(vote1.getVoteId().toString());
        session.setAttribute("voteOptions", voteOptions);
        session.setAttribute("auto",auto);
        return "forward:vote";
    }


    /**
     * 初始化投票界面
     *
     * @return 返回投票界面
     */
    @RequestMapping(value = "/voteStart", method = RequestMethod.GET)
    public String voteStart() {

        return "votingPage";
    }
}
