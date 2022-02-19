<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="admin.do">홈페이지 관리</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto me-0 me-md-3 my-2 my-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">회원</div>
                            <a class="nav-link" href="member.do">
                                <div class="sb-nav-link-icon"><i class="bi bi-person-circle"></i></div>
                                휴면 및 탈퇴
                            </a>
                            <a class="nav-link" href="index.jsp">
                                <div class="sb-nav-link-icon"><i class="bi bi-exclamation-circle"></i></div>
                                블랙리스트 
                            </a>
                            <a class="nav-link" href="index.jsp">
                                <div class="sb-nav-link-icon"><i class="bi bi-gem"></i></div>
                                포인트 관리
                            </a>
                            
                            
                            <div class="sb-sidenav-menu-heading">메뉴 및 식당</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="bi bi-clipboard-check"></i></div>
                                메뉴 추천 
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.jsp">룰렛 관리</a>
                                    <a class="nav-link" href="layout-sidenav-light.jsp">월드컵 관리</a>
                                </nav>
                            </div>
                            <a class="nav-link" href="index.jsp">
                                <div class="sb-nav-link-icon"><i class="bi bi-signpost-2"></i></div>
                                식당 정보
                            </a>
                            
                            <div class="sb-sidenav-menu-heading">커뮤니티 게시판</div>
                            <a class="nav-link" href="index.jsp">
                                <div class="sb-nav-link-icon"><i class="bi bi-layout-text-window-reverse"></i></div>
                                리뷰 관리
                            </a>
                            <a class="nav-link" href="index.jsp">
                                <div class="sb-nav-link-icon"><i class="bi bi-chat-square-dots"></i></div>
                                댓글 관리
                            </a>
                            <a class="nav-link" href="index.jsp">
                                <div class="sb-nav-link-icon"><i class="bi bi-stack"></i></div>
                                VS투표 관리
                            </a>
                            
                            <div class="sb-sidenav-menu-heading">밥알</div>
                            <a class="nav-link" href="index.jsp">
                                <div class="sb-nav-link-icon"><i class="bi bi-coin"></i></div>
                                포인트 관리
                            </a>
                            
                            <div class="sb-sidenav-menu-heading">상점</div>
                            <a class="nav-link" href="index.jsp">
                                <div class="sb-nav-link-icon"><i class="bi bi-shop"></i></div>
                                아이템 관리
                            </a>
                           
                           
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Authentication
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.jsp">Login</a>
                                            <a class="nav-link" href="register.jsp">Register</a>
                                            <a class="nav-link" href="password.jsp">Forgot Password</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        Error
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.jsp">401 Page</a>
                                            <a class="nav-link" href="404.jsp">404 Page</a>
                                            <a class="nav-link" href="500.jsp">500 Page</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                           
                </nav>