package com.work.pojo;


public class QueryVo {
		//当前页
		private Integer page;
		//每页数
		private Integer size = 8; 
		//开始行
		private Integer startRow = 0;
		public Integer getPage() {
			return page;
		}
		public void setPage(Integer page){
			this.page = page;
		}
		public Integer getSize() {
			return size;
		}
		public void setSize(Integer size) {
			this.size = size;
		}
		public Integer getStartRow() {
			return startRow;
		}
		public void setStartRow(Integer startRow) {
			this.startRow = startRow;
		}
		
}
