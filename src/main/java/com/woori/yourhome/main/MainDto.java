package com.woori.yourhome.main;

 
import com.woori.yourhome.common.BaseDto;

//alt-shift-a 사각형 영역지정
public class MainDto extends BaseDto{
	
		private String seq="";
		private String userid="";
		private String username="";
		private String title="";
		private String contents="";
		private String filename1="";
		private String filename2="";
		private String filename3="";
		private String regdate="";
		private String moddate="";
		private String delyn="";
		private int group_id=0;
		private int depth=0;
		private int g_level=1;
		private String hit="";
		
		
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getSeq() {
			return seq;
		}
		public void setSeq(String seq) {
			this.seq = seq;
		}
		public String getUserid() {
			return userid;
		}
		public void setUserid(String userid) {
			this.userid = userid;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getContents() {
			return contents;
		}
		public void setContents(String contents) {
			this.contents = contents;
		}
		public String getFilename1() {
			return filename1;
		}
		public void setFilename1(String filename1) {
			this.filename1 = filename1;
		}
		public String getFilename2() {
			return filename2;
		}
		public void setFilename2(String filename2) {
			this.filename2 = filename2;
		}
		public String getFilename3() {
			return filename3;
		}
		public void setFilename3(String filename3) {
			this.filename3 = filename3;
		}
		public String getRegdate() {
			return regdate;
		}
		public void setRegdate(String regdate) {
			this.regdate = regdate;
		}
		public String getModdate() {
			return moddate;
		}
		public void setModdate(String moddate) {
			this.moddate = moddate;
		}
		public String getDelyn() {
			return delyn;
		}
		public void setDelyn(String delyn) {
			this.delyn = delyn;
		}
		public int getGroup_id() {
			return group_id;
		}
		public void setGroup_id(int group_id) {
			this.group_id = group_id;
		}
		public int getDepth() {
			return depth;
		}
		public void setDepth(int depth) {
			this.depth = depth;
		}
		public int getG_level() {
			return g_level;
		}
		public void setG_level(int g_level) {
			this.g_level = g_level;
		}
		public String getHit() {
			return hit;
		}
		public void setHit(String hit) {
			this.hit = hit;
		}
		
		

}
