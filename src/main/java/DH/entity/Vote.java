package DH.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 投票基本信息
 * @Author: daihong
 * @Date: 2018/7/26
 */
public class Vote implements Serializable {
private Integer voteId;
private User user;
private VoteType voteType;
private String voteName;
private Integer voteQuantity;
private Integer voteTurnout;
private Date endTime;
private Integer voteChange;
private String description;
private Integer state;


    public Integer getVoteId() {
        return voteId;
    }

    public void setVoteId(Integer voteId) {
        this.voteId = voteId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public VoteType getVoteType() {
        return voteType;
    }

    public void setVoteType(VoteType voteType) {
        this.voteType = voteType;
    }

    public String getVoteName() {
        return voteName;
    }

    public void setVoteName(String voteName) {
        this.voteName = voteName;
    }

    public Integer getVoteQuantity() {
        return voteQuantity;
    }

    public void setVoteQuantity(Integer voteQuantity) {
        this.voteQuantity = voteQuantity;
    }

    public Integer getVoteTurnout() {
        return voteTurnout;
    }

    public void setVoteTurnout(Integer voteTurnout) {
        this.voteTurnout = voteTurnout;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Integer getVoteChange() {
        return voteChange;
    }

    public void setVoteChange(Integer voteChange) {
        this.voteChange = voteChange;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Vote{" +
                "voteId=" + voteId +
                ", user=" + user +
                ", voteType=" + voteType +
                ", voteName='" + voteName + '\'' +
                ", voteQuantity=" + voteQuantity +
                ", voteTurnout=" + voteTurnout +
                ", endTime=" + endTime +
                ", voteChange=" + voteChange +
                ", description='" + description + '\'' +
                ", state=" + state +
                '}';
    }
}
