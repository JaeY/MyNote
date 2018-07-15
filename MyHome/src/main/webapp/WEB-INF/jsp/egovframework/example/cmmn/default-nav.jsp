<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<nav class="navbar navbar-default">
        <div class="container-fluid">
			<div class="navbar-minimize">
				<button id="minimizeSidebar" class="btn btn-warning btn-fill btn-round btn-icon">
					<i class="fa fa-ellipsis-v visible-on-sidebar-regular"></i>
					<i class="fa fa-navicon visible-on-sidebar-mini"></i>
				</button>
			</div>
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">클래시오브클랜 포럼</a>
            </div>
            <div class="collapse navbar-collapse">

                

                <ul class="nav navbar-nav navbar-right">
                
                	<li prop="menu" class="text-danger" id="egovLoginUsr">
                		<a href="#" onclick="javascript:left.pageSubmitFn('control')">
                		<c:if test="${loginVO.id == '11111'}">
                		<i class="pe-7s-user">회원관리</i>
                		</c:if>
                		</a>
                	</li>
                	
                	
                	
                    <li prop="menu" class="text-danger" id="egovLoginUsr">
                               <a href="#" onclick="javascript:left.pageSubmitFn('egovLoginUsr')">
                               <c:if test="${loginVO != null}">
										${loginVO.id }님 환영합니다.
									</c:if>
									<c:if test="${loginVO == null }">
										로그인
									</c:if>
                               </a>
                	</li>
                	 <li prop="menu" class="active" id="serverSideMenu">
                            	<a href="#" onclick="javascript:left.pageSubmitFn('serverSideMenu')">
                            	<c:if test="${loginVO == null }">
										회원가입
									</c:if>
                            	</a>
                     </li>
                	
                             

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-gavel"></i>
                            <p class="hidden-md hidden-lg">
                                Actions
                                <b class="caret"></b>
                            </p>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Create New Post</a></li>
                            <li><a href="#">Manage Something</a></li>
                            <li><a href="#">Do Nothing</a></li>
                            <li><a href="#">Submit to live</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Another Action</a></li>
                        </ul>
                    </li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-bell-o"></i>
                            <span class="notification">5</span>
                            <p class="hidden-md hidden-lg">
								Notifications
								<b class="caret"></b>
							</p>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Notification 1</a></li>
                            <li><a href="#">Notification 2</a></li>
                            <li><a href="#">Notification 3</a></li>
                            <li><a href="#">Notification 4</a></li>
                            <li><a href="#">Another notification</a></li>
                        </ul>
                    </li>

                    <li class="dropdown dropdown-with-icons">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-list"></i>
                            <p class="hidden-md hidden-lg">
								More
								<b class="caret"></b>
							</p>
                        </a>
                        <ul class="dropdown-menu dropdown-with-icons">
                            <li>
                                <a href="#">
                                    <i class="pe-7s-mail"></i> Messages
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="pe-7s-help1"></i> Help Center
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="pe-7s-tools"></i> Settings
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#">
                                    <i class="pe-7s-lock"></i> Lock Screen
                                </a>
                            </li>
                            <li>
                                <a href="#" class="text-danger">
                                    <i class="pe-7s-close-circle"></i>
                                    <c:if test="${loginVO != null}">
										${loginVO.id }님 환영합니다. <a href="#" onclick="javascript:left.pageSubmitFn('egovLoginUsr')"><i class="pe-7s-close-circle"></i>로그아웃</a>
									</c:if>
									<c:if test="${loginVO == null }">
										로그인
									</c:if>
                                </a>
                            </li>                          
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>