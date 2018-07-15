<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">

</script>

<div class="row">
    <div class="col-md-8">
        <div class="card">
            <div class="header">
                <h4 class="title">Producer Profile</h4>
                	<iframe width="720" height="360" src="https://www.youtube.com/embed/ISz0uPn1Tr0?rel=0&autoplay=1" frameborder="0"></iframe>
            </div>
            <div class="content">
                <div class="row">
                    <div class="col-md-5">
                        <div class="form-group">
                            <label>Company (disabled)</label>
                            <input type="text" class="form-control" disabled placeholder="Company" value="Creative Code Inc.">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>연락처</label>
                            <input type="text" class="form-control" placeholder="Username" value="010-0000-0000">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="exampleInputEmail1">이메일 주소</label>
                            <input type="email" class="form-control" placeholder="0000@naver.com">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>이름</label>
                            <input type="text" class="form-control" placeholder="Company" value="김재연">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>닉네임</label>
                            <input type="text" class="form-control" placeholder="Last Name" value="김재연">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>가입이유</label>
                            <input type="text" class="form-control" placeholder="Home Address" value="클래시오브클랜 정보!">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>주소</label>
                            <input type="text" class="form-control" placeholder="City" value="경기도 화성시 000 000">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>상세주소</label>
                            <input type="text" class="form-control" placeholder="Country" value="000동 000호">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>우편번호</label>
                            <input type="number" class="form-control" placeholder="00000">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>About Me</label>
                            <textarea rows="5" class="form-control" placeholder="Here can be your description" value="Mike">풀방타가 되는 그날까지!</textarea>
                        </div>
                    </div>
                </div>
                
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card card-user">
            <div class="image">
                <img src="images/bootstrap/full-screen-image-3.jpg" alt="..."/>
            </div>
            <div class="content">
                <div class="author">
                     <a href="#">
                    <img class="avatar border-gray" src="images/bootstrap/mainlogo.jpg" alt="..."/>
                      <h4 class="title">클래시오브클랜 포럼!!<br />
                         <small>게임 정보를 한눈에!</small>
                      </h4>
                    </a>
                </div>
                <p class="description text-center"> 클래시오브클랜을 사랑하는 <br>
                                   분들을 위한 클래시오브클랜 포럼<br><br>
               	게임내의 건물, 유닛 정보를 얻어가세요!<br>
               	이용자들끼리 정보를 공유해요!
                         
                </p>
            </div>
            <hr>
            <div class="text-center">
                <button href="#" class="btn btn-simple"><i class="fa fa-facebook-square"></i></button>
                <button href="#" class="btn btn-simple"><i class="fa fa-twitter"></i></button>
                <button href="#" class="btn btn-simple"><i class="fa fa-google-plus-square"></i></button>

            </div>
        </div>
    </div>

</div>