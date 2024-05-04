<%-- 
    Document   : upload_product
    Created on : Apr 30, 2024, 10:58:56 AM
    Author     : hi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" /><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <title>JSP Page</title>
  </head>
  <body>
    <h4 class="text-center">Upload Product</h4>
    <div class="container-fluid text-center px-3 m-0">
      <div class="col-md-6 m-auto mb-3">
        <form class="form-outline" action="UploadProduct" method="post" enctype="multipart/form-data">
          <input type="text" class="form-control col-lg-9" name="name" placeholder="Name">
          <input type="number" class="form-control col-lg-9" name="price" placeholder="Price">
          <input type="number" class="form-control col-lg-9" name="quantity" placeholder="Quantity">
          <textarea class="form-control col-lg-9" rows="3" name="description" placeholder="Description" maxlength="500"></textarea>
          <input type="file" class="form-control col-lg-9" id="imageInput" name="image" accept="image/*" required accesskey="u">
          <button class="btn btn-outline-success col-lg-9"type="submit">Submit</button>
        </form>
      </div>
      <div class="p-0 mx-auto d-flex justify-content-center align-items-start "
           style="max-width: 1200px;">
        <img class="rounded-3 bg-secondary shadow-lg" id="previewImage" src="../images/${p.image}" alt="">
      </div>
      <style>
        img {
          max-width: 100%;
          max-height: 70vh;
        }
      </style>
    </div>
    <script>
      const imageInput = document.getElementById('imageInput');
      const previewImage = document.getElementById('previewImage');
      imageInput.addEventListener('change', function () {
        const file = this.files[0];
        if (file) {
          const reader = new FileReader();
          reader.onload = function (e) {
            previewImage.src = e.target.result;
          }
          reader.readAsDataURL(file);
        } else {
          previewImage.src = '#';
        }
      });
      document.addEventListener('keydown', function (event) {
        if (event.key === 'u') {
          document.getElementById('imageInput').click();
        }
      });
    </script>
  </body>
</html>
