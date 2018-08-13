package DH.dao;

import DH.entity.User;
import DH.entity.Vote;
import DH.entity.VoteLog;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Description: 投票记录
 * @Author: daihong
 * @Date: 2018/7/31
 */
@Mapper
public interface VoteLogDao {

    /**
     *查询投票记录
     * @param vote
     * @param user
     * @return 根据vote和user返回voteLog集合
     */
    List<VoteLog> voteLog( @Param("vote")Vote vote,@Param("user")User user);

    /**
     * 插入投票记录
     * @param voteLogs
     * @return
     */
    Boolean insertLog(List<VoteLog> voteLogs);

    /**
     * 计算投票总数
     * @param voteId
     * @return
     */
    int addVoteSum(@Param("voteId")Integer voteId);

    /**
     * 计算投票id的总数
     * @param optionId
     * @return
     */
    int addVoteOptionSum(@Param("optionId")Integer optionId);
}

