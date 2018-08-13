package DH.dao;

import DH.entity.Vote;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;
import java.util.List;

/**
 * @Description: Vote操作
 * @Author: daihong
 * @Date: 2018/7/25
 */
public interface VoteDao {
    /**
     * 查询是否有该投票
     * @param vote 通过该参数查
     * @return 如果有返回true，否则false
     */
    Boolean AddVote(@Param("pojo")Vote vote);

    /**
     * 查询是否需要多选
     * @param voteId 通过id查
     * @param voteChange 用voteChange改变
     * @return 如果改变返回true，否则false
     */
    Boolean voteChange(@Param("voteId")Integer voteId,@Param("voteChange")Integer voteChange);

    /**
     * 查询所有的投票
     * @return 数据库中的所有投票
     */
    List<Vote> votes();

    /**
     * 通过id查改投票
     * @param voteId 通过id查
     * @return 如果有返回vote对象，否则返回null
     */
    Vote selectVoteName(@Param("voteId")Integer voteId);

    /**
     * 查询是否需要更新状态
     * @param voteTime 通过时间比较
     * @return 如果改变返回true，否则返回false
     */
    Boolean updateTime(@Param("voteTime")Date voteTime);

    /**
     * 更新投票的数量
     * @param vote
     * @return 更新成功返回true，否则返回false
     */
    Boolean updateSum(Vote vote);


}
