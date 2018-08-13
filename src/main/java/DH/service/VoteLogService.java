package DH.service;

import DH.dao.VoteLogDao;
import DH.entity.User;
import DH.entity.Vote;
import DH.entity.VoteLog;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: daihong
 * @Date: 2018/7/31
 */
@Service
public class VoteLogService {
    @Resource
    private VoteLogDao voteLogDao;

    /**
     * 
     * @param vote
     * @param user
     * @return
     */
    public List<VoteLog> voteLogList(Vote vote,User user) {
        return  voteLogDao.voteLog(vote,user);
    }


    /**
     * 插入投票记录
     * @param voteLogs
     * @return
     */
    public Boolean insertLog(List<VoteLog> voteLogs){
        return voteLogDao.insertLog(voteLogs);
    }

    /**
     * 计算投票总数
     * @param voteId
     * @return
     */
    public int addVoteSum(Integer voteId){
        return voteLogDao.addVoteSum(voteId);
    }


    /**
     *计算投票id的总数
     * @param optionId
     * @return
     */
    public int addVoteOptionSum(Integer optionId){
        return voteLogDao.addVoteOptionSum(optionId);
    }
}
