public Integer getMinElement(List myList){
  if(myList.size()>=0){
    return ListManager.getFirst(myList);
  }
  return 0;
}
