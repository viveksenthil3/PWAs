<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<div style="height:6em; width:100%; background-color:white; display:flex; justify-content: center; align-items: center;">
	<div class="searchBox">
	<div class="searchAreaContainer"><input placeholder="Search for PWAs" type="text" name="query"></div>
	<div class="searchBtnContainer"><i class="material-icons">search</i></div>
	</div>
</div>

<style>
	.searchBox{
		border-radius:.4em;
		border: solid rgb(0, 0, 0, 0.2) 1px;
		height: 3em;
		width: 60%;
		background-color: white;
		padding: 0 0 0 1em;
		display: flex;
	}
	
	.searchAreaContainer{
		flex:15;		
	}
	
	.searchAreaContainer input{
		width: 100%;
		height: 100%;
		border: none;
	}
	
	.searchAreaContainer input:focus{
		outline: none;
	}
	
	.searchBtnContainer{
		flex:1;
		display: flex;
		justify-content: center;
		align-items: center;
		cursor: pointer;
	}
	
	.searchBtnContainer i{
		color: grey;
	}
	
</style>