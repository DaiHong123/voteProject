package DH.entity;

/**
 * @Description: 投票类型
 * @Author: daihong
 * @Date: 2018/7/26
 */
public class VoteType {
    private Integer typeId;
    private String typeName;

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    @Override
    public String
    toString() {
        return "VoteType{" +
                "typeId=" + typeId +
                ", typeName='" + typeName + '\'' +
                '}';
    }
}
