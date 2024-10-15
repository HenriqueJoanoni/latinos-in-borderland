<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="/partials/header.jsp" %>
<main class="container container-fluid">
    <div class="mt-2">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>ID</th>
                <th>Player Name</th>
                <th>Player Age</th>
                <th>Player Gender</th>
                <th>Player Occupation</th>
                <th colspan="2">Actions</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>123</td>
                <td>Player Test</td>
                <td>19</td>
                <td>Male</td>
                <td>Tramp</td>
                <td>
                    <button type="button" class="btn btn-success">View Info</button>
                    <button type="button" class="btn btn-danger">Delete Player</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</main>
</body>
<script src="assets/js/bootstrap.js"></script>
</html>
