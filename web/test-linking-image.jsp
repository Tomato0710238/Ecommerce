<%-- 
    Document   : test-linking-image
    Created on : May 4, 2024, 10:46:44 AM
    Author     : hi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" /><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <title>JSP Page</title>
  </head>
  <body>
    <h4 class="text-center">View Uploaded Product</h4>
    <div class="container-fluid text-center px-3 m-0">
      <div class="m-auto mb-3">
        <table class="table table-borderless">
          <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Description</th>
            <th>Category Id</th>
          </tr>
          <tr>
            <td>${requestScope.p.id}</td>
            <td>${requestScope.p.name}</td>
            <td>${requestScope.p.price}</td>
            <td>${requestScope.p.quantity}</td>
            <td>${requestScope.p.description}</td>
            <td>${requestScope.p.category_id}</td>
          </tr>
        </table>
      </div>
      <div class="p-0 mx-auto d-flex justify-content-center align-items-start "
           style="max-width: 1200px;">
        <a href="${requestScope.p.image}">
          <img class="rounded-3 bg-secondary shadow-lg" id="previewImage" src="${requestScope.p.image}" alt="">
        </a>
      </div>
      <style>
        img {
          max-width: 100%;
          max-height: 70vh;
        }
      </style>
    </div>
  </body>
</html>