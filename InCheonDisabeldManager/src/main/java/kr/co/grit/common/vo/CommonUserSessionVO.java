
package kr.co.grit.common.vo;

import kr.co.grit.common.vo.CommonUserInfoVO;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;


public class CommonUserSessionVO implements Serializable{

	private static final long serialVersionUID = 1L;

	private CommonUserInfoVO commonUserInfoVO = null;

	private String redirectURL = "";
	
	
	public CommonUserInfoVO getUserInfoVO() {
		return commonUserInfoVO;
	}

	
	public void setUserInfoVO(CommonUserInfoVO commonUserInfoVO) {
		this.commonUserInfoVO = commonUserInfoVO;
	}

	
	public String getRedirectURL() {
		return redirectURL;
	}
	public void setRedirectURL(String redirectURL) {
		this.redirectURL = redirectURL;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
