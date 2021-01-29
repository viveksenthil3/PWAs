<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<div style="height:6em; width:100%; background-color:white; display:flex; justify-content: center; align-items: center;">
	<div class="searchBox">
		<div class="searchAreaContainer"><input id="searchInput" onkeyup="getSuggestions()" placeholder="Search for PWAs" type="text" name="query"></div>
		<div class="searchBtnContainer"><i class="material-icons">search</i></div>
	</div>
	
	<div class="suggestionsContainer"></div>
</div>


<div class="searchBoxOuter" style="display: none;"></div>


<% String url = request.getContextPath()+"/search"; %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	const URL = "<%= request.getContextPath() %>"
	
	let hideSuggestions = _=>{
		$(".suggestionsContainer").hide();
		$(".searchBoxOuter").hide();
		$(".searchBox").removeClass("searchBoxActive");
	}
	
	let showSuggestions = _=>{
		$(".suggestionsContainer").show();
		$(".searchBoxOuter").show();
		$(".searchBox").addClass("searchBoxActive");
	}
	
	let getSuggestions = ()=>{
		
		
		if($("#searchInput").val()==""){
			hideSuggestions();
			return;
		}
			
		
		$.post("<%= url %>", {
			name:$("#searchInput").val()
		}).done(
		function(pwas, status){			
			
			$(".suggestionsContainer").html("");
			showSuggestions();
			pwas.forEach(pwa=>{
				$(".suggestionsContainer").append("<a href='"+URL+"/detailedView?pwaId="+pwa.pwaId+"'><div class='suggestion' pwaId='"+pwa.pwaId+"'>	<div class='suggestionImgContainer'><img alt='' src='"+URL+"/samplePics/"+pwa.pwaId+"-logo.png'></div>	<div class='suggestionPwaName'>"+pwa.name+"</div>	</div>	</a>");
				
			})
			
			if(pwas.length==0)
				$(".suggestionsContainer").append("<div class='suggestion'>	<div class='suggestionImgContainer'><img alt='' src='"+URL+"/images/notFound.svg'></div>	<div class='suggestionPwaName'>No PWAs found</div>	</div>	");
		})
	}
	
	$(".searchBoxOuter").click(_=>{
		hideSuggestions();
	});
	
</script>

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
	
	.searchBoxActive{
		border: none;
		box-shadow: 0px 10px 50px  rgb(0, 0, 0, 0.2);
		z-index: 50;
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
	
	.suggestionsContainer{
		position: absolute;
		top:4.2em;
		width: 50%;
		height: fit-content;
		background-color: white;
		box-shadow: 0px 50px 50px rgb(0, 0, 0, 0.2);
		border-radius: 0 0 .3em .3em;
		
		display: flex;
		flex-direction: column;
		
		z-index: 50;
		
	}
	
	.suggestionsContainer a{
		color: black;
	}
	
	.suggestionsContainer a:hover{
		text-decoration: none;
	}
	
	.suggestion{
		width: 100%;
		height: 3em;
		margin: .3em 0;
		background-color: pin;
		padding: 0 1em;
		cursor: pointer;
		display: flex;		
	}
	
	.suggestion:hover{
		background-color: rgb(0, 0, 0, 0.1);
	}
	
	.suggestionImgContainer{
		flex: 1;
		height: 100%;
		display: flex;
	    justify-content: center;
	    align-items: center;
	}
	
	.suggestionImgContainer img{
	    width: 30px;
    	height: 30px;
   	    border-radius: .3em;
	}
	
	.suggestionPwaName{
		flex: 15;
		height: 100%;
		padding: 1em 0;
   		font-size: 13px;
	}
	
	.searchBoxOuter{
		width: 100%;
	    top: 0;
	    left: 0;
	    position: absolute;
	    height: 100%;
	    
	    z-index: 20;
	}
	
</style>