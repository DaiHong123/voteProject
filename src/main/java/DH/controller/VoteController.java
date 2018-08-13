package DH.controller;

import DH.entity.Vote;
import DH.entity.VoteOption;
import DH.service.VoteOptionService;
import DH.service.VoteService;
import DH.service.VoteTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.*;

/**
 * 投票信息添加
 */
@Controller
@RequestMapping("vote")
public class VoteController {

    /**
     * 实例化一个VoteTypeService对象
     */
    @Autowired
    private VoteTypeService voteTypeService;

    /**
     * 实例化一个VoteService对象
     */
    @Autowired
    private VoteService voteService;



    @Autowired
    private VoteOptionService voteOptionService;


    /**
     * 创建投票首页
     * @return 返回投票首页页面名字
     */
    @RequestMapping(value = "/voteIndex", method = RequestMethod.GET)
    public String voteIndex() {
        return "vote_index";
    }


    /**
     * 创建投票
     * @param votetitle 获取投票题目
     * @param map 保存投票题目
     * @return 返回投票创建页名字
     */
    @RequestMapping(value = "/voteIndex", method = RequestMethod.POST)
    public String voteIndex(String votetitle, Map<String, Object> map) {
        map.put("votetitle", votetitle);
        map.put("voteTypes", voteTypeService.selectVoteTypes());
        return "vote_add";
    }

    /**
     * 创建投票
     * @param vote 自动注解成pojo对象
     * @param A 获取输入框名字
     * @param time 获取截至时间
     * @return 返回投票创建页名字
     */

    @RequestMapping(value = "/voteAdd", method = RequestMethod.POST)
    public String voteAdd(@Valid Vote vote, String[] A, String time) {
        Integer voteQuantity = A.length;
        vote.setVoteQuantity(voteQuantity);
        Calendar c = Calendar.getInstance();
        Date date = new Date();
        c.setTime(date);
        c.add(Calendar.DAY_OF_MONTH, +Integer.parseInt(time));
        date = c.getTime();
        java.sql.Date voteTime = new java.sql.Date(date.getTime());
        vote.setEndTime(voteTime);
        boolean votes = voteService.voteAdd(vote);
        if(votes){
            if(vote.getVoteChange()!=null){
                voteService.voteChange(vote.getVoteId(),vote.getVoteChange());
            }
            List<VoteOption> voteOptions = new ArrayList<>();
            for(int i=0; i<voteQuantity; i++){
                VoteOption voteOption = new VoteOption();
                voteOption.setOptionName(A[i]);
                voteOption.setVote(vote);
                voteOptions.add(voteOption);
            }
            voteOptionService.VoteOptions(voteOptions);
        }
        return "vote_index";
    }
}


