<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/meta.jsp"%>
<link rel="stylesheet" href="${cdnServer}/static/weipaidai/css/page/index.css?v=${version}" />
<script type="text/javascript">
	var OP_CONFIG = {"page":"page/index"};
</script>
<%@ include file="../common/header.jsp"%>
    <div id="content">
		<!-- 首页轮播 -->
	    <div class="flexslider">    	   
	        <ul class="slides">
	       		<c:forEach var="items" items="${scrollpic.lists}">
	                <li style="background: transparent url(${cdnServer}${items.pic}) 50% 0 no-repeat;">
						<c:if test="${items.islink == '1'}">
	              			<a href="${items.url}"  rel="nofollow" target="_blank"></a>
	              		</c:if>
	                </li>
	        	</c:forEach> 
	        </ul>
	       	<div class="bannercontent clearfix">
	         	<div class="contentleft fl">
	              <!-- 产品专区 -->
	              <ul class="cleft_ul">	                      
	                  <li class="cleft_li">
	                  	<a href="/invest/scattered" class="cleft_a">
	                      	<p class="cleft_lims1">散标专区111</p>
	                      	<p class="cleft_lims2">优选标的,选择灵活</p>
	                     </a>
	                  </li>             	                      
	                  <li class="cleft_li">
	                  	<a href="javascript:void(0);" class="cleft_a">
	                      	<p class="cleft_lims1">转让专区222</p>
	                      	<p class="cleft_lims2">暂未开放,敬请期待</p>
	                     </a>
	                  </li>
	                  <li class="cleft_li">
	                  	<a href="javascript:void(0);" class="cleft_a">
	                      	<p class="cleft_lims1">微商城</p>
	                      	<p class="cleft_lims2">暂未开放,敬请期待</p>
	                     </a>
	                  </li>
	                  <li class="cleft_li">
	                  	<a href="/fengkong" class="cleft_a">
	                      	<p class="cleft_lims1">严格风控</p>
	                      	<p class="cleft_lims2">团队把关，多重审核</p>
	                     </a>
	                  </li>	                      
	                  <li class="cleft_li noborder">
	                  	<a href="/report" class="cleft_a">
	                      	<p class="cleft_lims1">运营报告</p>
	                      	<p class="cleft_lims2">平台数据,定期披露</p>
	                     </a>
	                  </li>
	              </ul>
	          </div>
	          <div class="contentright fr" >
	              <!-- 有奖注册 -->
	              <c:if test="${empty userinfo.user_name}">
	              <div class="contentright1" >
	                  <p class="contentright1ms1">12.5<span>%</span></p>
	                  <p class="contentright1ms2">预期利率</p>
	                  <a class="contentright1ms3" href="/user/reg">注册领188元红包</a>
	                  <p class="contentright1ms4">已有账号？<a href="/user/login">立即登录</a></p>
	              </div>
	              </c:if>
	              <!-- 我的账户 -->
	              <c:if test="${not empty userinfo.user_name}">
	              <div class="contentright2">
	                  	<img src="${cdnServer}/static/weipaidai/images/i01.png" class="contentright2img1">
					  	<c:if test="${not empty userinfo.acc_name}">
					  		<p class="contentright2ms2">您好，${userinfo.acc_name}</p>
					  	</c:if>	       
	                  <div class="contentright2ms3 clearfix pat10">
	                      <p class="contentright2ms3_1 fl">账户余额（元）</p>
	                      <p class="contentright2ms3_2 fr">${usermain.balance}</p>   
	                  </div>
	                  <div class="contentright2ms3 clearfix">
	                      <p class="contentright2ms3_1 fl">累计收益（元）</p>
	                      <p class="contentright2ms3_2 fr">${usermain.repay_shouyi}</p>   
	                  </div>
	              </div>
	              </c:if>
	              <!-- 下载APP轻松理财 -->
	              <a href="#" class="unloadapp"></a>
	          </div>  
	       	</div>                            
	    </div>
	    <!-- 最新公告 -->
	    <div class="page-cont">
			<div class="news-box">
				<div class="latest-news">
					<p class="hot-news ui-left"><i class="news-icon"></i><span class="news-span">最新动态：</span></p>
					<div id="Scroll1">	 	
						<ul class="ui-left J-sline">
							<c:forEach var="items" items="${dynamic.lists}"> 
								<li class="news-list" data-id="">
									<a href="/news/detail/${items.id}" target="_blank">${items.title}</a>
									<!-- <a href="/news/detail/${dynamic.lists[0].id}" target="_blank">${dynamic.lists[0].title}</a> -->
								</li>
							</c:forEach>						
						</ul>
					</div>			
					<p class="hot-news ui-left">
						<em class="news-line"></em>
						<a class="hot-notice" href="/news/detail/${notice.lists[0].id}" target="_blank">${notice.lists[0].title}</a>
					</p>					
				</div>	
			</div>
			<div class="statistic-data">
				<span class="pleft40">
					<i>截止${gettotaldata.lastUpdateTime}累计交易额</i>
					<em class="counter">${gettotaldata.total_amount}</em><sub>元</sub>
				</span>
				<span>
					<i>截止${gettotaldata.lastUpdateTime}累计收益</i>
					<em class="counter">${gettotaldata.total_income}</em><sub>元</sub>
				</span>
				<span>
					<i>截止${gettotaldata.lastUpdateTime}交易总笔数</i>
					<em class="counter">${gettotaldata.total_transaction}</em><sub>笔</sub>
				</span>
				<span>
					<i>截止${gettotaldata.lastUpdateTime}累计注册人数</i>
					<em class="counter">${gettotaldata.total_regs}</em><sub>人</sub>
				</span>	
			</div>
			<div class="hot-recommend">		
				<ul class="tj-list">
                    <li class="clearfix">
	                    <div class="img-con fl">		                        
	                        <img src="${cdnServer}/static/weipaidai/images/i06.png">                        
	                    </div>
	                    <div class="text-con fl">
							<p class="tj-list-title">更透明<i>·</i>信息披露</p>
							<p class="tj-list-desc">平台运营数据定期披露<br/>重要信息的完整披露</p>
	                    </div>
                	</li>
                    <li class="clearfix">
	                    <div class="img-con fl">		                        
	                        <img src="${cdnServer}/static/weipaidai/images/i07.png">                        
	                    </div>
	                    <div class="text-con fl">
							<p class="tj-list-title">更安全<i>·</i>严格风控</p>
							<p class="tj-list-desc">专业团队严格把关<br/>多重资质审核</p>
	                    </div>
	                </li>
	                <li class="clearfix">
	                    <div class="img-con fl">		                        
	                        <img src="${cdnServer}/static/weipaidai/images/i08.png">                        
	                    </div>
	                    <div class="text-con fl">
							<p class="tj-list-title">更安心<i>·</i>数据安全</p>
							<p class="tj-list-desc">百万级资金保障<br/>服务器与数据安全</p>
	                    </div>
	                </li>
	                <li class="clearfix">
	                    <div class="img-con fl">		                        
	                        <img src="${cdnServer}/static/weipaidai/images/i09.png">                        
	                    </div>
	                    <div class="text-con fl">
							<p class="tj-list-title">更便捷<i>·</i>随时随心</p>
							<p class="tj-list-desc">百万起投期限灵活<br/>微聚点滴生活</p>
	                    </div>
	                </li>
                </ul>
			</div>			
		</div>
		<!-- 新手标 -->
		<div class="page-cont">
			<c:forEach var="items" items="${productRecommend.lists}">
			<div class="new-standard clearfix">
				<div class="standard-info fl">
					<a href="/invest/detail/shut/${items.shut_id}" target="_blank">
						<div class="standard-icon">
							<img src="${cdnServer}/static/weipaidai/images/i18.png">
						</div>
						<p class="standard-title">${items.title}<span>限额限量&nbsp;&nbsp;抓紧抢购</span></p>
						<div class="pro-standard clearfix" data-id="${items.shut_id}">
							<div class="standard-income fl">
								<em>${items.his_rate}<sub>%</sub><c:if test="${items.other_rate!=''}"><sub>+${items.other_rate}%</sub></c:if></em>
								<span>预期利率</span>
							</div>
							<div class="standard-time fl">
								<c:if test="${items.interest_type == 1}">
			                        <em>${items.borrow_days}<sub>天</sub></em>
			                    </c:if>
			                    <c:if test="${items.interest_type == 2}">
			                        <em>${items.borrow_period}<sub>个月</sub></em>
			                    </c:if>
			                    <c:if test="${items.interest_type == 3}">
			                    	<em>${items.borrow_years}<sub>年</sub></em>
			                    </c:if>
								<span>项目期限</span>
							</div>
							<div class="standard-schedule fl">
								<em class="schedule-num">${items.completion_rate}%</em>				
								<div class="progress-bar">
									<p class="progress" data-width="${items.completion_rate}%"></p>
								</div>
								<p class="standard-text">投资进度</p>
							</div>
							<a href="/invest/detail/shut/${items.shut_id}" target="_blank">
								<p class="standard-btn" data-id="${items.borrow_nid}">立即购买</p>
							</a>
						</div>
					</a>
				</div>
				<div class="pro-introduce fr">
					<a href="/about" target="_blank">
						<img src="${cdnServer}/static/weipaidai/images/pro_introduce.png?v=20180703">
					</a>
				</div>					
			</div>
			</c:forEach>		
		</div>
	    <!-- 微年利 -->
		<div class="page-cont">
			<h2 class="page-title">
	        	微年利
	        	<em class="ui-line"></em>
	            <span>自主投资&nbsp;&nbsp;期限灵活</span>
	            <a class="fr ui-more" href="/invest/yearlist" target="_blank">更多<em class="iconfont"></em></a>
	        </h2>
	        <div class="page-con">	        	
		        <ul class="pro-box clearfix">
		       		<c:forEach var="items" items="${productwnl.lists}" varStatus="status">
			        	<c:if test="${status.index == '0'}" >        	
							<li class="pro-list" data-id="${items.shut_id}">
								<a href="/invest/detail/shut/${items.shut_id}" target="_blank">
									<p class="pro-title">${items.title}</p>
									<p class="pro-icon">已满标</p>
									<div class="pro-info clearfix">
										<div class="pro-income">
											<em>${items.his_rate}<sub>%</sub><c:if test="${items.other_rate!=''}"><sub>+${items.other_rate}%</sub></c:if></em>
											<span>预期利率</span>
										</div>
										<div class="pro-time">
											<c:if test="${items.interest_type == 1}">
						                        <em>${items.borrow_days}<sub>天</sub></em>
						                    </c:if>
						                    <c:if test="${items.interest_type == 2}">
						                        <em>${items.borrow_period}<sub>个月</sub></em>
						                    </c:if>
						                    <c:if test="${items.interest_type == 3}">
						                    	<em>${items.borrow_years}<sub>年</sub></em>
						                    </c:if>
											<span>项目期限</span>
										</div>
									</div>
									<div class="pro-schedule">
										<p class="schedule-text">投资进度：<em class="schedule-num">${items.completion_rate}%</em></p>
										<div class="progress-bar">
											<p class="progress" data-width="${items.completion_rate}%"></p>
										</div>
									</div> 
								</a>				
							</li>
						</c:if>
						<c:if test="${status.index == '1'}">
							<li class="pro-list pro-small-list" data-id="${items.shut_id}">
								<a href="/invest/detail/shut/${items.shut_id}" target="_blank">
									<p class="pro-title ">
										<!-- <i></i> -->
										<span>${items.title}</span>
										<!-- <i></i> -->
									</p>
									<div class="processingbar">
									 	<font class="processingbarfont">${wpd:getInt(items.completion_rate)}%</font>
									</div>
									<div class="pro-info  clearfix">
										<div class="pro-income">
											<em>${items.his_rate}<sub>%</sub><c:if test="${items.other_rate!=''}"><sub>+${items.other_rate}%</sub></c:if></em>
											<span>预期利率</span>
										</div>
									</div>
								</a>				
							</li>
						</c:if>
						<c:if test="${status.index == '2'}">
							<li class="pro-list pro-small-list" data-id="${items.shut_id}">
								<a href="/invest/detail/shut/${items.shut_id}" target="_blank">
									<p class="pro-title">
										<!-- <i></i> -->
										<span>${items.title}</span>
										<!-- <i></i> -->
									</p>
									<div class="processingbar">
									 	<font class="processingbarfont">${wpd:getInt(items.completion_rate)}%</font>
									</div>
									<div class="pro-info pro-info2 clearfix">
										<div class="pro-income">
											<em>${items.his_rate}<sub>%</sub><c:if test="${items.other_rate!=''}"><sub>+${items.other_rate}%</sub></c:if></em>
											<span>预期利率</span>
										</div>
									</div>
								</a>				
							</li>
						</c:if>
					</c:forEach> 
					<li class="pro-list pro-img-list nomright">
						<a href="/invest" target="_blank">
							<img data-src="${cdnServer}/static/weipaidai/images/zddy.png" class="zddy lazy">
						</a>				
					</li>
		        </ul>     
	        </div>
		</div>
		<!-- 微+系列 -->
		<div class="page-cont">
			<h2 class="page-title">
	        	微+系列
	        	<em class="ui-line"></em>
	            <span>自主投资&nbsp;&nbsp;期限灵活</span>
	            <a class="fr ui-more" href="/invest/pluslist" target="_blank">更多<em class="iconfont"></em></a>
	        </h2>
	        <div class="page-con">
				<ul class="pro-box clearfix">
					<c:forEach var="items" items="${product_default_ww_List.lists}">
						<li class="pro-list <c:if test="${wpd:getInt(items.completion_rate) == '100'}">active</c:if>">
							<a href="/invest/detail/shut/${items.shut_id}" target="_blank">
								<p class="pro-title">${items.title}</p>
								<p class="pro-icon">已满标</p>
								<div class="pro-info clearfix">
									<div class="pro-income">
										<em>${items.his_rate}<sub>%</sub><c:if test="${items.other_rate!=''}"><sub>+${items.other_rate}%</sub></c:if></em>
										<span>预期利率</span>
									</div>
									<div class="pro-time">
										<c:if test="${items.interest_type == 1}">
					                        <em>${items.borrow_days}<sub>天</sub></em>
					                    </c:if>
					                    <c:if test="${items.interest_type == 2}">
					                        <em>${items.borrow_period}<sub>个月</sub></em>
					                    </c:if>
					                    <c:if test="${items.interest_type == 3}">
					                    	<em>${items.borrow_years}<sub>年</sub></em>
					                    </c:if>
										<span>项目期限</span>
									</div>
								</div>
								<div class="pro-schedule">
									<p class="schedule-text">投资进度：<em class="schedule-num">${items.completion_rate}%</em></p>
									<div class="progress-bar">
										<p class="progress" data-width="${items.completion_rate}%"></p>
									</div>
								</div>							
							</a>				
						</li>
					</c:forEach> 
		        </ul>
	        </div>   
		</div> 
		<!-- 微月盈 -->
		<div class="page-cont mbt30">
			<h2 class="page-title">
	        	微月盈
	        	<em class="ui-line"></em>
	            <span>自主投资&nbsp;&nbsp;期限灵活</span>
	            <a class="fr ui-more" href="/invest/monthlist" target="_blank">更多<em class="iconfont"></em></a>
	        </h2>
	        <div class="page-con">
		        <ul class="pro-box clearfix">
		        	<c:forEach var="items" items="${monthList.lists}">
 						<li class="pro-list <c:if test="${wpd:getInt(items.completion_rate) == '100'}">active</c:if>">					<a href="/invest/detail/shut/${items.shut_id}" target="_blank">
								<p class="pro-title">${items.title}</p>
								<p class="pro-icon">已满标</p>
								<div class="pro-info clearfix">
									<div class="pro-income">
										<em>${items.his_rate}<sub>%</sub><c:if test="${items.other_rate!=''}"><sub>+${items.other_rate}%</sub></c:if></em>
										<span>预期利率</span>
									</div>
									<div class="pro-time">
										<c:if test="${items.interest_type == 1}">
					                        <em>${items.borrow_days}<sub>天</sub></em>
					                    </c:if>
					                    <c:if test="${items.interest_type == 2}">
					                        <em>${items.borrow_period}<sub>个月</sub></em>
					                    </c:if>
					                    <c:if test="${items.interest_type == 3}">
					                    	<em>${items.borrow_years}<sub>年</sub></em>
					                    </c:if>
										<span>项目期限</span>
									</div>
								</div>
								<div class="pro-schedule">
									<p class="schedule-text">投资进度：<em class="schedule-num">${items.completion_rate}%</em></p>
									<div class="progress-bar">
										<p class="progress" data-width="${items.completion_rate}%"></p>
									</div>
								</div>
							</a>				
						</li> 
					</c:forEach>
		        </ul>
		    </div>
		</div>

		<div class="site-notice">
			<!-- 最新动态 and 网站公告 -->
			<div class="newnotice clearfix">
				<div class="newnoticeleft fl">
					<p class="newnoticelms1">最新动态</p>
					<ul class="newnoticel_ul pat25">
						<c:forEach var="items" items="${dynamic.lists}">
							<li class="newnoticel_li clearfix" id="${items.id}">
								<a href="/news/detail/${items.id}" target="_blank">
									<span class="newnoticel_lims1 fl">${items.title}</span>
									<span class="newnoticel_lims2 fr">${items.addtime}</span>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="newnoticeleft fr">
					<p class="newnoticelms1">网站公告</p>
					<ul class="newnoticel_ul pat25">
						<c:forEach var="items" items="${notice.lists}">
							<li class="newnoticel_li clearfix" id="${items.id}">
								<a href="/news/detail/${items.id}" target="_blank">
									<span class="newnoticel_lims1 fl">${items.title}</span>
									<span class="newnoticel_lims2 fr">${items.addtime}</span>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div> 
			<!-- 合作机构  -->
			<div class="agencyc">
				<p class="agencycms1">合作机构</p>
				<ul class="agencyimgz clearfix">
					<a href="http://edit.lwinst.com/" target="_blank">
						<img data-src="${cdnServer}/static/weipaidai/images/hzjg/hz1.png">
					</a>
					<a href="http://www.zjfintech.com/" target="_blank">
						<img data-src="${cdnServer}/static/weipaidai/images/hzjg/hz2.png">
					</a>
					<a href="http://www.ec.org.cn/" target="_blank">
						<img data-src="${cdnServer}/static/weipaidai/images/hzjg/hz3.png">
					</a>
					<a href="https://www.wdzj.com/" target="_blank">
						<img data-src="${cdnServer}/static/weipaidai/images/hzjg/hz4.png">						
					</a>
					<a href="http://www.xinyzx.com/" target="_blank">
						<img data-src="${cdnServer}/static/weipaidai/images/hzjg/hz5.png">
					</a>
					<a href="http://www.jiayuan-law.com/" target="_blank">
						<img data-src="${cdnServer}/static/weipaidai/images/hzjg/hz6.png">
					</a>
					<a href="https://www.fuiou.com/" target="_blank">
						<img data-src="${cdnServer}/static/weipaidai/images/hzjg/hz7.png">
					</a>
				</ul>
			</div>	
		</div>
	</div>	
<%@ include file="../common/footer.jsp"%>

