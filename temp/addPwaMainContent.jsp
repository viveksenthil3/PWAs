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
  <form method="post" enctype='multipart/form-data' action="addPWA">
 
    <div class="row">
      
      <div class="input-field col s7">
        <select name="category">
          <option value="entertainment">Entertainment</option>
          <option value="food">Food</option>
          <option value="fitness">Fitness</option>
          <option value="sports">Sports</option>
          <option value="education">Education</option>
        </select>
        <label>category</label>
      </div>
      
      <div class="input-field col s7">
        <input type="text" name="name">
        <label>Name</label>
      </div>
      
      <div class="input-field col s7">
        <textarea name="description" style="height:100px"></textarea>
        <label>Description</label>
      </div>
      
      <div class="input-field col s7">
        <input type="file" name="logo">
        <label>Logo</label>
      </div>
      
      <input type="hidden" name="samplePicsCount" value="4">  
      
      <div class="input-field col s7">
        <input type="file" name="sample1">
        <label>Sample Pics</label>
      </div>
      
      <div class="input-field col s7">
        <input type="file" name="sample1">
        <label>Sample Pics</label>
      </div>
      
      <div class="input-field col s7">
        <input type="file" name="sample1">
        <label>Sample Pics</label>
      </div>
      
      <div class="input-field col s7">
        <input type="file" name="sample1">
        <label>Sample Pics</label>
      </div>
      
      <div class="input-field col s7">
        <input type="text" name="link">
        <label>Link</label>
      </div>
      
      <div class="input-field col s7">
        <input style="margin-left:600px" type="submit" value="submit">
      </div>
      
    
    </div>
  </form>
</div>

</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('select');
    var instances = M.FormSelect.init(elems, options);
    console.log("hi");
  });
</script>