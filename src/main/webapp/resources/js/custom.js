/**
 * Contains custom JavaScript code
 */
var urlHolder = new Object();

function loadTable() {
	$.get(urlHolder.records, function(response) {
		
 		$('#tableUsers').find('tbody').remove();
 		
 		for (var i=0; i<response.users.length; i++) {
			var row = '<tr>';
                        
			row += '<td><input type="radio" name="index" id="index" value="'+i+'"></td>';
                        row += '<td>' + response.users[i].username + '</td>';
			row += '<td>' + response.users[i].firstName + '</td>';
			row += '<td>' + response.users[i].lastName + '</td>';
                        row += '<td>' + response.users[i].phone + '</td>';
			
                       
			
			row += '</tr>';
	 		$('#tableUsers').append(row);
 		}
 		
 		$('#tableUsers').data('model', response.users);
		toggleForms('hide'); ;
 	});
}

function submitNewRecord() {
	$.post(urlHolder.add, {
			username: $('#newUsername').val(),
			firstName: $('#newFirstName').val(),
			lastName: $('#newLastName').val(),
                        phone: $('#newPhone').val(),
			
		}, 
		function(response) {
			if (response != null) {
				loadTable();
				toggleForms('hide'); ;
				toggleCrudButtons('show');
				alert('Kullanici Kaydı Başarılı!');
			} else {
				alert('Kayıt Sırasında Bir Hata Oluştu!');
			}
		}
	);	
}

function submitDeleteRecord() {
	var selected = $('input:radio[name=index]:checked').val();
	
	$.post(urlHolder.del, {
			username: $('#tableUsers').data('model')[selected].username
		}, 
		function(response) {
			if (response == true) {
				loadTable(urlHolder.records);
				alert('Kullanıcı Silme Başarılı!');
			} else {
				alert('Silme Sırasında Bir Hata Oluştu!');
			}
		}
	);
}

function submitUpdateRecord() {
	$.post(urlHolder.edit, {
			username:$('#editUsername').val(),
			firstName: $('#editFirstName').val(),
			lastName: $('#editLastName').val(),
                        phone: $('#editPhone').val(),
			
		}, 
		function(response) {
			if (response != null) {
				loadTable();
				toggleForms('hide'); ;
				toggleCrudButtons('show');
				alert('Kullanıcı Başarılı Şekilde Düzenlendi.');
			} else {
				alert('Kullanıcı Düzenlenirken Hata Oluştu');
			}
		}
	);
}



function hasSelected() {
	var selected = $('input:radio[name=index]:checked').val();
	if (selected == undefined) { 
		alert('Önce Geçerli Bir Kayıt Seçiniz');
		return false;
	}
	
	return true;
}

function fillEditForm() {
	var selected = $('input:radio[name=index]:checked').val();
	$('#editUsername').val( $('#tableUsers').data('model')[selected].username );
	$('#editFirstName').val( $('#tableUsers').data('model')[selected].firstName );
	$('#editLastName').val( $('#tableUsers').data('model')[selected].lastName );
        $('#editPhone').val( $('#tableUsers').data('model')[selected].phone );
	
}

function resetNewForm() {
	
	 $('#newUsername').val('');
	$('#newFirstName').val('');
	$('#newLastName').val('');
        $('#newPhone').val('');
	
}

function resetEditForm() {
        
         $('#editFirstName').val('');
         $('#editLastName').val('');
         $('#editPhone').val('');
	
}

function toggleForms(id) {
	if (id == 'hide') {
		$('#newForm').hide();
		$('#editForm').hide();
		
	} else if (id == 'new') {
 		resetNewForm();
 		$('#newForm').show();
 		$('#editForm').hide();
 		
	} else if (id == 'edit') {
 		resetEditForm();
 		$('#newForm').hide();
 		$('#editForm').show();
	}
}

function toggleCrudButtons(id) {
	if (id == 'show') {
		$('#newBtn').removeAttr('disabled');
		$('#editBtn').removeAttr('disabled');
		$('#deleteBtn').removeAttr('disabled');
		$('#reloadBtn').removeAttr('disabled');
		
	} else if (id == 'hide'){
		$('#newBtn').attr('disabled', 'disabled');
		$('#editBtn').attr('disabled', 'disabled');
		$('#deleteBtn').attr('disabled', 'disabled');
		$('#reloadBtn').attr('disabled', 'disabled');
	}
}
