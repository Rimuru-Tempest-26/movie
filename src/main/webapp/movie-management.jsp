<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Movie Management</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
      integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <style>
    	label, .dataTables_info, input, #movieTable_previous, #movieTable_next, .dataTables_empty{
    		color: white !important;
    	}
    </style>
  </head>
  <body class="bg-secondary">
   <c:import url="adminHeader.jsp"></c:import>

    <div class="d-flex mt-2 mb-2" style="margin-top: 80px !important;">
      <c:import url="adminSidebar.jsp"></c:import>

      <div class="w-75 rounded me-2 bg-dark p-4" style="margin-left: 390px !important;">
        <div class="d-flex justify-content-between align-items-center mb-4">
          <h3 class="text-white mb-0">Movies List</h3>
          <c:url value="/admin/movie/add" var="addMovie"></c:url>
          <a href="${ addMovie }" class="btn btn-success">Add New Movie</a>
        </div>
        <table id="movieTable" class="table table-striped text-white table-hover">
          <thead>
            <tr>
              <th>#</th>
              <th>Name</th>
              <th>Release Date</th>
              <th>Control</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${ movies }" var="m">
            	<tr>
	              <td class="text-white">${ m.id }</td>
	              <td class="text-white">${ m.name }</td>
	              <td class="text-white">${ m.releaseDate }</td>
	              <td>
	              	<c:url value="/admin/movie/add" var="movieEdit">
	                	<c:param name="movieId" value="${ m.id }"></c:param>
	                </c:url>
	                <a href="${ movieEdit }" class="btn btn-warning btn-sm">Edit</a>
	                <c:url value="/admin/movie/delete" var="movieDelete">
	                	<c:param name="movieId" value="${ m.id }"></c:param>
	                </c:url>
	                <a href="${ movieDelete }" class="btn btn-danger btn-sm">Delete</a>
	                <c:url value="/admin/movie/detail" var="movieDetail">
	                	<c:param name="movieId" value="${ m.id }"></c:param>
	                </c:url>
	                <a href="${ movieDetail }" class="btn btn-secondary btn-sm">Detail</a>
	              </td>
	            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
	<script>
	$(document).ready( function () {
	    $('#movieTable').DataTable();
	} );
	</script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
