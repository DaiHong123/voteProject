package DH.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import DH.entity.VoteType;

@Mapper
public interface VoteTypeDao {

    /**
     * 查询所有投票类型
     * @return 返回投票类型list集合
     */
    List<VoteType> selectVoteTypes();
}
