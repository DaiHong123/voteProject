package DH.entity;

/**
 * @Description: 投票项类
 * @Author: daihong
 * @Date: 2018/7/27
 */
public class VoteOption {
    private Integer optionId;
    private Vote vote;
    private String optionName;
    private Integer optionNumber;

    public Integer getOptionId() {
        return optionId;
    }

    public void setOptionId(Integer optionId) {
        this.optionId = optionId;
    }

    public Vote getVote() {
        return vote;
    }

    public void setVote(Vote vote) {
        this.vote = vote;
    }

    public String getOptionName() {
        return optionName;
    }

    public void setOptionName(String optionName) {
        this.optionName = optionName;
    }

    public Integer getOptionNumber() {
        return optionNumber;
    }

    public void setOptionNumber(Integer optionNumber) {
        this.optionNumber = optionNumber;
    }

    @Override
    public String toString() {
        return "VoteOption{" +
                "optionId=" + optionId +
                ", vote=" + vote +
                ", optionName='" + optionName + '\'' +
                ", optionNumber=" + optionNumber +
                '}';
    }
}
