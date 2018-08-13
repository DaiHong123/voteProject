package DH.service;

import DH.entity.Vote;
import DH.entity.VoteOption;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import DH.dao.VoteOptionDao;

import java.util.List;

@Service
public class VoteOptionService {

    @Resource
    private VoteOptionDao voteOptionDao;

    /**
     * 添加投票项
     *
     * @param voteOptions 通过改参数来添加
     * @return 添加成功返回true，否则false
     */
    public Boolean VoteOptions(List<VoteOption> voteOptions) {
        return voteOptionDao.AddOptions(voteOptions);
    }

    /**
     * 通过id查所有的投票项
     * @param voteId 通过id查
     * @return 返回投票项list集合
     */
    public List<VoteOption> voteOptions(String voteId) {
        return voteOptionDao.voteOptions(voteId);
    }

    /**
     * 返回没有投票的id
     * @param voteId
     * @param voteLogList
     * @return
     */
    public List<VoteOption> voteNoOptions(Integer voteId,List<Integer>voteLogList){
        return voteOptionDao.voteNoOptions(voteId,voteLogList);
    }


    /**
     * 更新投票id的总数
     * @param optionId
     * @param optionNumber
     * @return
     */
    public Boolean voteOptionSum(Integer optionId,Integer optionNumber){
        return voteOptionDao.voteOptionSum(optionId,optionNumber);
    }
}
