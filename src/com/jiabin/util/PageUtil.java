package com.jiabin.util;

/**
 * ��ҳ������
 * @bieming Administrator
 *
 */
public class PageUtil {

	/**
	 * ��ȡ��ҳ����
	 * @param targetUrl Ŀ���ַ
	 * @param totalNum �ܼ�¼��
	 * @param currentPage ��ǰҳ
	 * @param pageSize ÿҳ��С
	 * @return
	 */
	public static String getPagation(String targetUrl,long totalNum,int currentPage,int pageSize){
		long totalPage=totalNum%pageSize==0?totalNum/pageSize:totalNum/pageSize+1;
		if(totalPage==0){
			return "<font color=red>δ��ѯ�����ݣ�</font>";
		}
		StringBuffer pageCode=new StringBuffer();
		pageCode.append("<li><a href='"+targetUrl+"?page=1'>��ҳ</a></li>");
		if(currentPage==1){
			pageCode.append("<li class='disabled'><a href='#'>��һҳ</a></li>");
		}else{
			pageCode.append("<li><a href='"+targetUrl+"?page="+(currentPage-1)+"'>��һҳ</a></li>");
		}
		
		for(int i=currentPage-2;i<=currentPage+2;i++){
			if(i<1 || i>totalPage){
				continue;
			}
			if(i==currentPage){
				pageCode.append("<li class='active'><a href='#'>"+i+"<span class='sr-only'>(current)</span></a></li>");
			}else{
				pageCode.append("<li><a href='"+targetUrl+"?page="+i+"'>"+i+"</a></li>");
			}
			
		}
		
		if(currentPage==totalPage){
			pageCode.append("<li class='disabled'><a href='#'>��һҳ</a></li>");
		}else{
			pageCode.append("<li><a href='"+targetUrl+"?page="+(currentPage+1)+"'>��һҳ</a></li>");
		}
		pageCode.append("<li><a href='"+targetUrl+"?page="+totalPage+"'>βҳ</a></li>");
		return pageCode.toString();
	}
	
	/**
	 * ���ɷ�ҳ����
	 * @param targetUrl Ŀ���ַ
	 * @param totalNum �ܼ�¼��
	 * @param currentPage ��ǰҳ
	 * @param pageSize ÿҳ��С
	 * @return
	 */
	public static String genPagination(String targetUrl,long totalNum,int currentPage,int pageSize,String param){
		long totalPage=totalNum%pageSize==0?totalNum/pageSize:totalNum/pageSize+1;
		if(totalPage==0){
			return "δ��ѯ������";
		}else{
			StringBuffer pageCode=new StringBuffer();
			pageCode.append("<li><a href='"+targetUrl+"?page=1&"+param+"'>��ҳ</a></li>");
			if(currentPage>1){
				pageCode.append("<li><a href='"+targetUrl+"?page="+(currentPage-1)+"&"+param+"'>��һҳ</a></li>");			
			}
			for(int i=currentPage-2;i<=currentPage+2;i++){
				if(i<1||i>totalPage){
					continue;
				}
				if(i==currentPage){
					pageCode.append("<li class='active'><a href='#'>"+i+"<span class='sr-only'></span></a></li>");		
				}else{
					pageCode.append("<li><a href='"+targetUrl+"?page="+i+"&"+param+"'>"+i+"</a></li>");	
				}
			}
			if(currentPage<totalPage){
				pageCode.append("<li><a href='"+targetUrl+"?page="+(currentPage+1)+"&"+param+"'>��һҳ</a></li>");		
			}
			pageCode.append("<li><a href='"+targetUrl+"?page="+totalPage+"&"+param+"'>βҳ</a></li>");
			return pageCode.toString();
		}
	}
	
	public static String genPagination(String targetUrl,String page,long totalNum,int currentPage,int pageSize,String param){
		long totalPage=totalNum%pageSize==0?totalNum/pageSize:totalNum/pageSize+1;
		if(totalPage==0){
			return "δ��ѯ������";
		}else{
			StringBuffer pageCode=new StringBuffer();
			pageCode.append("<li><a href='"+targetUrl+"?"+page+"=1&"+param+"'>��ҳ</a></li>");
			if(currentPage>1){
				pageCode.append("<li><a href='"+targetUrl+"?"+page+"="+(currentPage-1)+"&"+param+"'>��һҳ</a></li>");			
			}
			for(int i=currentPage-2;i<=currentPage+2;i++){
				if(i<1||i>totalPage){
					continue;
				}
				if(i==currentPage){
					pageCode.append("<li class='active'><a href='#'>"+i+"<span class='sr-only'></span></a></li>");		
				}else{
					pageCode.append("<li><a href='"+targetUrl+"?"+page+"="+i+"&"+param+"'>"+i+"</a></li>");	
				}
			}
			if(currentPage<totalPage){
				pageCode.append("<li><a href='"+targetUrl+"?"+page+"="+(currentPage+1)+"&"+param+"'>��һҳ</a></li>");		
			}
			pageCode.append("<li><a href='"+targetUrl+"?"+page+"="+totalPage+"&"+param+"'>βҳ</a></li>");
			return pageCode.toString();
		}
	}
	
	public static String getPagation0(String targetUrl,long totalNum,int currentPage,int pageSize,String param){
		long totalPage=totalNum%pageSize==0?totalNum/pageSize:totalNum/pageSize+1;
		if(totalPage==0){
			return "δ��ѯ������";
		}else{
			StringBuffer pageCode=new StringBuffer();
			pageCode.append("<li><a href='"+targetUrl+"?page0=1&"+param+"'>��ҳ</a></li>");
			if(currentPage>1){
				pageCode.append("<li><a href='"+targetUrl+"?page0="+(currentPage-1)+"&"+param+"'>��һҳ</a></li>");			
			}
			for(int i=currentPage-2;i<=currentPage+2;i++){
				if(i<1||i>totalPage){
					continue;
				}
				if(i==currentPage){
					pageCode.append("<li class='active'><a href='#'>"+i+"<span class='sr-only'>(current)</span></a></li>");		
				}else{
					pageCode.append("<li><a href='"+targetUrl+"?page0="+i+"&"+param+"'>"+i+"</a></li>");	
				}
			}
			if(currentPage<totalPage){
				pageCode.append("<li><a href='"+targetUrl+"?page0="+(currentPage+1)+"&"+param+"'>��һҳ</a></li>");		
			}
			pageCode.append("<li><a href='"+targetUrl+"?page0="+totalPage+"&"+param+"'>βҳ</a></li>");
			return pageCode.toString();
		}
	}
	
	public static String getPagation1(String targetUrl,long totalNum,int currentPage,int pageSize,String param){
		long totalPage=totalNum%pageSize==0?totalNum/pageSize:totalNum/pageSize+1;
		if(totalPage==0){
			return "δ��ѯ������";
		}else{
			StringBuffer pageCode=new StringBuffer();
			pageCode.append("<li><a href='"+targetUrl+"?page1=1&"+param+"'>��ҳ</a></li>");
			if(currentPage>1){
				pageCode.append("<li><a href='"+targetUrl+"?page1="+(currentPage-1)+"&"+param+"'>��һҳ</a></li>");			
			}
			for(int i=currentPage-2;i<=currentPage+2;i++){
				if(i<1||i>totalPage){
					continue;
				}
				if(i==currentPage){
					pageCode.append("<li class='active'><a href='#'>"+i+"<span class='sr-only'>(current)</span></a></li>");		
				}else{
					pageCode.append("<li><a href='"+targetUrl+"?page1="+i+"&"+param+"'>"+i+"</a></li>");	
				}
			}
			if(currentPage<totalPage){
				pageCode.append("<li><a href='"+targetUrl+"?page1="+(currentPage+1)+"&"+param+"'>��һҳ</a></li>");		
			}
			pageCode.append("<li><a href='"+targetUrl+"?page1="+totalPage+"&"+param+"'>βҳ</a></li>");
			return pageCode.toString();
		}
	}
	
	public static String genPagination(String targetUrl,long totalNum,int currentPage,int pageSize,String param,String pageParaStr){
		long totalPage=totalNum%pageSize==0?totalNum/pageSize:totalNum/pageSize+1;
		if(totalPage==0){
			return "δ��ѯ������";
		}else{
			StringBuffer pageCode=new StringBuffer();
			pageCode.append("<li><a href='"+targetUrl+"?"+pageParaStr+"=1&"+param+"'>��ҳ</a></li>");
			if(currentPage>1){
				pageCode.append("<li><a href='"+targetUrl+"?"+pageParaStr+"="+(currentPage-1)+"&"+param+"'>��һҳ</a></li>");			
			}
			for(int i=currentPage-2;i<=currentPage+2;i++){
				if(i<1||i>totalPage){
					continue;
				}
				if(i==currentPage){
					pageCode.append("<li class='active'><a href='#'>"+i+"<span class='sr-only'></span></a></li>");		
				}else{
					pageCode.append("<li><a href='"+targetUrl+"?"+pageParaStr+"="+i+"&"+param+"'>"+i+"</a></li>");	
				}
			}
			if(currentPage<totalPage){
				pageCode.append("<li><a href='"+targetUrl+"?"+pageParaStr+"="+(currentPage+1)+"&"+param+"'>��һҳ</a></li>");		
			}
			pageCode.append("<li><a href='"+targetUrl+"?"+pageParaStr+"="+totalPage+"&"+param+"'>βҳ</a></li>");
			return pageCode.toString();
		}
	}
}
