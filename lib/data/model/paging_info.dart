class PagingInfo {
  int pageNum = 0;
  int pageSize = 20;
  int offset = 0;

  PagingInfo(this.offset);

  resetPageNum() {
    pageNum = offset;
  }

  addPageNum() {
    pageNum += 1;
  }


  bool isFirstPage() {
    return pageNum == offset;
  }
}
