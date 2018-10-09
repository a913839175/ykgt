<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="sidebar" id="sidebar">
    <ul class="sidebar-items">
        <li class="sidebar-list <c:if test="${type=='introduce'}">on</c:if>">
            <a class="sidebar-a" href="/introduce" target="_self">
                <span>关于我们</span>
                <i></i>
            </a>
        </li>
        <li class="sidebar-list <c:if test="${type=='news'}">on</c:if>">
            <a class="sidebar-a" href="/news" target="_self">
                <span>企业动态</span>
                <i></i>
            </a>
        </li>
        <li class="sidebar-list <c:if test="${type=='organizational'}">on</c:if>">
            <a class="sidebar-a" href="/organizational" target="_self">
                <span>组织架构</span>
                <i></i>
            </a>
        </li>     
        <%-- <li class="sidebar-list <c:if test="${type=='chronice'}">on</c:if>">
            <a class="sidebar-a" href="/chronice" target="_self">
                <span>大事记</span>
                <i></i>
            </a>
        </li> --%>
        <li class="sidebar-list <c:if test="${type=='fengkong'}">on</c:if>">
            <a class="sidebar-a" href="/fengkong" target="_self">
                <span>风险控制</span>
                <i></i>
            </a>
        </li>
        <li class="sidebar-list <c:if test="${type=='certificate'}">on</c:if>">
            <a class="sidebar-a" href="/certificate" target="_self">
                <span>资质证书</span>
                <i></i>
            </a>
        </li>
        <li class="sidebar-list <c:if test="${type=='partner'}">on</c:if>">
            <a class="sidebar-a" href="/partner" target="_self">
                <span>合作伙伴</span>
                <i></i>
            </a>
        </li>
        <li class="sidebar-list <c:if test="${type=='contactus'}">on</c:if>">
            <a class="sidebar-a" href="/contactus" target="_self">
                <span>联系我们</span>
                <i></i>
            </a>
        </li>
        <%-- <li class="sidebar-list <c:if test="${type=='rates'}">on</c:if>">
            <a class="sidebar-a" href="/rates" target="_self">
                <span>收费标准</span>
                <i></i>
            </a>
        </li>
        <li class="sidebar-list <c:if test="${type=='coverage'}">on</c:if>">
            <a class="sidebar-a" href="/coverage" target="_self">
                <span>媒体报道</span>
                <i></i>
            </a>
        </li> --%>  
    </ul>
</div>
