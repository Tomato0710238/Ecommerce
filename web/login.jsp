
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
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
      <div class="container px-4 py-4 px-md-5 text-center text-lg-start my-3">
        <div class="row gx-lg-5 align-items-center mb-5">
          <div class="col-lg-12 mb-3 mb-lg-0" style="z-index: 10">
            <h1 class=" display-5 fw-bold ls-tight">Sign in</h1>
            <!--            <p class="mb-4 opacity-70" style="color: hsl(218, 81%, 85%)">
                          By signing in you have agreed with our <a href="#">Term and Privacy</a>
                        </p>-->
          </div>
          <div class="col-lg-8 mb-5 justify-content-center mb-lg-0 position-relative">
            <div class="card bg-glass">
              <div class="card-body px-4 py-5 px-md-5">
                <form action="login" method="post">
                  <div class="form-outline mb-4" data-mdb-input-init>
                      <input type="text" id="form3Example3" class="form-control ${requestScope.flag1 ? 'is-valid' : 'is-invalid'}" name="user" value="${cookie.user.value}"/>
                    <label class="form-label" for="form3Example3">User Name</label>
                  </div>
                  <div class="form-outline mb-4" data-mdb-input-init>
                    <input type="password" id="form3Example4" class="form-control ${requestScope.flag2 ? 'is-valid' : 'is-invalid'}" name="pass" value="${cookie.password.value}"/>
                    <label class="form-label" for="form3Example4">Password</label>
                  </div>
                    <div style="color: red"><c:if test="${not empty error}">${error}</c:if></div>
                  <div class="form-check d-flex justify-content-center mb-4">
                    <input class="form-check-input me-2" name="remember" type="checkbox" value="1" id="form2Example33"
                           ${cookie.user.value != null ? 'checked' : ''}/>
                    <label class="form-check-label" for="form2Example33">Remember me</label>
                  </div>
                  <p class="${requestScope.response_type ? 'text-success' : 'text-danger'}">
                    ${requestScope.response}
                  </p>
                  <button type="submit" class="btn btn-primary btn-block mb-4">Sign in</button>
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
                    <p>Don't have an account ? <a href="register.jsp">Sign up</a></p>
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
