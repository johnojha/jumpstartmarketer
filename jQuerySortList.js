// This function runs as soon as the DOM is ready for manipulation, and assigns event handlers to various elements of the page.
$(document).ready(function() {
   		//Makes the list sortable.
		$("#sortableList").sortable({ items: "li", sort: sortComplete });
		
		//Assigns a mousedown event to all elements with the class "sortableItem"
		$(".sortableItem").mousedown (function () {
				//Add the class that gives the item a gray border
				$(this).addClass("selectedItem");						
			});
		
		$(".sortableItem").mouseout (function () {
				//Remove the class that gives the item a gray border							   
				$(this).removeClass("selectedItem");				
			});
		
		//Initial run of the sortComplete function
		//sortComplete(0);
		initialOrder();
		
 });  //end of document.ready function

//This function runs the first time the page loads
function initialOrder() {
	//Reset the value of the text/hidden form field with the id of "itemIds"
	$("#itemIds").val("");
	//Find each element with the class "sortableItem" in the element with the id of "sortableList"
	$("#sortableList").find(".sortableItem").each(function(i) {
			   //Determine if the value of the text/hidden form field that records the list of element ids in order is empty
			   if ($("#itemIds").val()== "")
			   	{
			   		//Write the id of the current item to the value of the text/hidden form field with the id of "itemIds"
					$("#itemIds").val($(this).attr("id"));
			   	}
			   	else
			   	{
			   		//Write the current value of the text/hidden form field with the id of "itemIds" and the id of the current item to the value of the text/hidden form field with the id of "itemIds"
					$("#itemIds").val($("#itemIds").val()+","+$(this).attr("id"));
			   	}
		   });
}  //end of initialOrder


//This function runs anytime a sort event ends
function sortComplete() {
	//Reset the value of the text/hidden form field with the id of "itemIds"
	$("#itemIds").val("");
	//Find each element with the class "sortableItem" in the element with the id of "sortableList"
	$("#sortableList").find(".sortableItem").each(function(i) {
			   //Determine if the value of the text/hidden form field that records the list of element ids in order is empty
			   if ($("#itemIds").val()== "")
			   	{
			   		//Write the id of the current item to the value of the text/hidden form field with the id of "itemIds"
					$("#itemIds").val($(this).attr("id"));
			   	}
			   	else
			   	{
			   		//Write the current value of the text/hidden form field with the id of "itemIds" and the id of the current item to the value of the text/hidden form field with the id of "itemIds"
					$("#itemIds").val($("#itemIds").val()+","+$(this).attr("id"));
			   	}
		   });
	
	//The sortComplete patch works, but the id of the element that was moved gets added to the end of the list, so we have to remove it.
	var currentList= $("#itemIds").val();
	var currentArray= currentList.split(',');
	var newList= "";
	for (i =0; i < (currentArray.length-1); i++)
		{
			if (newList== "")
				{
					newList= currentArray[i];
				}
			else
				{
					newList= newList + "," + currentArray[i];	
				}
		}
	
	$("#itemIds").val(newList);
		
		
};  //end of sortComplete function

