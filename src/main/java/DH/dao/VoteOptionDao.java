package DH.dao;

import DH.entity.Vote;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

import DH.entity.VoteOption;

@Mapper
public interface VoteOptionDao {
    /**
     * 添加投票项
     *
     * @param voteOptions 通过改参数来添加
     * @return 添加成功返回true，否则false
     */
    Boolean AddOptions(List<VoteOption> voteOptions);

    /**
     * 通过id查所有的投票项
     * @param voteId 通过id查
     * @return 返回投票项list集合
     */
    List<VoteOption> voteOptions(@Param("voteId") String voteId);


    /**
     * 返回没有投票的id的集合
     * @param voteId
     * @param voteLogList
     * @return
     */
    List<VoteOption> voteNoOptions(@Param("voteId")Integer voteId,@Param("voteLogList")List<Integer> voteLogList);


    /**
     * 更新投票id的总数
     * @param optionId
     * @param optionNumber
     * @return
     */
    Boolean voteOptionSum(@Param("optionId")Integer optionId,@Param("optionNumber")Integer optionNumber);
}
