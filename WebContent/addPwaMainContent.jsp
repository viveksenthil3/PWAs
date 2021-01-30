<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<style>
input[type=text], select, textarea {
  width: 25%;
  padding: 12px;
  border: 1px solid grey;
  border-radius: 4px;
}

input[type=submit] {
  background-color: #0099cc;
  color: white;
  padding: 12px 20px;
  border: 1px solid #0099cc;
  border-radius: 30px;
  cursor: pointer;
}

.container {
  border-radius: 5px;
  padding: 20px;
}

.col1 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col2 {
  float: left;
  width: 75%;
  margin-top: 6px;
}
</style>

<div style="height:100%; width:100%; background-color:white; display: flex; align-items: center; justify-content: center;">
<div class="container">
  <form method="post" action="">
 
    <div class="row">
      <div class="col1">
        <label  style="margin-left:150px">Category</label>
      </div>
      <div class="col2">
        <select name="category">
          <option value="entertainment">Entertainment</option>
          <option value="food">Food</option>
          <option value="fitness">Fitness</option>
          <option value="sports">Sports</option>
          <option value="education">Education</option>
        </select>
      </div>
    </div>
    <div class="row">
      <div class="col1">
        <label style="margin-left:150px">Name</label>
      </div>
      <div class="col2">
        <input type="text" name="name">
      </div>
    </div>
    <div class="row">
      <div class="col1">
        <label style="margin-left:150px">Description</label>
      </div>
      <div class="col2">
        <textarea name="description" style="height:100px"></textarea>
      </div>
    </div>
    <div class="row">
      <div class="col1">
        <label style="margin-left:150px">Link</label>
      </div>
      <div class="col2">
        <input type="text" name="link">
      </div>
    </div>
    <br>
    <div class="row">
      <input style="margin-left:600px"type="submit" value="Submit">
    </div>
  </form>
</div>

</div>