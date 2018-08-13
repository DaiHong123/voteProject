package DH.service;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import DH.entity.VoteType;
import DH.dao.VoteTypeDao;
@Service
public class VoteTypeService{
    @Resource
    private VoteTypeDao voteTypeDao;

    /**
     * 查询所有投票类型
     * @return 所有投票类型的list集合
     */
    public List<VoteType> selectVoteTypes(){
        return voteTypeDao.selectVoteTypes();
    }
}