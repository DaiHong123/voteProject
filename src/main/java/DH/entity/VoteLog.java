package DH.entity;

import java.util.Date;

/**
 * @Description: 投票日志
 * @Author: daihong
 * @Date: 2018/7/31
 */
public class VoteLog {
    private Vote vote;
    private VoteOption voteOption;
    private User user;
    private Date logDate;

    public Vote getVote() {
        return vote;
    }

    public void setVote(Vote vote) {
        this.vote = vote;
    }

    public VoteOption getVoteOption() {
        return voteOption;
    }

    public void setVoteOption(VoteOption voteOption) {
        this.voteOption = voteOption;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getLogDate() {
        return logDate;
    }

    public void setLogDate(Date logDate) {
        this.logDate = logDate;
    }

    @Override
    public String toString() {
        return "VoteLog{" +
                "vote=" + vote +
                ", voteOption=" + voteOption +
                ", user=" + user +
                ", logDate=" + logDate +
                '}';
    }
}
