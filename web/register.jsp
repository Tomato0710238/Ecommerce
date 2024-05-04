
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Register</title>
        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.0.0/mdb.min.css"
            rel="stylesheet"
            />
        <style>
            #radius-shape-1 {
                height: 220px;
                width: 220px;
                top: -60px;
                left: -130px;
                background: radial-gradient(#44006b, #ad1fff);
                overflow: hidden;
            }

            #radius-shape-2 {
                border-radius: 38% 62% 63% 37% / 70% 33% 67% 30%;
                bottom: -60px;
                right: -110px;
                width: 300px;
                height: 300px;
                background: radial-gradient(#44006b, #ad1fff);
                overflow: hidden;
            }
        </style>
    </head>
    <body class="bg-dark text-white">
        <div class="container-fluid bg-secondary text-white text-center p-3 mb-3">
            <a href="${pageContext.request.contextPath}" class="h1 text-decoration-none">TT</a>
        </div>
        <section class="background-dark overflow-hidden">
            <div class="container px-5 py-4 px-md-5 text-center text-lg-start my-0">
                <div class="row gx-lg-5 align-items-center mb-5">
                    <div class="col-lg-6 mb-3 mb-lg-0" style="z-index: 10">
                        <h1 class=" display-5 fw-bold ls-tight">Register</h1>
                        <p class="mb-4 opacity-70" style="color: hsl(218, 81%, 85%)">
                            By signing in you have agreed with our <a href="#term">Term and Privacy</a>
                        </p>
                    </div>
                    <div class="col-lg-6 mb-5 mb-lg-0 position-relative">
                        <div id="radius-shape-1" class="position-absolute rounded-circle shadow-5-strong"></div>
                        <div id="radius-shape-2" class="position-absolute shadow-5-strong"></div>
                        <div class="card bg-glass">
                            <div class="card-body px-4 py-5 px-md-5">
                                <form action="sigup" method="post" autocomplete="off">
                                    <div class="form-outline mb-4" data-mdb-input-init>
                                        <input type="text" id="user" name="user" class="form-control" required/>
                                        <label class="form-label" for="user">User Name*</label>
                                    </div>
                                    <div class="form-outline mb-4" data-mdb-input-init>
                                        <input type="password" id="password" name="pass" class="form-control" required/>
                                        <label class="form-label" for="password">Password*</label>
                                    </div>
                                    <div class="form-outline mb-4" data-mdb-input-init>
                                        <input type="password" id="password" name="repass" class="form-control" required/>
                                        <label class="form-label" for="password">Repeat Password*</label>
                                    </div>
                                    <div style="color: red"><c:if test="${not empty mess}">${mess}</c:if></div>
                                    <div style="color: red"><c:if test="${not empty error}">${error}</c:if></div>

                            </div>
                            <p class="${requestScope.response_type ? 'text-success' : 'text-danger'}">
                                ${requestScope.response}
                            </p>
                            <button type="submit" class="btn btn-primary btn-block mb-4">
                                Sign up
                            </button>
                            <div class="text-center">
                                <p>or sign up with:</p>
                                <button type="button" class="btn btn-link btn-floating mx-1">
                                    <i class="fab fa-facebook-f"></i>
                                </button>
                                <button type="button" class="btn btn-link btn-floating mx-1">
                                    <i class="fab fa-google"></i>
                                </button>
                                <button type="button" class="btn btn-link btn-floating mx-1">
                                    <i class="fab fa-twitter"></i>
                                </button>
                                <button type="button" class="btn btn-link btn-floating mx-1">
                                    <i class="fab fa-github"></i>
                                </button>
                            </div>
                            <hr>
                            <div class="text-center">
                                <p>Already have an account ? <a href="Login">Sign in</a></p>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.0.0/mdb.umd.min.js"
    ></script>
</body>
</html>
