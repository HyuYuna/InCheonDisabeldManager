package kr.co.grit.bas.vo;

public class BasDisabiltyPreSaveVO {
	private String yyyymm;
	private String guNm;
	private String disableTp;
	private String maleSeriousCnt;
	private String maleModerateCnt;
	private String femaleSeriousCnt;
	private String femaleModerateCnt;
	
	public String getYyyymm() {
		return yyyymm;
	}
	public void setYyyymm(String yyyymm) {
		this.yyyymm = yyyymm;
	}
	public String getGuNm() {
		return guNm;
	}
	public void setGuNm(String guNm) {
		this.guNm = guNm;
	}
	public String getDisableTp() {
		return disableTp;
	}
	public void setDisableTp(String disableTp) {
		this.disableTp = disableTp;
	}
	public String getMaleSeriousCnt() {
		return maleSeriousCnt;
	}
	public void setMaleSeriousCnt(String maleSeriousCnt) {
		this.maleSeriousCnt = maleSeriousCnt;
	}
	public String getMaleModerateCnt() {
		return maleModerateCnt;
	}
	public void setMaleModerateCnt(String maleModerateCnt) {
		this.maleModerateCnt = maleModerateCnt;
	}
	public String getFemaleSeriousCnt() {
		return femaleSeriousCnt;
	}
	public void setFemaleSeriousCnt(String femaleSeriousCnt) {
		this.femaleSeriousCnt = femaleSeriousCnt;
	}
	public String getFemaleModerateCnt() {
		return femaleModerateCnt;
	}
	public void setFemaleModerateCnt(String femaleModerateCnt) {
		this.femaleModerateCnt = femaleModerateCnt;
	}
	@Override
	public String toString() {
		return "BasDisabiltyPreSaveVO [yyyymm=" + yyyymm + ", guNm=" + guNm
				+ ", disableTp=" + disableTp + ", maleSeriousCnt="
				+ maleSeriousCnt + ", maleModerateCnt=" + maleModerateCnt
				+ ", femaleSeriousCnt=" + femaleSeriousCnt
				+ ", femaleModerateCnt=" + femaleModerateCnt + "]";
	}
	
}

