<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		<!-- Nav -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0"
            	 style="display: flex; justify-content: space-between;">
            
            	<div>
                <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                </div>
                
                <!-- <form class="d-none d-md-flex ms-4">
                    <input class="form-control border-0" type="search" placeholder="Search">
                </form> -->
                
                <div>
                <a class="navbar-brand" id="navbarBrand" href="/dndn/main.do">
					<img src="/dndn/resources/img/logo_edit.png" class="mt-1 mb-2" style="height:80px; margin-left: 110px;">			
				</a>
				</div>
                
                <div class="navbar-nav align-items-center">
                	
                  	<div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <img class="rounded-circle me-lg-2" src="/dndn/resources/img/admin/pro.png" alt="" style="width: 40px; height: 40px;">
                            <span class="d-none d-lg-inline-flex">관리자</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
	                        <form method="POST" action="/dndn/auth/logout.do">
	                    		<li><div class="nav-item"><button class="nav-link" style="margin-left:20px;">로그아웃</button></div></li>
	                    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        </div>
					</form>
                    </div>
                </div>
                
            </nav>
            <!-- Navbar End -->
