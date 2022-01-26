package kr.co.grit.common.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class CommonGritCmmVO {

	private String ctrId = "";
	private String ctrIdName = "";
	private String ctrCode = "";
	private String ctrName = "";
	
	public CommonGritCmmVO() {
	}

	public String getCtrId() {
		return ctrId;
	}

	public void setCtrId(String ctrId) {
		this.ctrId = ctrId;
	}

	public String getCtrIdName() {
		return ctrIdName;
	}

	public void setCtrIdName(String ctrIdName) {
		this.ctrIdName = ctrIdName;
	}

	public String getCtrCode() {
		return ctrCode;
	}

	public void setCtrCode(String ctrCode) {
		this.ctrCode = ctrCode;
	}

	public String getCtrName() {
		return ctrName;
	}

	public void setCtrName(String ctrName) {
		this.ctrName = ctrName;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
