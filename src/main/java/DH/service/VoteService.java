package DH.service;

import DH.dao.VoteDao;
import DH.entity.Vote;
import com.github.pagehelper.PageHelper;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Date;
import java.util.List;

/**
 * @Description: 创建投票
 * @Author: daihong
 * @Date: 2018/7/27
 */
@Service
public class VoteService{


    @Resource
    private VoteDao voteDao;

    /**
     * 判断是否能创建
     * @param vote 得到参数vote对象
     * @return 是否能够创建可以返回true，否则返回false
     */
    public Boolean voteAdd(Vote vote){
        return voteDao.AddVote(vote);
    }

    /**
     * 查询是否需要多选
     * @param voteId 通过id查
     * @param voteChange 用voteChange改变
     * @return 如果改变返回true，否则false
     */
    public Boolean voteChange(Integer voteId,Integer voteChange){
        return voteDao.voteChange(voteId,voteChange);
    }

    /**
     * 进行分页
     * @param pageNum 得到分页数字
     * @param pageSize 得到页面大小
     * @return 返回vote对象list集合
     */
    public List<Vote> votes(Integer pageNum,Integer pageSize){
        PageHelper.startPage(pageNum,pageSize);
        return voteDao.votes();
    }
    /**
     * 通过id查改投票
     * @param voteId 通过id查
     * @return 如果有返回vote对象，否则返回null
     */
    public Vote selectVoteName(Integer voteId){
        return voteDao.selectVoteName(voteId);
    }
    /**
     * 查询是否需要更新状态
     * @param voteTime 通过时间比较
     * @return 如果改变返回true，否则返回false
     */
    public Boolean updateVoteTime(Date voteTime){
        return voteDao.updateTime(voteTime);
    }


    /**
     * 返回投票的所有记录
     * @return
     */
    public List<Vote> voteList(){
        return voteDao.votes();
    }


    /**
     * 更新投票记录总数
     * @param vote
     * @return
     */
    public Boolean updateSum(Vote vote){
        return voteDao.updateSum(vote);
    }
}